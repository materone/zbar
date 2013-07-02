//
//  ScanFromImg.m
//  zbar
//
//  Created by Tony on 13-6-25.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ScanFromImg.h"

@implementation ScanFromImg
@synthesize RstScanTxt;
@synthesize imgBeScan;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setImgBeScan:nil];
    [self setRstScanTxt:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [imgBeScan release];
    [RstScanTxt release];
    [super dealloc];
}
- (IBAction)scanImg:(id)sender {
    ZBarReaderController *reader = [ZBarReaderController new];
    reader.readerDelegate = self;
    reader.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [reader.scanner setSymbology:ZBAR_QRCODE & ZBAR_ISBN10 & ZBAR_ISBN13 config:ZBAR_CFG_ENABLE to:1];
    [self presentViewController:reader animated:YES completion:NULL];
    [reader release];
}

// ZBarReaderDelegate

- (void)  imagePickerController: (UIImagePickerController*) picker
  didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // do something useful with results

    UIImage *image = [info objectForKey: UIImagePickerControllerOriginalImage];
    self.imgBeScan.image = image;
    
    
    id <NSFastEnumeration> syms =
    [info objectForKey: ZBarReaderControllerResults];
    for(ZBarSymbol *sym in syms) {
        self.RstScanTxt.text = sym.data;
        break;
    }
    [picker dismissModalViewControllerAnimated:YES];
}

@end
