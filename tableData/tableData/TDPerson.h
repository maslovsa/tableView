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
@property (strong) NSString *personImage;

- (id)initWithName:(NSString*)name andCounty:(NSString*)country andImage:(NSString*)image;

@end
