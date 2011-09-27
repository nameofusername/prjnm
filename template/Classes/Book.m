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

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:ttl forKey:@"title"];
    [aCoder encodeObject:athr forKey:@"author"];
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    ttl = [[aDecoder decodeObjectForKey:@"title"] retain];
    athr = [[aDecoder decodeObjectForKey:@"author"] retain];
    return self;
}

-(void)dealloc
{
    [ttl release];
    [athr release];
    [super dealloc];
}

@end

