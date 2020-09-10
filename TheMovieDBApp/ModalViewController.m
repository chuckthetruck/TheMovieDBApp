//
//  ModalViewController.m
//  TheMovieDBApp
//
//  Created by Charles Sayre on 9/9/20.
//  Copyright © 2020 Charles Sayre. All rights reserved.
//

#import "ModalViewController.h"
#import "MoviesModel.h"

@interface ModalViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) UIImageView* imageView;
@property (strong, nonatomic) MoviesModel* myMoviesModel;
@end

@implementation ModalViewController

-(MoviesModel*)myMoviesModel{
    
    if(!_myMoviesModel)
        _myMoviesModel =[MoviesModel sharedInstance];
    
    return _myMoviesModel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageView = [[UIImageView alloc] initWithImage:[self.myMoviesModel getFullsizeImageWithIndex:self.indexPath withView: self.imageView]];
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.frame.size;
    self.scrollView.minimumZoomScale = .1;
    self.scrollView.delegate = self;
    
    self.scrollView.zoomScale = .2;
    
}

/*-(UIImageView*)imageView{
    
    if(!_imageView)
        dispatch_async(dispatch_get_main_queue(),^{
            _imageView = [[UIImageView alloc] initWithImage:[self.myMoviesModel getFullsizeImageWithIndex:self.indexPath withView: self.imageView]];});
    return _imageView;
}*/

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}
- (IBAction)dismissButton:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
