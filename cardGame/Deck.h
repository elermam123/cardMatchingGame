//
//  Deck.h
//  cardGame
//
//  Created by Elerman on 12.10.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card*)card atTop:(BOOL)atTop;
- (void) addCard:(Card*)card ;


- (Card*) drawRandomCard;

@end
