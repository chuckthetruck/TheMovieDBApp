//
//  MoviesModel.m
//  TheMovieDBApp
//
//  Created by Charles Sayre on 9/8/20.
//  Copyright © 2020 Charles Sayre. All rights reserved.
//

#import "MoviesModel.h"

@implementation MoviesModel
@synthesize movieData = _movieData;
@synthesize apiCalls = _apiCalls;



+(MoviesModel*)sharedInstance{
    
    static MoviesModel* _sharedInstance = nil;
    static dispatch_once_t predicate;

    dispatch_once (&predicate,^{_sharedInstance = [[MoviesModel alloc] init];});
    
    return _sharedInstance;
    
}

-(NSMutableArray *)movieData{
    
    if(!_movieData){
        
        //Code modefidyed from codementor.io/@rheller/getting-reading-json-data-from-url-objective-c-du107s5mf
        //changes the string and will save to a class variable for the JSON
        
        NSError *error;
        NSString *urlString = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a162de9ef2506e96acd6fe602ba16c43"];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        self.movieData = [json valueForKey:@"results"];
        
    }
    
    return _movieData;
    
}


- (void) changeMoviesData: (NSString*) fromString{
    
    NSLog(@"%@",fromString);
    NSError *error;
    NSString *urlString = [NSString stringWithFormat:fromString];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    self.movieData = [json valueForKey:@"results"];
}

- (void) getImageWithIndex: (NSIndexPath*) indexPath withView: (UIImageView*) tempView{
    
    NSString* imageURL = @"https://image.tmdb.org/t/p/w185";
    
    imageURL = [imageURL stringByAppendingString:_movieData[indexPath.row][@"poster_path"]];
    
    UIImage* poster = nil;
    
    NSData *posterImageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:imageURL]];
    
    poster = [UIImage imageWithData:posterImageData];

    dispatch_async(dispatch_get_main_queue(),^{
        tempView.image = poster;
    });
}

- (UIImage*) getFullsizeImageWithIndex: (NSIndexPath*) indexPath withView: (UIImageView*) tempView{
    
    NSString* imageURL = @"https://image.tmdb.org/t/p/original";
    
    imageURL = [imageURL stringByAppendingString:_movieData[indexPath.row][@"poster_path"]];
    
    UIImage* poster = nil;
    
    NSData *posterImageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:imageURL]];
    
    poster = [UIImage imageWithData:posterImageData];
    
    return poster;
}

@end
