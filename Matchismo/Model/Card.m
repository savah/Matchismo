//
//  Card.m
//  Matchismo
//
//  Created by Paris Kapsouros on 2/4/13.
//  Copyright (c) 2013 Paris Kapsouros. All rights reserved.
//

#import "Card.h"

@implementation Card

- (NSInteger) match:(NSArray *)othercards
{
    NSUInteger score = 0;
    for (Card *card in othercards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
    
        }
    }
    
    return score;
}

@end
