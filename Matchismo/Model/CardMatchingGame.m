//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Paris Kapsouros on 2/6/13.
//  Copyright (c) 2013 Paris Kapsouros. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards; //of Card
@end

@implementation CardMatchingGame

//to matching game den kserei tipota gia playingcard deck kai playing cards. To mutable array pairnei decks kai i init pairnei cards. apo tin stigmi pou i kathe karta ftiaxnei swsta to match tis tote den iparxei problima. OOP rule.


//lazy instantiation
- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        card.unplayable = YES;
                        otherCard.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    }
                    else {
                        otherCard.FaceUp = NO;
                        self.score -= matchScore * MISMATCH_PENALTY;
                    }
                    break;
                }
            }
        self.score -=FLIP_COST;
        }

        card.faceUp = !card.faceUp;
    }
    
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    //ternary operator if ?(then) :(else)
    NSLog(@"Index is %d", index);
    NSLog(@"Count is %d", [self.cards count]);
    
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (id) initWithCardCount:(NSUInteger)count
               usingDeck:(Deck *) deck;
{
    self = [super init];
    if (self) {
        for (int i = 0 ; i < count; i++) {
            Card *card = [deck drawRandomCard]; //dilwsi neou object
            if (card) { //elegxos gia na min bgoume panw apo to orio tou deck an o allos dwsei panw apo to deck.count
                self.cards[i] = card; //vazei to object ston pinaka
            }
            else
            {
                self = nil;
                break;
            }
        }
        
    }
    return self;
}

@end
