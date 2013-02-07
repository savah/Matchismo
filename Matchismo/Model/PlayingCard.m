//
//  PlayingCard.m
//  Matchismo
//
//  Created by Paris Kapsouros on 2/4/13.
//  Copyright (c) 2013 Paris Kapsouros. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit; //epeidi grapsame kai ton getter kai ton setter.


-(int) match:(NSArray *)othercards
{
    int score = 0;
    if ([othercards count] == 1) {
        PlayingCard *otherCard = [othercards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
        else if (otherCard.rank == self.rank){
            score = 4;
        }
    }
    return score;
    
}


// to exei klironomisei apo tin Card
-(NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];

}

+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray *)validSuits {
    return @[@"♥", @"♠", @"♣", @"♦"];
}


//suit setter
- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

//suit getter
- (NSString *)suit {
    return _suit ? _suit : @"?";
}

+ (NSUInteger)maxRank {
    return [self rankStrings].count-1;
}

//rank setter
- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
