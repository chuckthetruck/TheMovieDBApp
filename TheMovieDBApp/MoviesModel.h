//
//  MoviesModel.h
//  TheMovieDBApp
//
//  Created by Charles Sayre on 9/8/20.
//  Copyright © 2020 Charles Sayre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoviesModel : NSObject

+(MoviesModel*)sharedInstance;

-(void*) getImageWithIndex: (NSIndexPath*)indexPath withView: (UIImageView*) tempView;

@property (strong,nonatomic) NSMutableArray *movieData;

@end

NS_ASSUME_NONNULL_END
