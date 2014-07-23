//
//  TGContentViewController.h
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/23/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Entry;

@interface TGContentViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, weak) Entry *selectedEntry;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
