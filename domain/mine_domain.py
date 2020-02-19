# -*- coding: utf-8 -*-
import random

import pygame
from domain.actions import ACTION_NOP, ACTION_UP, ACTION_DOWN, ACTION_LEFT
from domain.actions import ACTION_RIGHT, ACTION_JUMP, ACTION_INTERACT
from domain.cell_types import OPEN_SPACE, WALL, DOOR, LADDER
from domain.move_options import down_left_option
from domain.move_options import down_right_option
from domain.move_options import go_left_option, go_right_option
from domain.move_options import interact_option
from domain.move_options import jump_left_option
from domain.move_options import jump_right_option
from domain.move_options import up_ladder_option, down_ladder_option
from domain.objects import door, key, handle, goldcoin, bolt
from pygame.locals import *
from domain.scale import xscale, yscale

from domain import mine_domain_drawer

JUMP_REWARD = -5
STEP_REWARD = -1


def frange(x, y, jump=1):
  while x < y:
    yield x
    x += jump

class mine_domain:
    
    def __init__(self, domain_file, object_file, interaction_file):
        
        self.description = self.get_file_description(domain_file)
        self.map = self.build_map()
        self.objects = self.read_objects(object_file)
        self.extract_interactives(interaction_file)

        (self.playerx, self.playery) = self.player_initial_position()

        self.player_bag = []

        self.x_incr = xscale / 10
        self.y_incr = yscale / 10
        self.jump_ticker = 0
        self.player_width = xscale/2
        self.player_height = yscale
        
        self.total_actions = 0

    def extract_interactives(self, fname):
        self.doors = []
        self.handles = []
        self.bolts = []
        
        for obj in self.objects:
            if(isinstance(obj, door)):
                self.doors.append(obj)
            elif(isinstance(obj, handle)):
                self.handles.append(obj)
            elif(isinstance(obj, bolt)):
                self.bolts.append(obj)
                
        f = open(fname, 'r')
        
        for line in f:
            if(line.strip()):
                (type1, index1, bool1, type2, index2, bool2) = line.split()
                bool1 = bool1 == 'True'
                bool2 = bool2 == 'True'
                index1 = int(index1)
                index2 = int(index2)
                                
                first_list = None
                second_list = None
                
                if(type1 == 'handle'):
                    first_list = self.handles
                elif(type1 == 'bolt'):
                    first_list = self.bolts
                elif(type1 == 'door'):
                    first_list = self.doors
                    
                if(type2 == 'door'):
                    second_list = self.doors
                elif(type2 == 'handle'):
                    second_list = self.handles
                elif(type2 == 'bolt'):
                    second_list = self.bolts
                
                first_list[index1].set_trigger(bool1, second_list[index2], bool2)
        
        f.close()

    def read_objects(self, object_file):
        f = open(object_file, 'r')
        
        o_list = []
        
        tcx = self.cell_width
        tcy = self.cell_height
        
        for line in f:
            if(line.startswith('door')):
                words = line.split()
                cx = int(words[1])
                cy = int(words[2])
                closed = False
                if(words[3] == 'True'):
                    closed = True
                d = door(cx, cy, tcx, tcy, self.map, closed)
                o_list.append(d)
            elif(line.startswith("key")):
                words = line.split()
                cx = int(words[1])
                cy = int(words[2])
                k = key(cx, cy, tcx, tcy)
                o_list.append(k)
            elif(line.startswith("bolt")):
                words = line.split()
                cx = int(words[1])
                cy = int(words[2])
                locked = (words[3] == 'True')
                b = bolt(cx, cy, tcx, tcy, locked)
                o_list.append(b)
            elif(line.startswith("gold")):
                words = line.split()
                cx = int(words[1])
                cy = int(words[2])
                g = goldcoin(cx, cy, tcx, tcy)
                o_list.append(g)
            elif(line.startswith("handle")):
                words = line.split()
                cx = int(words[1])
                cy = int(words[2])
                up = (words[3] == 'True')
                left_facing = (cx > self.cell_width / 2)
                h = handle(cx, cy, tcx, tcy, up, left_facing)
                o_list.append(h)
                
        
        f.close()
        return o_list

    def player_initial_position(self):

        noise_offset_x = int(random.gauss(0, xscale/24))
        noise_offset_y = int(abs(random.gauss(0, yscale/36)))

        for y in range(0, self.cell_height):
            for x in range(0, self.cell_width):
                if(self.description[y][x] != WALL):
                    return ((x*xscale) + (xscale/2) + noise_offset_x, (y*yscale) + noise_offset_y)
                    
        return(0, 0)

    def get_file_description(self, fname):
        f = open(fname, 'r')
        
        lines = f.readlines()
        desc = []
        
        for line in lines:
            cells = []
            line = str.strip(line)
            for c in line:
                cells.append(c)
                
            desc.append(cells)
        
        f.close()

        self.cell_width = len(desc[0])
        self.cell_height = len(desc)

        self.width = self.cell_width * xscale
        self.height = self.cell_height * yscale        
        
        return desc
        
    def build_map(self):

        retmap = []      
            
        for y in range(0, self.cell_height):
            row_so_far = []
            for x in range(0, self.cell_width):
                pos_char = [self.description[y][x]] * xscale
                row_so_far = row_so_far + pos_char
            for yz in range(0, yscale):
                retmap.append(row_so_far)
        
        return retmap
       
    def object_type_at(self, x, y):
        
        if((x >= self.width) or (x < 0)):
            return WALL
        if((y >= self.height) or (y < 0)):
            return WALL
            
        return self.map[int(y)][int(x)]
        
    def object_type_at_cell(self, xc, yc):
        x = (xc*xscale) + (xscale/2)
        y = (yc*yscale) + (yscale/2)
        return self.object_type_at(x, y)        
        
    def up_clear(self):
        for xoff in [-self.x_incr, 0, self.x_incr]:
            for yoff in frange(-self.y_incr, 0):
                if(self.object_type_at(self.playerx + xoff, self.playery + yoff) != OPEN_SPACE):
                    return False

        return True    
    
    def can_go_up(self):

        if self.playery <= 1:
            return False
        
        for yoff in [-self.y_incr,  0, yscale - self.y_incr]:
            for xoff in [-self.player_width/2, self.player_width/2]:
                if(self.object_type_at(self.playerx + xoff, self.playery + yoff) == LADDER):
                    return True
                
        return False
    
    def can_go_down(self):
        for yoff in frange(0, yscale + self.y_incr):
            for xoff in [-self.player_width/2, self.player_width/2]:
                if(self.object_type_at(self.playerx + xoff, self.playery + yoff) == LADDER):
                    return True
        return False
    
    def can_go_left(self):    
        
        for yoff in [self.y_incr, yscale-self.y_incr]:
            if(self.object_type_at(self.playerx - (self.player_width/2) - self.x_incr, self.playery + yoff) == WALL):
                return False
            if(self.object_type_at(self.playerx - (self.player_width/2) - self.x_incr, self.playery + yoff) == DOOR):
                return False
        
        return True

    def can_go_right(self):    
        
        for yoff in [self.y_incr, yscale-self.y_incr]:
            # TODO WHY OFFSET??
            yoff = 0
            if(self.object_type_at(self.playerx + (self.player_width/2) + self.x_incr, self.playery + yoff) == WALL):
                return False
            if(self.object_type_at(self.playerx + (self.player_width/2) + self.x_incr, self.playery + yoff) == DOOR):
                return False
        
        return True  
           
    def can_fall(self):
        for xoff in [-self.player_width/2 + 2, -2 + self.player_width/2]:
            for yoff in [0, yscale]:
                if(self.object_type_at(self.playerx + xoff, self.playery + yoff) != OPEN_SPACE):
                    return False
        return True        
        
    def step(self, action):
        
        xdelta = 0
        ydelta = 0        
        
        self.total_actions = self.total_actions + 1        
        
        if(action == ACTION_UP):
            if(self.can_go_up()):
                ydelta = self.noisy(-self.y_incr)
                
        elif(action == ACTION_DOWN):
            if(self.can_go_down()):
                ydelta = self.noisy(self.y_incr) 
                
        elif(action == ACTION_LEFT):
            if(self.can_go_left()):
                xdelta =  self.noisy(-self.x_incr)
            
        elif(action == ACTION_RIGHT):
            if(self.can_go_right()):
                xdelta = self.noisy(self.x_incr)
            
        elif(action == ACTION_JUMP):
            if((not self.can_go_down()) and (self.up_clear())):
                self.jump_ticker = 22
                if(random.random() > 0.25):
                    self.jump_ticker = 23
                
        elif(action == ACTION_INTERACT):
            for obj in self.objects:
                if(obj.near_enough(self.playerx, self.playery + yscale/2)):
                    if(isinstance(obj, handle)):                    
                        obj.flip()
                    elif(isinstance(obj, bolt)):
                        if(self.player_got_key()):
                            self.try_unlock(obj)                                    
                            self.drop_key()
        
        if(self.jump_ticker > 0):
            if(self.up_clear()):
                ydelta = -self.y_incr
            self.jump_ticker = self.jump_ticker - 1
        elif(self.can_fall()):
            self.jump_ticker = 0
            ydelta = self.y_incr
            
        self.playerx = self.playerx + xdelta
        
        if(self.can_fall() and (ydelta > 0)):
            while(ydelta > 0):
                self.playery = self.playery + 1
                ydelta = ydelta - 1
                if(not self.can_fall()):
                    ydelta = 0
        else:
            self.playery = self.playery + ydelta
        
        for obj in self.objects:
            if(isinstance(obj, key) or isinstance(obj, goldcoin)):
                if(obj.near_enough(self.playerx, self.playery + yscale/2)):
                    obj.move_to(self.cell_width - 1 - len(self.player_bag), self.cell_height - 1)
                    self.player_bag.append(obj)
             
        if(action == ACTION_JUMP):
            return JUMP_REWARD
        else:
            return STEP_REWARD

    def noisy(self, val):
        between_val = val / 2.0
        if(val < between_val):
            return int(round(random.uniform(val, between_val)))
        else:
            return int(round(random.uniform(between_val, val)))

    def get_state(self):
        state_vec = []
        
        state_vec.append(float(self.playerx) / self.width)
        state_vec.append(float(self.playery) / self.height)
        
        for obj in self.objects:
            if(obj.has_state()):
                state_vec = state_vec + obj.get_state()
                
        return state_vec

    def get_state_descriptors(self):
        
        state_desc = []
        state_desc.append('playerx')
        state_desc.append('playery')
        handle_no = 1

        for obj in self.objects:
            if(obj.has_state()):
                vec = obj.get_state_descriptors()
                tname = type(obj).__name__
                
                # There are two handles, so number them.
                if(tname == 'handle'):
                    tname = tname + str(handle_no)
                    handle_no = handle_no + 1
                    
                for v in vec:
                    state_desc.append(tname + '.' + v)
                
        return state_desc

    def player_got_key(self):
        for obj in self.player_bag:
            if(isinstance(obj, key)):
                return True
        return False
        
    def player_got_goldcoin(self):
        for obj in self.player_bag:
            if(isinstance(obj, goldcoin)):
                return True
        return False
        
    def try_unlock(self, obj):
        #if(random.random() > 0.3):
        obj.unlock()
            
    def drop_key(self):
        for obj in self.player_bag:
            if(isinstance(obj, key)):
                self.player_bag.remove(obj)
                obj.move_to(-1, -1)
                return

    def get_player_cell(self):
        xc = int(self.playerx / xscale)
        yc = int((self.playery + (yscale/2)) / yscale)
        
        return (xc, yc)

    def init_with_state(self, state):
        desc = self.get_state_descriptors()
        
        # Fill in the blanks
        st = self.get_state()        
        for v in range(0, len(st)):
            if(state[v] == -99):
                state[v] = st[v]
        
        self.playerx = int(state[desc.index("playerx")] * self.width)
        self.playery = int(state[desc.index("playery")] * self.height)       
        
        handle_no = 1        
        
        for obj in self.objects:
            if(obj.has_state()):
                if(isinstance(obj, goldcoin) or isinstance(obj, key)):
                    x_label = type(obj).__name__ + ".x"
                    y_label = type(obj).__name__ + ".y"
                    xval = int(state[desc.index(x_label)] * self.width)
                    yval = int(state[desc.index(y_label)] * self.height)
                    obj.move_to_xy(xval, yval)                    
                elif(isinstance(obj, handle)):
                    label = 'handle' + str(handle_no) + '.angle'
                    angle = state[desc.index(label)]
                    obj.set_angle(angle)
                    obj.previously_triggered = True
                    handle_no = handle_no + 1
                elif(isinstance(obj, bolt)):
                    val = (state[desc.index("bolt.locked")] > 0.5)
                    obj.set_val(val)                

        for obj in self.objects:
            if(isinstance(obj, handle)):
                self.previously_triggered = False


