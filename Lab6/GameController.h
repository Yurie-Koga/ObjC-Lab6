//
//  GameController.h
//  Lab6
//
//  Created by Uji Saori on 2021-02-28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic) NSMutableArray *dices;
@property (nonatomic) int diceCnt;

- (void) generateDices;
- (void) rollUnholdDices;
- (void) holdDiceWith:(int) diceNumber;
- (void) unHoldDiceWith:(int) diceNumber;
- (void) resetDice;
- (void) displayDices;
- (NSInteger *) getScore;

@end

NS_ASSUME_NONNULL_END
