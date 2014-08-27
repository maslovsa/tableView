//
//  TDDetailViewController.m
//  tableData
//
//  Created by Sergey Maslov on 26.08.14.
//  Copyright (c) 2014 Sergey Maslov. All rights reserved.
//

#import "TDDetailViewController.h"
#import "TDPerson.h"

@interface TDDetailViewController ()
- (void)configureView;
@end

@implementation TDDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }
}

- (void)configureView
{
    if (self.detailItem) {
        TDPerson *person = (TDPerson *)self.detailItem;
        self.personName.text = person.personName;
        self.personCountry.text = person.personCountry;
        self.personImage.image =[UIImage imageNamed: person.personImage];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.personCountry.enabled = NO;
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editingChanged:(id)sender {
    TDPerson *person = (TDPerson *)self.detailItem;
    [person setPersonName: self.personName.text];
    NSLog(@"new name %@", self.personName.text);
}

@end