def create_options(md, drawer = None):
    
    go_left = go_left_option(md, drawer)
    go_right = go_right_option(md, drawer)
    up_ladder = up_ladder_option(md, drawer)
    down_ladder = down_ladder_option(md, drawer)
    interact = interact_option(md, drawer)
    down_left = down_left_option(md, drawer)
    down_right = down_right_option(md, drawer)
    jump_left = jump_left_option(md, drawer)
    jump_right = jump_right_option(md, drawer)

    option_list = [go_left, go_right, up_ladder, down_ladder, interact, down_left, down_right, jump_left, jump_right]
    option_names = [o.__class__.__name__ for o in option_list]
    
    return (option_list, option_names)

if __name__ == "__main__":

    pygame.init()
    md = mine_domain('domain.txt', 'domain-objects.txt', 'domain-interactions.txt')
    drawer = mine_domain_drawer.drawer(md)

    clock = pygame.time.Clock() 
    pygame.key.set_repeat()
    
    keep_going = True

    x = md.playerx
    y = md.playery   
    
    saved_state = md.get_state()
    
    go_left = go_left_option(md, drawer)
    go_right = go_right_option(md, drawer)
    up_ladder = up_ladder_option(md, drawer)
    down_ladder = down_ladder_option(md, drawer)
    interact = interact_option(md, drawer)
    down_left = down_left_option(md, drawer)
    down_right = down_right_option(md, drawer)
    jump_left = jump_left_option(md, drawer)
    jump_right = jump_right_option(md, drawer)
    
    last_enter = pygame.time.get_ticks()
    last_space = pygame.time.get_ticks()
    last_ladder = pygame.time.get_ticks()
            
    min_delay = 1000.0*0.5    
        
    while keep_going:
        
        clock.tick(30)
     
        inpt = pygame.key.get_pressed()
     
        if(inpt[K_q]):
            keep_going = False
        elif(inpt[K_LEFT]):
            md.step(ACTION_LEFT)
        elif(inpt[K_RIGHT]):
            md.step(ACTION_RIGHT)
        elif(inpt[K_UP]):
            md.step(ACTION_UP)
        elif(inpt[K_DOWN]):
            md.step(ACTION_DOWN)
        elif(inpt[K_SPACE]) and (last_space + min_delay < pygame.time.get_ticks()):
            md.step(ACTION_JUMP)
            last_space = pygame.time.get_ticks()
        elif(inpt[K_RETURN]) and (last_enter + min_delay < pygame.time.get_ticks()):
            if(interact.can_run()):
                interact.run()
            else:
                print("Interact can't run.")   
            #md.step(ACTION_INTERACT)
            last_enter = pygame.time.get_ticks()
        elif(inpt[K_l]):
            if(go_left.can_run()):
                go_left.run()
            else:
                print("Go-Left can't run.")
        elif(inpt[K_r]):
            if(go_right.can_run()):
                go_right.run()
            else:
                print("Go-Right can't run.")
        elif(inpt[K_u]) and (last_ladder + min_delay < pygame.time.get_ticks()):
            if(up_ladder.can_run()):
                up_ladder.run()
            else:
                print("Up-Ladder can't run.")
            last_ladder = pygame.time.get_ticks()
        elif(inpt[K_d]) and (last_ladder + min_delay < pygame.time.get_ticks()):
            if(down_ladder.can_run()):
                down_ladder.run()
            else:
                print("Down-ladder can't run.")
            last_ladder = pygame.time.get_ticks()
        elif(inpt[K_f]):
            if(down_left.can_run()):
                down_left.run()
            else:
                print("Down-left can't run.")
        elif(inpt[K_g]):
            if(down_right.can_run()):
                down_right.run()
            else:
                print("Down-right can't run.")
        elif(inpt[K_j]):
            if(jump_left.can_run()):
                jump_left.run()
            else:
                print("Jump-left can't run.")
        elif(inpt[K_k]):
            if(jump_right.can_run()):
                jump_right.run()
            else:
                print("Jump-right can't run.")
        elif(inpt[K_s]):
            
            state = md.get_state()
            names = md.get_state_descriptors()

            for i in range(0, len(names)):
                print(names[i] + ": " + str(state[i]))
            print('')
            
        elif(inpt[K_p]):
            # Utility print.
            print(str(md.playerx) + ", " + str(md.playery))
            
            for obj in md.objects:
                if(isinstance(obj, bolt)):
                    print(str(obj.x) + ", " + str(obj.y))
                    #obj.near_enough_print(md.playerx, md.playery + yscale/2)
        elif(inpt[K_t]):
            print(str(md.total_actions) + " primitive actions executed so far.")
        elif(inpt[K_w]):
            drawer.draw_to_file("../screen-cap.png")
        elif(inpt[K_z]):
            saved_state = md.get_state()
        elif(inpt[K_m]):
            md.init_with_state(saved_state)
        else:
            md.step(ACTION_NOP)           
             
        drawer.draw_domain()

        pygame.event.clear()
        
    pygame.display.quit()