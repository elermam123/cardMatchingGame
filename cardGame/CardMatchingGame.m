//
//  CardMatchingGame.m
//  cardGame
//
//  Created by Elerman on 21.10.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray* cards;
@property (nonatomic, strong) NSMutableArray *faceUpCards;

@end

@implementation CardMatchingGame

-(NSMutableArray*) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck {
    
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
        }
    }
    
    return self;
}


-(Card*) cardAtIndex:(NSUInteger)index{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

static const int MISSMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


-(void) chooseCardAtIndex:(NSUInteger)index{
    Card* card = [self cardAtIndex:index];
    if(!card.isMatched){
        if (card.isChosen) {
            card.chosen = NO;
        }
        else{
            //match against other chosen cards
            
            self.faceUpCards= [[NSMutableArray alloc] initWithArray:@[card]];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [self.faceUpCards insertObject:otherCard atIndex:0];
                    //---------------- decision on match
                    if ([self.faceUpCards count] == (self.countOtherCards)) {
                        int matchScore = [card match:self.faceUpCards];
                        if (matchScore) {
                            self.score += matchScore * MATCH_BONUS;
                            for (Card *faceUpCard in self.faceUpCards) {
                                faceUpCard.matched =YES;
                            }
                            
                        } else {
                            self.score -= MISSMATCH_PENALTY;
                            for (Card *faceUpCard in self.faceUpCards) {
                                if (faceUpCard != card) faceUpCard.chosen =NO;
                            }
                        }
                        break;
                    } //--------------- end of decision on match
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(void)setCountOtherCards:(NSUInteger)countOtherCards{
    _countOtherCards = countOtherCards >= 2 ? countOtherCards : 2;
}


@end
