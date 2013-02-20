//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Paris Kapsouros on 2/2/13.
//  Copyright (c) 2013 Paris Kapsouros. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
//outlet - controller talks to the view through outlets
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipresultLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) NSMutableArray *flipResult;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController

- (CardMatchingGame *) game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void) updateUI;
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected]; 
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled]; //epeidi pio katw allazoume to state. to ui button kai o titlos tou theloun allagi gia kathe allagh toy state.

        cardButton.selected = card.isFaceUp;

        cardButton.enabled = !card.isUnplayable;

        cardButton.alpha = (card.isUnplayable ? 0.3 : 1);
    }
    


    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.game.score];
    
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    
    self.flipsLabel.text = [NSString stringWithFormat:(@"Flips: %d"), self.flipCount];
}

- (void) setFlipResult:(NSMutableArray *)flipResult {
    _flipResult = flipResult;
    if ([flipResult count] > 0){
        NSString *firstCard = [flipResult objectAtIndex:0];
        if ([flipResult count] == 1) {
            self.flipresultLabel.text = [NSString stringWithFormat:@"Flipped %@", firstCard];
        }
        else {
            NSString *secondCard = [flipResult objectAtIndex:1];
            NSNumber *score = [flipResult objectAtIndex:2];
            if ([score isEqualToNumber:[NSNumber numberWithInt:2]]) {
                self.flipresultLabel.text = [NSString stringWithFormat:@"%@ and %@ don't match! %@ Points penalty", firstCard, secondCard, score];
            }
            else {
                self.flipresultLabel.text = [NSString stringWithFormat:@"Matched %@ and %@ for %@ points", firstCard, secondCard, score];
            }
        }
    }
}

//target action. view talks to the controller, in this case oh! someone touchedupinside.
- (IBAction)flipCard:(UIButton *)sender {
    NSMutableArray *result = [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    
    self.flipResult = result;
    
    self.flipCount++;
    [self updateUI];
}


@end
