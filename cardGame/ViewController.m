//
//  ViewController.m
//  cardGame
//
//  Created by Elerman on 12.10.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (strong, nonatomic) CardMatchingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeGameSwitcher;


@end

@implementation ViewController

-(CardMatchingGame*) game{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
        
        _game.countOtherCards = [self countOtherCards];
    }
    return _game;
}

- (NSUInteger)countOtherCards
{
    return self.typeGameSwitcher.selectedSegmentIndex+2;
}


-(Deck*) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)resetGameButton:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
    self.typeGameSwitcher.enabled = YES;
}

- (IBAction)typeGameSwitch:(UISegmentedControl *)sender {
    self.game = nil;
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    long int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    self.typeGameSwitcher.enabled = NO;
}

-(void) updateUI{
    
    for (UIButton* cardButton in self.cardButtons) {
        long int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]  forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    }
    
    
}

-(NSString*) titleForCard:(Card*)card{
    return card.isChosen ? card.contents : @"" ;
}

-(UIImage*) backgroundImageForCard : (Card*) card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}




@end
