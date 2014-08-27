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

@interface TDMasterViewController () {
    __block BOOL _isEnabled;
}
@end

@implementation TDMasterViewController

@synthesize persons = _persons;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _isEnabled = NO;
    
    UIBarButtonItem *startButton = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStylePlain target:self action:@selector(start:)];
    self.navigationItem.leftBarButtonItem = startButton;
    
    UIBarButtonItem *stopButton = [[UIBarButtonItem alloc] initWithTitle:@"Stop" style:UIBarButtonItemStylePlain target:self action:@selector(stop:)];
    self.navigationItem.rightBarButtonItem = stopButton;
    self.title = @"Persons";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (YES) {
            if (_isEnabled) {
                // [NSThread sleepForTimeInterval:.05]; // for more cool view
                int index = arc4random_uniform(_persons.count);
                NSLog(@"using %d", index);
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"HH:mm:ss.SSSS"];
                NSString *dateString = [formatter stringFromDate:[NSDate date]];
                TDPerson *person =[self.persons objectAtIndex:index];
                [person setPersonCountry: dateString];
                
                int indexImage = arc4random_uniform(MAX_IMAGE) + 1;
                [person setPersonImage:[NSString stringWithFormat:@"%d.png", indexImage]];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        }
    });
}

- (void)didReceiveMemoryWarning
{
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
    cell.imageView.image = [UIImage imageNamed:person.personImage];
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
