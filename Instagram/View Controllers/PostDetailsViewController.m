//
//  PostDetailsViewController.m
//  Instagram
//
//  Created by Emily Ito Okabe on 6/29/22.
//

#import "PostDetailsViewController.h"
#import "PFImageView.h"

@interface PostDetailsViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;


@end

@implementation PostDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.postInfo.uiimage;
    self.usernameLabel.text = self.postInfo.author.username;
    self.captionLabel.text = self.postInfo.caption;
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MM/dd/yyyy, HH:mm"];
    NSString *dateStr = [dateformatter stringFromDate:self.postInfo.createdAt];
    
    self.timestampLabel.text = dateStr;
}

/*
 @property (strong, nonatomic) NSString *postID;
 @property (strong, nonatomic) NSString *userID;
 @property (strong, nonatomic) PFUser *author;
 @property (strong, nonatomic) NSString *caption;
 //@property (strong, nonatomic) NSDate *createdAt;
 @property (strong, nonatomic) NSNumber *likeCount;
 //@property (strong, nonatomic) NSNumber *commentCount;
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
