//
//  TDDetailViewController.h
//  tableData
//
//  Created by Sergey Maslov on 26.08.14.
//  Copyright (c) 2014 Sergey Maslov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIImageView *personImage;
@property (weak, nonatomic) IBOutlet UITextField *personCountry;
@property (weak, nonatomic) IBOutlet UITextField *personName;

- (IBAction)editingChanged:(id)sender;
@end
