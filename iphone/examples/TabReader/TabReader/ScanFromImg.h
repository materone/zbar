//
//  ScanFromImg.h
//  zbar
//
//  Created by Tony on 13-6-25.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarReaderController.h"
//#import "ZBarReaderViewController.h"

@interface ScanFromImg : UIViewController<ZBarReaderDelegate>

@property (retain, nonatomic) IBOutlet UITextView *RstScanTxt;
@property (retain, nonatomic) IBOutlet UIImageView *imgBeScan;
- (IBAction)scanImg:(id)sender;

@end
