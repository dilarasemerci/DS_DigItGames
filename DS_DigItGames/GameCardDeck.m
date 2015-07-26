//
//  GameCardDeck.m
//  DS_DigItGames
//
//  Created by Dilara Semerci on 7/25/15.
//  Copyright (c) 2015 Dilara Semerci. All rights reserved.
//

#import "GameCardDeck.h"
#import "MemoryCard.h"

@implementation GameCardDeck

- (id)init {
    self = [super init];
    if (self) {
        //For each icon name, create two cards
        for(NSString *image in [MemoryCard validIconNames]){
            MemoryCard *card = [[MemoryCard alloc] init];
            card.iconName = image;
            [self addCard:card atTop:YES];
            MemoryCard *card2 = [[MemoryCard alloc] init];
            card2.iconName = image;
            [self addCard:card2];

        }
    }
        
    return self;
}

@end
