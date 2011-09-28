//
//  RootViewController.h
//  template
//
//  Created by Anton on 9/24/11.
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
