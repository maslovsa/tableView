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

@implementation TDDetailViewController {
    int _personId;
    TDPerson *_person;
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        _person = (TDPerson *)self.detailItem;
        [self configureView];
    }
}

- (void)configureView
{
    if (self.detailItem) {
        self.personName.text = _person.personName;
        self.personCountry.text = _person.personCountry;
        self.personImage.image =[UIImage imageNamed: _person.personImage];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.personCountry.enabled = NO;
    self.personImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.personImage.layer.borderWidth = 0.5;
    self.personImage.layer.cornerRadius = 5.0;
    
    [self configureView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateTableView:)
                                                 name:@"updatePersons"
                                               object:nil];
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) updateTableView:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"updatePersons"] && [[notification object] integerValue] == _person.personId ) {
        [self configureView];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)editingChanged:(id)sender {
    [_person setPersonName: self.personName.text];
    NSLog(@"new name %@", self.personName.text);
}

@end
