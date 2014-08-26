//
//  TDPerson.h
//  tableData
//
//  Created by Sergey Maslov on 26.08.14.
//  Copyright (c) 2014 Sergey Maslov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDPerson : NSObject

@property (readonly) int personId;
@property (strong) NSString *personName;
@property (strong) NSString *personCountry;

- (id)initWithName:(NSString*)name andCounty:(NSString*)country;

@end
