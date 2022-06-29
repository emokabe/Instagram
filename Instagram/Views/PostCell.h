//
//  PostCell.h
//  Instagram
//
//  Created by Emily Ito Okabe on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse/Parse.h"
@import Parse.PFImageView;

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;
@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
