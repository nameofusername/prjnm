//
//  RootViewController.h
//  template
//
//  Created by Dmitry A. Shashkin on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewViewController.h"

@class Book;

@interface RootViewController : UITableViewController<BookAddDelegate> {
    NSMutableArray *books;
}

@property(nonatomic, retain) IBOutlet NSMutableArray *books;

-(IBAction)buttonSelected:(id)sender;
-(void)addBook:(Book *)book animated:(BOOL)animated;

@end
