//
//  ViewController.m
//  TheMovieDBApp
//
//  Created by Charles Sayre on 9/7/20.
//  Copyright © 2020 Charles Sayre. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak,nonatomic) NSDictionary *movieData;
@end

@implementation ViewController
@synthesize movieData = _movieData;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getJSONData];
}

//Code modefidyed from codementor.io/@rheller/getting-reading-json-data-from-url-objective-c-du107s5mf
//chanfes the string and will save to a class variable for the JSON
- (void) getJSONData{
    
    NSError *error;
    NSString *urlString = [NSString stringWithFormat:@"https://api.themoviedb.org/3/discover/movie?api_key=a162de9ef2506e96acd6fe602ba16c43&sort_by=popularity.desc"];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    
    self.movieData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@"%@",self.movieData);
    
}


@end
