//
//  Deck.m
//  Matchismo
//
//  Created by Paris Kapsouros on 2/4/13.
//  Copyright (c) 2013 Paris Kapsouros. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards; //of Card
@end

@implementation Deck

- (NSMutableArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void) addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0]; //to vazei se sigkekrimeni thesi me to insertObjectatIndex, kai stin prokeimeni periptwsh stin thesi 0
    }
    else {
        [self.cards addObject:card]; //to vazei sto telos me tin addObject
    }
}

- (Card *) drawRandomCard {
    Card *randomCard = nil;
    //dilwsi neou object
    
    if (self.cards.count) { //gia na min skasei an den exei cards
        unsigned index = arc4random() % self.cards.count; //random number
        randomCard = self.cards[index]; //dinei timi stin random card
        [self.cards removeObjectAtIndex:index]; //tin afairei apo to NSMutableArray
    }
    return randomCard;
}

@end
