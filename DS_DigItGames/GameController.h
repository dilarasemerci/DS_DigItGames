//
//  GameController.h
//  DS_DigItGames
//
//  Created by Dilara Semerci on 7/25/15.
//  Copyright (c) 2015 Dilara Semerci. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface GameController : NSObject
@property (nonatomic) NSUInteger matchCount;
@property (nonatomic, readonly) int score;
// Designated initializer
- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;
- (int)flipCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
@end
