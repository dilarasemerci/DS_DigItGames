//
//  ViewController.m
//  DS_DigItGames
//
//  Created by Dilara Semerci on 7/25/15.
//  Copyright (c) 2015 Dilara Semerci. All rights reserved.
//

#import "ViewController.h"

#import "GameController.h"
#import "GameCardDeck.h"

#import "CircleProgressBar.h"
#import "JTAlertView.h"


@interface ViewController ()

@property (strong, nonatomic) GameController *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (nonatomic) NSUInteger *cardMatch;

@property(nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet CircleProgressBar *CircleClock;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (nonatomic, strong) JTAlertView *alertView;


@property (nonatomic)NSInteger count;
@property (nonatomic)NSInteger seconds;
@property (nonatomic)NSTimer *timer;

@end

@implementation ViewController

#define TIMERVALUE 30 //timer for the game

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGameTimer];
}


// Returns a fully initiaized game instance.
- (GameController *)game {
    if (!_game) {
        _game = [[GameController alloc] initWithCardCount:self.cardButtons.count
            usingDeck:[[GameCardDeck alloc] init]];
    }
    return _game;
}

// Sets the game card buttons.
- (void)setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}

// Renders the complete user interface.
- (void)updateUI {
    // Update the card buttons
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable) ? 0.3f : 1.0f;
        [cardButton setBackgroundImage:(cardButton.selected) ? [UIImage imageNamed:@"CardFront.png"] : [UIImage imageNamed:@"CardBack.png"] forState:UIControlStateNormal];
        
        if(cardButton.selected){
            [cardButton setImage:[UIImage imageNamed:card.contents ] forState:UIControlStateNormal];
        }
        else
        {
            [cardButton setImage:nil forState:UIControlStateNormal];
        }
    }
    
    // Updates the score label
    self.scoreLabel.text = [NSString stringWithFormat:@"%d/14 Matched", self.game.score];
}

// Sets the flips count label.
- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
}

- (IBAction)tapOnCardButton:(UIButton *)sender {
    self.cardMatch = [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

-(void)showAlert
{
    NSString *msg = [NSString stringWithFormat:@"Time is up!\nYou matched %d pairs", self.game.score];
    self.alertView = [[JTAlertView alloc] initWithTitle:[msg uppercaseString] andImage:nil];
    self.alertView.size = CGSizeMake(400, 300);
    self.alertView.popAnimation = YES;
    self.alertView.parallaxEffect = YES;
    self.alertView.backgroundShadow = NO;
    self.alertView.overlayColor = [UIColor colorWithRed:0.84 green:0.34 blue:0.18 alpha:1];
    self.alertView.font = [UIFont boldSystemFontOfSize:40];
    
    __weak typeof(self)weakSelf = self;
    
    [self.alertView addButtonWithTitle:@"REPLAY" font:nil style:JTAlertViewStyleDefault forControlEvents:UIControlEventTouchUpInside action:^(JTAlertView *alertView) {
        NSLog(@"JTAlertView: OK pressed");
        [alertView hideWithCompletion:nil animated:YES];
        [weakSelf fadeExampleSettings];
        //Reset the game
        self.game = nil;
        self.flipCount = 0;
        [self updateUI];
        [self setupGameTimer];
    }];
    
    [self.alertView showInSuperview:[[UIApplication sharedApplication] keyWindow] withCompletion:nil animated:YES];
    
    [self fadeExampleSettings];
}

- (void)fadeExampleSettings {
    [UIView animateWithDuration:0.1 animations:^{
        for (UIView *s in self.view.subviews) {
            s.alpha = s.alpha ? 0.0 : 1.0;
        }
    } completion:nil];
}

//TIMER RELATED FUNCTIONS

- (void)subtractTime {
    self.seconds--;
    if (self.seconds == 0) {
        [self.timer invalidate];
        
        [self showAlert];
    }
}

- (void)setupGameTimer{
    // 1
    // Set the timer values
    self.seconds = TIMERVALUE;
    self.count = 0;
    [self.CircleClock setProgress:1 animated:false];
    
    // 2
    //Start the circular timer
    [self.CircleClock setHintTextGenerationBlock:^NSString *(CGFloat progress) {
        return [NSString stringWithFormat:@"%.0f", progress * TIMERVALUE];
    }];
    
    [self.CircleClock setProgress:0 animated:YES duration:TIMERVALUE];
    
    // 3
    //Run the timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
}

@end
