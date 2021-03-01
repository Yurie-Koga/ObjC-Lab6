//
//  main.m
//  Lab6
//
//  Created by Uji Saori on 2021-02-28.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *menus = @[@"quit", @"roll", @"reset"];
        NSArray *menuDescriptions = @[@"quit - Exit Application", @"roll - Roll all unhold dices", @"reset - Unhold all dices"];
        NSString *prompt = @"\nWhat would you like to do next?";
        for (int i = 0; i < [menuDescriptions count]; i++) {
            NSString *str = [NSString stringWithFormat: @"\n%@", [menuDescriptions objectAtIndex: i]];
            prompt = [prompt stringByAppendingString: str];
        }
        
        GameController *gameController = [[GameController alloc] init];
//        [gameController displayDices];
        
        bool isContinue = YES;
        while (isContinue) {
            NSString *strInput = [InputHandler getUserInputWithMax: 255 AndPrompt: prompt];
            NSInteger item = [menus indexOfObject: strInput];
            switch (item) {
                case 0:
                    printf("Application will be terminated....\n");
                    isContinue = NO;
                    break;
                case 1:
                    // roll
                    [gameController rollUnholdDices];
                    [gameController displayDices];
                    // hold
                    strInput = [InputHandler getUserInputWithMax: 255 AndPrompt: @"type dice number to hold (ie. 1 to 5): "];
                    [gameController holdDiceWith:[strInput intValue]];
                    [gameController displayDices];
                    break;
                case 2:
                    [gameController resetDice];
                    [gameController displayDices];
                    break;
                default:
                    printf("input is invalid\n");
                    break;
            }
        }
    }
    return 0;
}
