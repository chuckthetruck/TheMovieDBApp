//
//  ViewController.m
//  TheMovieDBApp
//
//  Created by Charles Sayre on 9/8/20.
//  Copyright © 2020 Charles Sayre. All rights reserved.
//

#import "ViewController.h"
#import "MoviesModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (strong,nonatomic) MoviesModel* myMoviesModel;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *overview;
@property (weak, nonatomic) IBOutlet UILabel *releaseDate;
@property (weak, nonatomic) IBOutlet UILabel *popValue;
@property (weak, nonatomic) IBOutlet UILabel *voteAVG;
@end



@implementation ViewController
@synthesize overview = _overview;
@synthesize title = _title;
@synthesize releaseDate = _releaseDate;
@synthesize popValue = _popValue;
@synthesize voteAVG = _voteAVG;

-(MoviesModel*)myMoviesModel{
    
    if(!_myMoviesModel)
        _myMoviesModel =[MoviesModel sharedInstance];
    
    return _myMoviesModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //dispatch_async(dispatch_get_main_queue(),^{
      //  self.posterImageView.image = [[MoviesModel sharedInstance] getImageWithIndex:self.indexPath];
    //});
    
    [self.myMoviesModel getImageWithIndex:self.indexPath withView: self.posterImageView];
    
    self.overview.text = self.myMoviesModel.movieData[self.indexPath.row][@"overview"];
    self.title.text = self.myMoviesModel.movieData[self.indexPath.row][@"title"];
    self.releaseDate.text = self.myMoviesModel.movieData[self.indexPath.row][@"release_date"];
    self.popValue.text = [NSString stringWithFormat: @"%@",self.myMoviesModel.movieData[self.indexPath.row][@"popularity"]];
    self.voteAVG.text = [NSString stringWithFormat: @"%@",self.myMoviesModel.movieData[self.indexPath.row][@"vote_average"]];;
}

/*-(UIImageView*)posterImageView{
    
    NSLog(@"HERE");
    
    if(!_posterImageView)
        _posterImageView = [[UIImageView alloc] initWithImage: [self.myMoviesModel getImageWithIndex:_indexPath]];
    return _posterImageView;
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
