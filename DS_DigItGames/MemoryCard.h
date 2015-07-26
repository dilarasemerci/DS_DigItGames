//
//  MemoryCard.h
//  DS_DigItGames
//
//  Created by Dilara Semerci on 7/25/15.
//  Copyright (c) 2015 Dilara Semerci. All rights reserved.
//

#import "Deck.h"

@interface MemoryCard : Card
@property (strong,nonatomic) NSString *iconName;
+ (NSArray *)validIconNames;
@end
