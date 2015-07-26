//
//  GameController.m
//  DS_DigItGames
//
//  Created by Dilara Semerci on 7/25/15.
//  Copyright (c) 2015 Dilara Semerci. All rights reserved.
//

#import "GameController.h"


// Private extensions
@interface GameController()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;

@property (strong,nonatomic) Card *flippedCard;
@property (nonatomic) NSUInteger *flippedCardIndex;
@end

// Class implementation
@implementation GameController

// Designated initializer
- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck  {
    self = [super init];
    if (self) {
        for (int i = 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

// Returns the collection of game cards.
- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

// Custom synthesis
@synthesize matchCount  = _matchCount;

// Returns the number of game card matches to use.
- (NSUInteger)matchCount {
    if (!_matchCount) {
        _matchCount = 2;
    }
    
    return _matchCount;
}

// Sets the number of game card matches to use.
- (void)setMatchCount:(NSUInteger)matchCount {
    _matchCount = 2;
}

// Flip a card, compute a score, and record a play message.
- (NSUInteger)flipCardAtIndex:(NSUInteger)index {
    int match = 0;
    

    if(index != self.flippedCardIndex){
        
        Card *card = [self cardAtIndex:index];
        if(!card.isUnplayable){

        if(self.flippedCard)
        {
            //Check if they match
            if([card.iconName isEqualToString:self.flippedCard.iconName])
            {
                card.faceUp = !card.isFaceUp;
                card.unplayable = true;
                self.flippedCard.unplayable = true;
                self.flippedCard = nil;
                self.flippedCardIndex = nil;
                
                self.score++;
                
            }else{
                //TODO: If not match: make both face down
                card.faceUp = YES;
                self.flippedCard.faceUp = NO;
                self.flippedCard= card;
                self.flippedCardIndex = index;
                match = -1;
            }

        }
        else
        {
            self.flippedCard = card;
            self.flippedCardIndex = index;
            card.faceUp = !card.isFaceUp;
            NSLog(@"FLIPPED CARD: %@",card.iconName );
        }
    }
    }
    
    return match;
}

// Returns a specific game card.
- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < self.cards.count) ? self.cards[index] : nil;
}

@end
