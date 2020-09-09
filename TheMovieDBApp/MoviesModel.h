//
//  MoviesModel.h
//  TheMovieDBApp
//
//  Created by Charles Sayre on 9/8/20.
//  Copyright © 2020 Charles Sayre. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoviesModel : NSObject

+(MoviesModel*)sharedInstance;

//-(NSDictionary*)getMovieWithIndex:(NSNumber*)index;

@property (strong,nonatomic) NSMutableArray *movieData;

@end

NS_ASSUME_NONNULL_END
