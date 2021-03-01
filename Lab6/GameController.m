//
//  GameController.m
//  Lab6
//
//  Created by Uji Saori on 2021-02-28.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype) init
{
    self = [super init];
    if (self) {
        _dices = [NSMutableArray array];
        _diceCnt = 5;
        [self generateDices];
    }
    return self;
}

- (void) generateDices
{
    for (int i = 0; i < _diceCnt; i++) {
        [_dices addObject:[[Dice alloc] init]];
    }
}

- (void) holdDiceWith:(int) diceNumber
{
    if (diceNumber > 0 && diceNumber <= _diceCnt) {
        Dice *d = [_dices objectAtIndex:diceNumber-1];
        d.isHold = YES;
    }
}

- (void) unHoldDiceWith:(int) diceNumber
{
    if (diceNumber > 0 && diceNumber <= _diceCnt) {
        Dice *d = [_dices objectAtIndex:diceNumber-1];
        d.isHold = NO;
    }
}

- (void) rollUnholdDices
{
    for (int i = 0; i < _diceCnt; i++) {
        Dice *d = [_dices objectAtIndex:i];
        if (!d.isHold) {
            [d randomizeDice];
        }
    }
}

- (void) resetDice
{
    for (int i = 0; i < _diceCnt; i++) {
        Dice *d = [_dices objectAtIndex:i];
        d.isHold = NO;
    }
}

- (void) displayDices
{
    NSString *valuesOutput = @"dice values:";
    for (int i = 0; i < _diceCnt; i++) {
        Dice *d = [_dices objectAtIndex:i];
        if (d.isHold) {
            valuesOutput = [valuesOutput stringByAppendingFormat:@" [%@]", d.diceFaces[(long)d.curValue]];
        } else {
            valuesOutput = [valuesOutput stringByAppendingFormat:@" %@", d.diceFaces[(long)d.curValue]];
        }
    }
    NSLog(@"%@", valuesOutput);
    NSLog(@"score: %ld", (NSInteger)[self getScore]);
}

- (NSInteger *) getScore
{
    NSInteger sum = 0;
    for (int i = 0; i < _diceCnt; i++) {
        Dice *d = [_dices objectAtIndex:i];
        sum += (NSInteger)d.curValue;
    }
    return sum;
}

@end
