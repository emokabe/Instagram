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

    // Configure the view for the selected state
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
    
    //post[@"caption"];
    [self.photoImageView loadInBackground];
}

@end
