//
//  MemoryCard.m
//  DS_DigItGames
//
//  Created by Dilara Semerci on 7/25/15.
//  Copyright (c) 2015 Dilara Semerci. All rights reserved.
//

#import "MemoryCard.h"

@implementation MemoryCard
// Returns a cumulative match score based on the matches between this card and those in the given collection of cards.
- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (id otherCard in otherCards) {
        if ([otherCard isKindOfClass:[MemoryCard class]]) {
            MemoryCard *otherPlayingCard = (MemoryCard *) otherCard;
            score += [self matchMemoryCardIcon:otherPlayingCard];
        }
    }
    
    return score;
}


-(int)matchMemoryCardIcon:(MemoryCard *)otherPlayingCard{
    int score = 0;
    
    if ([otherPlayingCard.iconName isEqualToString:self.iconName]) {
        score = 1;
    }
    return score;
}

// Returns a string description of this card.
- (NSString *)contents {
    
    return self.iconName;
    }

+(NSArray *)validIconNames {
    static NSArray *validIconName = nil;
    
    if (!validIconName) {
        validIconName = @[@"Symbol_Balloon.png",
                          @"Symbol_Clover.png",
                          @"Symbol_Coin.png",
                          @"Symbol_Cube.png",
                          @"Symbol_Diamond.png",
                          @"Symbol_Ghost.png",
                          @"Symbol_Growth.png",
                          @"Symbol_Heart.png",
                          @"Symbol_Horseshoe.png",
                          @"Symbol_House.png",
                          @"Symbol_Magic.png",
                          @"Symbol_Moon.png",
                          @"Symbol_Star.png",
                          @"Symbol_Sun.png"];
    }
    
    return validIconName;
}


// Custom synthesis
@synthesize iconName = _iconName;

- (NSString *)iconName{
    return _iconName ? _iconName : @"?";
}

- (void)setIconName:(NSString *)iconName{
    if ([[MemoryCard validIconNames] containsObject:iconName]) {
        _iconName = iconName;
    }
}

@end
