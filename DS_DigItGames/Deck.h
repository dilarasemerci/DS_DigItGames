//
//  Deck.h
//  DS_DigItGames
//
//  Created by Dilara Semerci on 7/25/15.
//  Copyright (c) 2015 Dilara Semerci. All rights reserved.
//

#import "Card.h"

@interface Deck : Card
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;
@end
