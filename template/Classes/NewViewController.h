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
    NSInteger chInd;
    UITextField *txtTitle;
    UITextField *txtAuthor;
    id<BookAddDelegate> delegate;
    
}

@property(nonatomic, copy) NSString *chTitle;
@property(nonatomic, copy) NSString *chAuthor;
@property(nonatomic, assign) NSInteger chInd;
@property(nonatomic, assign) BOOL change;
@property(nonatomic, retain) IBOutlet UITextField *txtTitle;
@property(nonatomic, retain) IBOutlet UITextField *txtAuthor;
@property(nonatomic, retain) id<BookAddDelegate> delegate;

-(IBAction) done:(id)sender;
-(IBAction)makeKyeboardGoAway;
@end

@protocol BookAddDelegate <NSObject>

-(void)newViewController:(NewViewController *)newViewController didAddBook:(Book *)book;
-(void)newViewController:(NewViewController *)newViewController didChangeBook:(Book *)book atIndex:(NSInteger)index;

@end
