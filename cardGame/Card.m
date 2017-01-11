//
//  Card.m
//  cardGame
//
//  Created by Elerman on 12.10.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "Card.h"

@interface Card()

@end


@implementation Card


- (int) match:(NSArray *)otherCards{
    
    int score = 0;
    
    for(Card* card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
        else {
            score = 0;
        }
    }
    
    return score;
    
}

@end
