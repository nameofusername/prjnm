//
//  NewViewController.h
//  template
//
//  Created by Anton on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol BookAddDelegate;
@class Book;

@interface NewViewController : UIViewController<UITextFieldDelegate> {
    
    BOOL change;
    UITextField *txtTitle;
    UITextField *txtAuthor;
    id<BookAddDelegate> delegate;
    
}

@property(nonatomic, assign) BOOL change;
@property(nonatomic, retain) IBOutlet UITextField *txtTitle;
@property(nonatomic, retain) IBOutlet UITextField *txtAuthor;
@property(nonatomic, retain) id<BookAddDelegate> delegate;

-(IBAction) done:(id)sender;
-(IBAction)makeKyeboardGoAway;
@end

@protocol BookAddDelegate <NSObject>

-(void)newViewController:(NewViewController *)newViewController didAddBook:(Book *)book;
-(void)newViewController:(NewViewController *)newViewController didChangeBook:(Book *)book;

@end