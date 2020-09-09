//
//  ViewController.h
//  TheMovieDBApp
//
//  Created by Charles Sayre on 9/8/20.
//  Copyright © 2020 Charles Sayre. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *overview;
@property (strong, nonatomic) NSString *labelText;
@property (strong, nonatomic) NSIndexPath *indexPath;
@end

NS_ASSUME_NONNULL_END
