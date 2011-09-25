//
//  Book.m
//  template
//
//  Created by Anton on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Book.h"

@implementation Book

@synthesize ttl, athr;

-(void)dealloc
{
    [ttl release];
    [athr release];
    [super dealloc];
}

@end

