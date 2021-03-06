//
//  ProfilePostCell.h
//  Instagram
//
//  Created by Emily Ito Okabe on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse/Parse.h"
@import Parse.PFImageView;

NS_ASSUME_NONNULL_BEGIN

@interface ProfilePostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionView;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *timestampView;

@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
