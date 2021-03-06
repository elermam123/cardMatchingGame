//
//  PlayingCard.m
//  cardGame
//
//  Created by Elerman on 12.10.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards{
    
    int score = 0;
    
    int numMatches = 0;
    if ([otherCards count] > 0)
    {
        for (int i = 0; i < [otherCards count]; i++) {
            id otherCard1 = otherCards[i];
            if ([otherCard1 isKindOfClass:[PlayingCard class]])
            {
                PlayingCard *card1 = (PlayingCard *)otherCard1;
                
                for (int j = i+1; j < [otherCards count]; j++) {
                    id otherCard2 =otherCards[j];
                    if ([otherCard2 isKindOfClass:[PlayingCard class]])
                    {
                        PlayingCard *card2 =(PlayingCard *)otherCard2;
                        // check for the same suit
                        if ([card1.suit isEqualToString:card2.suit]) {
                            score += 1;
                            numMatches++;
                        }
                        // check for the same rank
                        if (card1.rank == card2.rank) {
                            score += 4;
                            numMatches++;
                        }
                    }
                }
                break;
            }
        }
        
        if (numMatches < [otherCards count] -1)
            score = 0;
    }
    
    return score;
    
}



- (NSString*) contents{
    NSArray* rankStrings = [PlayingCard validRanks];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

@synthesize suit = _suit;

+(NSArray*) validSuits{
    return @[@"♣︎", @"♠︎", @"♥︎",@"♦︎"];
}

+(NSArray*) validRanks{
    return @[@"?", @"A", @"2", @"3",@"4", @"5", @"6", @"7", @"8", @"9",@"10", @"J", @"Q", @"K"];
}

-(void)setSuit:(NSString *)suit{

    if([ [PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *) suit{
    
    return _suit ? _suit : @"?";
}

+ (NSUInteger) maxRank{
    return [[self validRanks] count]-1;
}

- (void) setRank:(NSUInteger)rank{
    if (rank<=[PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
