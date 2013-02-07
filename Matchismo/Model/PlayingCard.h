//
//  PlayingCard.h
//  Matchismo
//
//  Created by Paris Kapsouros on 2/4/13.
//  Copyright (c) 2013 Paris Kapsouros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;
@end
