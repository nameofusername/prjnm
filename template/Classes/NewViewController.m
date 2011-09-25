//
//  NewViewController.m
//  template
//
//  Created by Anton on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Book.h"
#import "NewViewController.h"
#import "RootViewController.h"

@implementation NewViewController

@synthesize txtTitle, txtAuthor, delegate, change;

-(IBAction) done:(id)sender
{
    
    Book *book = [[Book alloc] init];
    book.ttl = txtTitle.text;
    book.athr = txtAuthor.text;
    
    if(!self.change)
    {
        [self.delegate newViewController:self didAddBook:book];
    }
    else
    {
        [self.delegate newViewController:self didChangeBook:book];
    }
    [self.navigationController popViewControllerAnimated:YES];
    [book release];
}

-(IBAction)makeKyeboardGoAway
{
    [txtTitle resignFirstResponder];
    [txtAuthor resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *) textField
{
    [textField resignFirstResponder];
    return YES;
}

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
    if (self.change) {
        self.title = @"Change";
    }
    else
        self.title = @"New book";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc
{
    if(delegate)
        [delegate release];
    [super dealloc];
}

@end
