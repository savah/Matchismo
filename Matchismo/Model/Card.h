//
//  Card.h
//  Matchismo
//
//  Created by Paris Kapsouros on 2/4/13.
//  Copyright (c) 2013 Paris Kapsouros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString *contents;

@property(nonatomic, getter = isFaceUp) BOOL faceUp;
@property(nonatomic, getter = isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)othercards;

@end
