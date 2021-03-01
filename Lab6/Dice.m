//
//  Dice.m
//  Lab6
//
//  Created by Uji Saori on 2021-02-28.
//

#import "Dice.h"

@implementation Dice

- (instancetype) init
{
    self = [super init];
    if (self) {
        [self randomizeDice];
        _diceFaces = @[@"​⚀", @"​⚁", @"​⚂", @"​⚃", @"​⚄", @"⚅"];
        _isHold = NO;        
    }
    return self;
}

- (void) randomizeDice
{
    int random = arc4random_uniform(6);
    if (random == 3) {
        _curValue = 0;
    } else {
        _curValue = random;
    }
}

@end
