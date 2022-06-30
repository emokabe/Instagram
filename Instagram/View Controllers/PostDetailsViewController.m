//
//  PostDetailsViewController.m
//  Instagram
//
//  Created by Emily Ito Okabe on 6/29/22.
//

#import "PostDetailsViewController.h"
#import "PFImageView.h"

@interface PostDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet PFImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;

@end

@implementation PostDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.file = self.postInfo.image;
    self.usernameLabel.text = self.postInfo.author.username;
    self.captionLabel.text = self.postInfo.caption;
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MM/dd/yyyy, HH:mm"];
    NSString *dateStr = [dateformatter stringFromDate:self.postInfo.createdAt];
    
    self.timestampLabel.text = dateStr;
}

@end
