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
    //post[@"caption"];
    [self.photoImageView loadInBackground];
}

@end
