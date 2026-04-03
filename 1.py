import pygame, sys
from pygame.locals import *

pygame.init()

screen = pygame.display.set_mode((800,600))
screen.fill((255,255,0))
pygame.display.set_caption("Hello world")
while True:
    for event in pygame.event.get():
        if event.type == QUIT:
            pygame.quit()
            sys.exit()
        elif event.type == pygame.MOUSEBUTTONDOWN:
            x,y=event.pos
            pygame.draw.circle(screen, (42,28,100),(x,y), 30)
    font=pygame.font.Font('simhei.ttf', 15)
    text= font.render("hello world! this is pygame game engine", True, (255,255,0))
    text_rect=text.get_rect(center=(400,100))
    text= font.render("can you uncover the secrets of this page?", True, (255,255,0))
    text_rect=text.get_rect(center=(400,200))
    screen.blit(text, text_rect)

    pygame.draw.line(screen, (178,58,174), (0,300),(800,300))

    pygame.draw.circle(screen, (42,28,100),(400,400), 60)
    pygame.display.update()


    