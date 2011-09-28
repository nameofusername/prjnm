//
//  Book.h
//  template
//
//  Created by Anton on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface Book : NSObject<NSCoding> {
    NSString *ttl;
    NSString *athr;
}

@property(nonatomic, copy) NSString *ttl;
@property(nonatomic, copy) NSString *athr;

@end