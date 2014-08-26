//
//  TDPerson.m
//  tableData
//
//  Created by Sergey Maslov on 26.08.14.
//  Copyright (c) 2014 Sergey Maslov. All rights reserved.
//

#import "TDPerson.h"

@implementation TDPerson

static int currentPersonId = 0;

@synthesize personId = _personId;
@synthesize personName = _personName;
@synthesize personCountry= _personCountry;

- (id)initWithName:(NSString*)name andCounty:(NSString*)country {
    if ((self = [super init])) {
        self.personName = name;
        self.personCountry = country;
        _personId = ++currentPersonId;
    }
    return self;
}

@end
