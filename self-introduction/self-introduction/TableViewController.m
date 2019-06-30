//
//  TableViewController.m
//  self-introduction
//
//  Created by Randi on 22/6/2019.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

@interface TableViewController (){
    AppDelegate* appGlobal;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _Titles = @[@"Ragdoll", @"American shorthair", @"American curl",];
    _Descriptions = @[@"Paris", @"Rome", @"London",];
    _Images = @[@"ragdoll.png", @"shorthair.png", @"curl.png",];
    _Movies = @[@"ragdoll", @"shorthair", @"curl",];
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
    
    UIImage *image = [UIImage imageNamed:@"logo.jpg"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _Titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSInteger row = [indexPath row];
    
    tableView.rowHeight = 200;
    
    cell.TitleLabel.text = _Titles[row];
    
    cell.DescriptionLabel.text = _Descriptions[row];
    
    cell.ThumbImage.image = [UIImage imageNamed:_Images[row]];
    
    NSLog(@"Hi %@",_Titles[row]);
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [cell setBackgroundView:bgView];
    ((UIImageView *)cell.backgroundView).image = [UIImage imageNamed:@"cellimage.jpg"];
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        
        NSLog(@"ShowDetails");
        
        DetailViewController *detailViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        NSInteger row = [myIndexPath row];
        
        NSLog(@"Segue %@",_Titles[row]);
        
        detailViewController.DetailModal = @[_Titles[row], _Descriptions[row], _Images[row], _Movies[row]];
        
    }
}

- (void) viewWillAppear:(BOOL)animated{ //refresh tab bar view
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
}


@end
