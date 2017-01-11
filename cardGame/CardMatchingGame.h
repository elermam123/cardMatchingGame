//
//  CardMatchingGame.h
//  cardGame
//
//  Created by Elerman on 21.10.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype) initWithCardCount:(NSUInteger) count
                        usingDeck:(Deck*) deck;
-(void)chooseCardAtIndex:(NSUInteger) index;
-(Card*) cardAtIndex:(NSUInteger) index;

@property(nonatomic, readonly) NSInteger score;
@property (nonatomic, readwrite) NSUInteger countOtherCards;


@end
