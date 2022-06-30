//
//  PostCell.m
//  Instagram
//
//  Created by Emily Ito Okabe on 6/28/22.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setPost:(Post *)post {
    _post = post;
    self.photoImageView.file = post[@"image"];
    self.captionView.text = post[@"caption"];
    self.usernameLabel.text = post[@"author"][@"username"];
    self.likeCount.text = [post[@"likeCount"] stringValue];
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MM/dd/yyyy, HH:mm"];
    NSString *dateStr = [dateformatter stringFromDate:self.post.createdAt];
    
    self.timestampView.text = dateStr;
    
    [self.photoImageView loadInBackground];
}

- (IBAction)didTapLike:(id)sender {
    if (self.post.liked) {
        self.post.liked = NO;
        self.post.likeCount = @([self.post.likeCount floatValue] - 1);
    } else {
        self.post.liked = YES;
        self.post.likeCount = @([self.post.likeCount floatValue] + 1);
        self.likeCount.text = [NSString stringWithFormat:@"%@", self.post.likeCount];
    }
    
    // Update cell UI
    [self refreshData];
    [self.delegate didEditPost];
}

-(void)refreshData {
    if (self.post.liked) {
        [self.likeButton setImage:[UIImage imageNamed:@"instagram-red-heart-icon"] forState:UIControlStateNormal];
    } else {
        [self.likeButton setImage:[UIImage imageNamed:@"instagram-heart-icon"] forState:UIControlStateNormal];
    }

}

@end
