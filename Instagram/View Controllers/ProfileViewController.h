//
//  ProfileViewController.h
//  Instagram
//
//  Created by Emily Ito Okabe on 6/29/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *arrayOfPosts;

@end

NS_ASSUME_NONNULL_END
