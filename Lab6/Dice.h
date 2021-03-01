//
//  Dice.h
//  Lab6
//
//  Created by Uji Saori on 2021-02-28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property (nonatomic, assign) NSInteger *curValue;
@property (nonnull) NSArray *diceFaces;
@property (nonatomic) bool isHold;

- (void) randomizeDice;

@end

NS_ASSUME_NONNULL_END
