//
//  TableViewController.m
//  TheMovieDBApp
//
//  Created by Charles Sayre on 9/8/20.
//  Copyright © 2020 Charles Sayre. All rights reserved.
//

#import "TableViewController.h"
#import "MoviesModel.h"
#import "ViewController.h"
#import "CollectionViewController.h"

@interface TableViewController ()
@property (strong,nonatomic) MoviesModel* myMoviesModel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong,nonatomic) NSArray *pickerData;
@end

@implementation TableViewController


-(MoviesModel*)myMoviesModel{
    
    if(!_myMoviesModel)
        _myMoviesModel =[MoviesModel sharedInstance];
    
    return _myMoviesModel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerData = @[@"See the Button Text Change",@"Wow again?",@"Third Times The Charm",@"Pressing This will go to the Timer view too"];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return self.myMoviesModel.movieData.count;
    }
    
    else if (section == 1){
        return 1;
    }
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"MovieNameCell" forIndexPath:indexPath];
            // Configure the cell...
            cell.textLabel.text = self.myMoviesModel.movieData[indexPath.row][@"title"];
            break;
        
        case 1:
            
            NSLog(@"HERE");
            cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionCell" forIndexPath:indexPath];
            // Configure the cell...
            cell.textLabel.text = @"Poster Collection";
            break;
            
        default:
            NSLog(@"Spicy HERE");
            cell = [tableView dequeueReusableCellWithIdentifier:@"MoreCell" forIndexPath:indexPath];
            // Configure the cell...
            cell.textLabel.text = @"More Examples";
            break;
    }
    
    
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    BOOL isVC = [[segue destinationViewController] isKindOfClass:[ViewController class]];
    if(isVC){
        UITableViewCell* cell = (UITableViewCell*)sender;
        ViewController *vc = [segue destinationViewController];
        vc.indexPath = [self.tableView indexPathForCell: cell];
    }
    
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return _pickerData.count;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSLog(@"%@",_pickerData[row]);
    
    return _pickerData[row];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
