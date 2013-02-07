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
@property (nonatomic) int flipCount;
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

- (void) updateUI
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

//target action. view talks to the controller, in this case oh! someone touchedupinside.
- (IBAction)flipCard:(UIButton *)sender {

    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}


@end
