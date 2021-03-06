//
//  TDMasterViewController.m
//  tableData
//
//  Created by Sergey Maslov on 26.08.14.
//  Copyright (c) 2014 Sergey Maslov. All rights reserved.
//

#import "TDMasterViewController.h"
#import "TDDetailViewController.h"
#import "TDPerson.h"

const int MAX_IMAGE = 37;
static NSArray *_countries;

@interface TDMasterViewController () {
    BOOL _isEnabled;
    NSMutableDictionary *_imageCache;
}
@end

@implementation TDMasterViewController {
    
}

@synthesize persons = _persons;


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadImages];
    
    _isEnabled = NO;
    _countries = @[@"RU",@"UKR",@"BEL",@"JAP",@"ISP",@"US",@"UK",@"GE",@"FR",@"BRA"];
    
    UIBarButtonItem *startButton = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStylePlain target:self action:@selector(start:)];
    self.navigationItem.leftBarButtonItem = startButton;
    
    UIBarButtonItem *stopButton = [[UIBarButtonItem alloc] initWithTitle:@"Stop" style:UIBarButtonItemStylePlain target:self action:@selector(stop:)];
    self.navigationItem.rightBarButtonItem = stopButton;
    self.title = @"Person locations";
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateTableView:)
                                                 name:@"updatePersons"
                                               object:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm:ss.SSSS"];
            while (YES) {
                if (_isEnabled) {
                    [NSThread sleepForTimeInterval:.05]; // ONLY - for more cool view!!!
                    
                    TDPerson *person =[self.persons objectAtIndex: arc4random_uniform((int)_persons.count)];
                    [person setPersonCountry: [NSString stringWithFormat:@"%@ since %@",
                                               [_countries objectAtIndex:arc4random_uniform((int)_countries.count)],
                                               [formatter stringFromDate:[NSDate date]]]];
                    [person setPersonImage:[NSString stringWithFormat:@"%d.png", arc4random_uniform(MAX_IMAGE) + 1]];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"updatePersons" object: [NSNumber numberWithInt:person.personId]];
                    });
                }
            }
        
    });
}

- (void)loadImages {
    _imageCache = [[NSMutableDictionary new] init];
    int index = 0;
    while (index < MAX_IMAGE) {
        NSString *file = [NSString stringWithFormat:@"%d.png", ++index];
        [_imageCache setObject:[UIImage imageNamed: file] forKey:file];
    }
}

- (void) updateTableView:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"updatePersons"])
        [self.tableView reloadData];
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"memory warning!");
    [super didReceiveMemoryWarning];
}

- (void)start:(id)sender
{
    _isEnabled = YES;
}

- (void)stop:(id)sender
{
    _isEnabled = NO;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _persons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"PersonCell"];
    TDPerson *person = [self.persons objectAtIndex:indexPath.row];
    cell.textLabel.text = person.personName;
    cell.detailTextLabel.text = person.personCountry;
    cell.imageView.image = [_imageCache objectForKey: person.personImage];
    return cell;
}

-(void)didMoveToParentViewController:(UIViewController *)parent{
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TDPerson *person = _persons[indexPath.row];
        [[segue destinationViewController] setDetailItem:person];
    }
}

@end
