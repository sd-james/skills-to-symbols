# -*- coding: utf-8 -*-
"""
Created on Sun Feb 16 17:51:33 2014

@author: gdk
"""
import math

import pygame
from domain.cell_types import OPEN_SPACE, WALL, LADDER
from pygame.locals import *
from domain.scale import xscale
from domain.scale import yscale

from domain.objects import door, key, handle, goldcoin, bolt
import os

base_dir = os.path.dirname(os.path.realpath(__file__))



BACKGROUND_SPRITE = 0
WALL_SPRITE = 1
LADDER_SPRITE = 2
DOOR_CLOSED_SPRITE = 3
DOOR_OPEN_SPRITE = 4
KEY_SPRITE = 5
COIN_SPRITE = 6
BOLT_OPEN_SPRITE = 7
BOLT_CLOSED_SPRITE = 8
HERO_SPRITE = 9
HANDLE_SPRITE = 10
HANDLE_SHAFT_SPRITE = 11

class drawer:
    def __init__(self, md):
        self.md = md
        self.screen = pygame.display.set_mode((self.md.width, self.md.height), DOUBLEBUF)
        self.images = self.load_sprites()
        
    def load_sprites(self):
        images = [None] * 12
        
        ladder = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/ladder.png').convert_alpha(), (xscale, yscale))
        images[LADDER_SPRITE] = ladder
        
        background = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/background.png').convert_alpha(), (xscale, yscale))
        images[BACKGROUND_SPRITE] = background
        
        wallpic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/wall.png').convert_alpha(), (xscale, yscale))
        images[WALL_SPRITE] = wallpic
        
        goldpic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/gold.png').convert_alpha(), (xscale, yscale))
        images[COIN_SPRITE] = goldpic
        
        keypic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/key.png').convert_alpha(), (xscale, yscale))
        images[KEY_SPRITE] = keypic
        
        heropic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/hero.png').convert_alpha(), (xscale, yscale))
        images[HERO_SPRITE] = heropic
        
        opendoorpic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/open-door.png').convert_alpha(), (xscale, yscale))
        images[DOOR_OPEN_SPRITE] = opendoorpic 
        
        closeddoorpic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/closeddoor.png').convert_alpha(), (xscale, yscale))
        images[DOOR_CLOSED_SPRITE] = closeddoorpic 
        
        openboltpic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/bolt-open.png').convert_alpha(), (xscale, yscale))
        images[BOLT_OPEN_SPRITE] = openboltpic 
        
        closedboltpic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/bolt-locked.png').convert_alpha(), (xscale, yscale))
        images[BOLT_CLOSED_SPRITE] = closedboltpic
        
        handlepic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/handle-base.png').convert_alpha(), (xscale, yscale))
        images[HANDLE_SPRITE] = handlepic
        
        handleshaftpic = pygame.transform.scale(pygame.image.load(base_dir + '/sprites/handle-shaft.png').convert_alpha(), (xscale//2, yscale))
        images[HANDLE_SHAFT_SPRITE] = handleshaftpic
        
        return images
        
    def draw_domain(self):
                    
        self.screen.fill((0, 0, 0))        
        
        for i in range(0, self.md.cell_height):
            for j in range(0, self.md.cell_width):
                if(self.md.description[i][j] == WALL):
                    self.screen.blit(self.images[WALL_SPRITE], (j*xscale, i*yscale))
                elif(self.md.description[i][j] == LADDER):
                    self.screen.blit(self.images[LADDER_SPRITE], (j*xscale, i*yscale))
                elif(self.md.description[i][j] == OPEN_SPACE):
                    self.screen.blit(self.images[BACKGROUND_SPRITE], (j*xscale, i*yscale))
                        
        for obj in self.md.objects:
            self.draw_object(obj, self.screen)
                     
        self.screen.blit(self.images[HERO_SPRITE], (self.md.playerx - xscale/2, self.md.playery))
        pygame.display.flip()

    def draw_background_to_surface(self):
        draw_surf = pygame.Surface((self.md.width, self.md.height))
        draw_surf.fill((0, 0, 0))   
        
        for i in range(0, self.md.cell_height):
            for j in range(0, self.md.cell_width):
                if(self.md.description[i][j] == WALL):
                    draw_surf.blit(self.images[WALL_SPRITE], (j*xscale, i*yscale))
                elif(self.md.description[i][j] == LADDER):
                    draw_surf.blit(self.images[LADDER_SPRITE], (j*xscale, i*yscale))
                elif(self.md.description[i][j] == OPEN_SPACE):
                    draw_surf.blit(self.images[BACKGROUND_SPRITE], (j*xscale, i*yscale))
                    
        return draw_surf                    
                    
    def draw_to_surface(self):
               
        draw_surf = self.draw_background_to_surface()                
       
        for obj in self.md.objects:
            self.draw_object(obj, draw_surf)
                     
        draw_surf.blit(self.images[HERO_SPRITE], (self.md.playerx - xscale/2, self.md.playery))

        return draw_surf
        
    def blit_alpha(self, target, source, location, opacity):
        x = location[0]
        y = location[1]
        temp = pygame.Surface((source.get_width(), source.get_height())).convert()
        temp.blit(target, (-x, -y))
        temp.blit(source, (0, 0))
        temp.set_alpha(opacity)        
        target.blit(temp, location)        
        
    def blend(self, surf, alpha_objs, alpha_player):

        new_surf = pygame.Surface((self.md.width, self.md.height), pygame.SRCALPHA, 32)
        new_surf.convert_alpha()
        for obj in self.md.objects:
            if(isinstance(obj, handle)):
                angle = ((math.pi/2.0)*obj.get_angle()) + math.pi/4.0
                r = yscale * 0.75        
                startpos = (obj.x + xscale/2, obj.y + yscale)
                endpos = (int(startpos[0] + (r*math.cos(angle))), int(startpos[1] - (r*math.sin(angle))))        
            
                pygame.draw.line(new_surf, (47,79,79), startpos, endpos, 5)     
                pygame.draw.circle(new_surf, (255, 0, 0), endpos, int(xscale/10), 0)
                surf.blit(self.images[HANDLE_SPRITE], (obj.x, obj.y))
            else:
                self.draw_object(obj, new_surf)
        self.blit_alpha(surf, new_surf, (0, 0), int(255 * alpha_objs))
                     
        self.blit_alpha(surf, self.images[HERO_SPRITE], (self.md.playerx - xscale/2, self.md.playery), int(255 * alpha_player))

    def draw_to_file(self, fname):
        
        draw_surf = self.draw_to_surface()
        pygame.image.save(draw_surf, fname)
    

    def draw_object(self, obj, surf):        

        if(obj.x < 0):
            return
                
        if(isinstance(obj, door)):
            img = self.images[DOOR_OPEN_SPRITE]
            if(obj.door_closed()):
                img = self.images[DOOR_CLOSED_SPRITE]
            surf.blit(img, (obj.x, obj.y))
        elif(isinstance(obj, key)):
            surf.blit(self.images[KEY_SPRITE], (obj.x, obj.y))
        elif(isinstance(obj, goldcoin)):
            surf.blit(self.images[COIN_SPRITE], (obj.x, obj.y))
        elif(isinstance(obj, bolt)):
            img = self.images[BOLT_OPEN_SPRITE]
            if(obj.get_locked()):
                img = self.images[BOLT_CLOSED_SPRITE]
            surf.blit(img, (obj.x, obj.y))
        elif(isinstance(obj, handle)):
            angle = ((math.pi/2.0)*obj.get_angle()) + math.pi/4.0
            r = yscale * 0.75        
                    
            startpos = (obj.x + xscale/2, obj.y + yscale)
            endpos = (int(startpos[0] + (r*math.cos(angle))), int(startpos[1] - (r*math.sin(angle))))        
            
            pygame.draw.line(surf, (47,79,79), startpos, endpos, 5)     
            pygame.draw.circle(surf, (255, 0, 0), endpos, int(xscale/10), 0)
            surf.blit(self.images[HANDLE_SPRITE], (obj.x, obj.y))
        else:
            print("unknown object during draw")
            print(type(obj).__name__)