//
//  Book.h
//  template
//
//  Created by Anton on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@interface Book : NSObject {
    NSString *ttl;
    NSString *athr;
}

@property(nonatomic, retain) NSString *ttl;
@property(nonatomic, retain) NSString *athr;

@end