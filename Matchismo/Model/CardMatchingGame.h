//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Paris Kapsouros on 2/6/13.
//  Copyright (c) 2013 Paris Kapsouros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (id) initWithCardCount:(NSUInteger)count
               usingDeck:(Deck *) deck;

- (NSMutableArray *)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) int score;

@end
