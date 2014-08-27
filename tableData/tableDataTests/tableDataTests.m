//
//  tableDataTests.m
//  tableDataTests
//
//  Created by Sergey Maslov on 26.08.14.
//  Copyright (c) 2014 Sergey Maslov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TDPerson.h"

@interface tableDataTests : XCTestCase

@end

@implementation tableDataTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPersonCreation
{
    TDPerson *person1 = [[TDPerson alloc] initWithName:@"Alex" andCounty:@"Ru" andImage:@"1.png"];
    TDPerson *person2 = [[TDPerson alloc] initWithName:@"Bob" andCounty:@"Ge" andImage:@"2.png"];
    XCTAssertTrue(person2.personId != person1.personId, @"person2.personId should great than person2.personId");
}

@end
