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
@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong,nonatomic) NSArray *pickerData;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong,nonatomic) NSArray* apiCalls;
@end

@implementation TableViewController


-(MoviesModel*)myMoviesModel{
    
    if(!_myMoviesModel)
        _myMoviesModel =[MoviesModel sharedInstance];
    
    return _myMoviesModel;
}


-(NSArray*) apiCalls  {
    if(!_apiCalls){
        self.apiCalls =  @[@"https://api.themoviedb.org/3/movie/now_playing?api_key=a162de9ef2506e96acd6fe602ba16c43",
                           @"https://api.themoviedb.org/3/discover/movie?api_key=a162de9ef2506e96acd6fe602ba16c43&sort_by=popularity.desc&vote_count.gte=100",
                           @"https://api.themoviedb.org/3/discover/movie?api_key=a162de9ef2506e96acd6fe602ba16c43&sort_by=rating.desc&vote_count.gte=400",
                           @"https://api.themoviedb.org/3/discover/movie?api_key=a162de9ef2506e96acd6fe602ba16c43&sort_by=vote_average.desc&vote_count.gte=400",
                            ];
    }
    
    return _apiCalls;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerData = @[@"Now Playing",@"Popularity",@"Rating",@"User Score"];
    
    self.pickerView = [[UIPickerView alloc] init];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    self.textField.inputView = _pickerView;
    
    [self.pickerView selectRow:0 inComponent:0 animated:YES];
    
    self.textField.text = _pickerData[0];

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
            cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionCell" forIndexPath:indexPath];
            // Configure the cell...
            cell.textLabel.text = @"Poster Collection";
            break;
            
        default:
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
    
    
    
    return _pickerData[row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    [self.myMoviesModel changeMoviesData:self.apiCalls[row]];
    self.textField.text = self.pickerData[row];
    [self.textField resignFirstResponder];
    
    [self.tableView reloadData];
    
    
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
    
    
