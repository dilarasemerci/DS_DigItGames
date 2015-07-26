//
//  Card.m
//  DS_DigItGames
//
//  Created by Dilara Semerci on 7/25/15.
//  Copyright (c) 2015 Dilara Semerci. All rights reserved.
//

#import "Card.h"

@implementation Card
// Returns a match score based on whether this card matches the given card.
- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
