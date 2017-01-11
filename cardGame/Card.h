//
//  Card.h
//  cardGame
//
//  Created by Elerman on 12.10.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString * contents;

@property (nonatomic, getter=isMatched) BOOL matched;
@property (nonatomic, getter=isChosen) BOOL chosen;

- (int) match:(NSArray*)otherCards;

@end
