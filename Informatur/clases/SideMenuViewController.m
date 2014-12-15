


#import "SideMenuViewController.h"
#import "MFSideMenu.h"
#import "DemoViewController.h"

@implementation SideMenuViewController{

    NSArray *arra;
}

#pragma mark -
#pragma mark - UITableViewDataSource

-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    
    arra = [NSArray arrayWithObjects:NSLocalizedString(@"Bienvenido",@""),
            NSLocalizedString(@"Atractivos",@""),
            NSLocalizedString(@"Mapas",@""),
            NSLocalizedString(@"Que Hacer",@"")
            ,nil];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arra count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 56.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.backgroundColor  = [UIColor lightGrayColor];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0];
    }
    
    cell.textLabel.text = [arra objectAtIndex:indexPath.row];

    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoViewController *vista = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    vista.title = [arra objectAtIndex:indexPath.row];
    vista.identi = @"home";

    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:vista];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    
    switch (indexPath.row) {
        case 0:
            vista.identi = @"home";
            break;
        case 1:
            vista.identi = @"atractivos";
            break;
        case 2:
            vista.identi = @"mapas";
            break;
        case 3:
            vista.identi = @"que";
            break;
}


}

@end


