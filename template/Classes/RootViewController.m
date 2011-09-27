//
//  RootViewController.m
//  template
//
//  Created by Anton on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define DOCUMENTS [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#import "Book.h"
#import "RootViewController.h"
#import "NewViewController.h"


@implementation RootViewController

@synthesize books;


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    
    NSString *filePathDocArray = [DOCUMENTS stringByAppendingPathComponent:@"array.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePathDocArray])
    {
        books = [[NSMutableArray alloc] init];
        
        NSString *filePathBundleArray = [[NSBundle mainBundle] pathForResource:@"array" ofType:@"plist"];
        [[NSFileManager defaultManager] copyItemAtPath:filePathBundleArray toPath:filePathDocArray error:nil];
    }
    else
    {
        books = [[NSMutableArray alloc] initWithContentsOfFile:filePathDocArray];
    }

    
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.title = @"Books";
    
}

-(IBAction)buttonSelected:(id)sender
{
    NewViewController *nvc = [[NewViewController alloc] initWithNibName:@"NewViewController" bundle:nil];
    nvc.delegate = self;
    nvc.change = NO;
    [self.navigationController pushViewController:nvc animated:YES];
    [nvc release];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

#pragma mark -
#pragma mark Book support

-(void)newViewController:(NewViewController *)newViewController didAddBook:(Book *)book
{
    if (book) {
        [self addBook:book animated:NO];
    }
    [self dismissModalViewControllerAnimated:YES];
    [self.tableView reloadData];
}

-(void)newViewController:(NewViewController *)newViewController didChangeBook:(Book *)book atIndex:(NSInteger)index
{
    if (book) {
        Book *b;
        b = [books objectAtIndex:index] ;
        b.ttl = book.ttl;
        b.athr = book.athr;
    }
    [self dismissModalViewControllerAnimated:YES];
    [self.tableView reloadData];
}

-(void)addBook:(Book *)book animated:(BOOL)animated
{
    [books addObject:book];
    //NSString *filePathDocArray = [DOCUMENTS stringByAppendingPathComponent:@"array.plist"];
    //NSString *filePathBundleArray = [[NSBundle mainBundle] pathForResource:@"array" ofType:@"plist"];
    
    
}

-(void)changeBook:(Book *)book atIndex:(NSInteger)index animated:(BOOL)animated
{
    
}


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [books count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
    cell.textLabel.text = [[books objectAtIndex:indexPath.row] ttl];

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [books removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
    NewViewController *nvc = [[NewViewController alloc] initWithNibName:@"NewViewController" bundle:nil];
    nvc.delegate = self;
    nvc.change = YES;
    nvc.chInd = indexPath.row;
    [self.navigationController pushViewController:nvc animated:YES];
    [nvc release];
   }


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    
    NSString *filePathDocArray = [DOCUMENTS stringByAppendingPathComponent:@"array.plist"];
    
    [books writeToFile:filePathDocArray atomically:YES];
  
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    
    [books release];
    [super dealloc];
}


@end

