//
//  Deck.m
//  DS_DigItGames
//
//  Created by Dilara Semerci on 7/25/15.
//  Copyright (c) 2015 Dilara Semerci. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation Deck

// Returns a collection of all cards in this deck.
- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

// Adds a card to this deck.
- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}
//If at top is not specified, just add it
- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

// Removes and returns a random card from this deck.
- (Card *)drawRandomCard {
    Card *randomCard = nil;
    
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}




@end
