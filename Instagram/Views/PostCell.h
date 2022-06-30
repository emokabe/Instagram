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

@protocol PostCellViewControllerDelegate

- (void)didEditPost;

@end

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionView;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *timestampView;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;



@property (strong, nonatomic) Post *post;

@property (nonatomic, weak) id<PostCellViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
