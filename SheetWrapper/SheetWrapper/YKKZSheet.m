//
//  YKKZSheet.m
//  SheetWrapper
//
//  Created by zzz on 2021/10/11.
//  Copyright © 2021 zzz. All rights reserved.
//

#import "YKKZSheet.h"

@implementation YKKZSheet

+ (void)Test {
    printf("Test test テスト\n");
}

//windowとpanelを指定してシートとして表示する
//https://stackoverflow.com/questions/604768/wait-for-nsalert-beginsheetmodalforwindow

+ (NSInteger)beginSheetModalForWindow:(id)window withPanel:(id)panel {

    [panel beginSheetModalForWindow:window completionHandler:^(NSModalResponse returnCode){
       
        [NSApp stopModalWithCode:returnCode];
        
    }];
    
    return [NSApp runModalForWindow:window];
    
}

@end
