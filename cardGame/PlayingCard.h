//
//  PlayingCard.h
//  cardGame
//
//  Created by Elerman on 12.10.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;

+(NSArray*) validSuits;

+(NSUInteger) maxRank;

@end
