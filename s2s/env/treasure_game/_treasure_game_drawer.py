import pygame

from gym_treasure_game.envs._treasure_game_impl._treasure_game_drawer import _TreasureGameDrawer as Drawer

__author__ = 'Steve James and George Konidaris'


class _TreasureGameDrawer(Drawer):

    def __init__(self, md, display_screen=False):
        super().__init__(md, display_screen=display_screen)
        self.frames = list()
        pygame.font.init()

    def draw_domain(self, show_screen=True):
        super().draw_domain(show_screen=False)  # do not show it there, because we will do so below!
        if show_screen:
            myfont = pygame.font.SysFont('Courier', 28)
            text = 'Total actions: {0:04}'.format(self.md.total_actions)
            textsurface = myfont.render(text, False, (255, 255, 255))
            self.screen.blit(textsurface, (self.md.width - textsurface.get_size()[0] - 10, 10))
            pygame.display.flip()
            self.frames.append(self.screen.copy())
