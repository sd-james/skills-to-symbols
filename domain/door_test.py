# -*- coding: utf-8 -*-
"""
Created on Wed Feb 12 00:46:20 2014

@author: gdk
"""
from domain.mine_domain import mine_domain
from domain.objects import door

if __name__ == "__main__":

    md = mine_domain('domain.txt', 'domain-objects.txt')
    d1 = door(1, 1, True)
    d2 = door(1, 1, False)
    
    f = open('domain-out.txt', 'w')
    
    d1.update_map(md.map)

    for row in md.map:
        for col in row:
            f.write(col)
        f.write('\n')

    f.write('\n\n')
        
    d2.update_map(md.map)
    
    for row in md.map:
        for col in row:
            f.write(col)
        f.write('\n')
        
    f.close()
        
        