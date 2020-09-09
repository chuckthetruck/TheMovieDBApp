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
@property (strong, nonatomic) UIImageView *posterImageView;
@property (strong,nonatomic) MoviesModel* myMoviesModel;
@end

@implementation ViewController
@synthesize overview = _overview;

-(MoviesModel*)myMoviesModel{
    
    if(!_myMoviesModel)
        _myMoviesModel =[MoviesModel sharedInstance];
    
    return _myMoviesModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.posterImageView.image = [[MoviesModel sharedInstance] getImageWithIndex:self.indexPath];
    self.overview.text = self.myMoviesModel.movieData[self.indexPath.row][@"overview"];
    
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
