//
//  HomeFeedViewController.h
//  Instagram
//
//  Created by Emily Ito Okabe on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeFeedViewController : UIViewController <UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *arrayOfPosts;

- (IBAction)didTapLogout:(id)sender;

@end

NS_ASSUME_NONNULL_END
