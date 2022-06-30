//
//  ComposeViewController.m
//  Instagram
//
//  Created by Emily Ito Okabe on 6/28/22.
//

#import "ComposeViewController.h"
#import "Parse/Parse.h"
#import "SVProgressHUD/SVProgressHUD.h"
#import "ProgressHUD-Swift.h"


@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *postText;
@property (weak, nonatomic) IBOutlet UIImageView *postView;
@property (weak, nonatomic) IBOutlet UIButton *selectImageButton;


@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)didTapSelectImage:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    
    CGSize imageSize = originalImage.size;
    CGFloat multiplier = 0.9;
    self.postView.image = [self resizeImage:originalImage withSize:CGSizeMake(imageSize.width * multiplier, imageSize.height * multiplier)];
    // resize
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (IBAction)didPressShare:(id)sender {
    [Post postUserImage:self.postView.image withCaption:self.postText.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"Share success!");
            [self.delegate didPost];
        } else {
            NSLog(@"Post share failed: %@", error.localizedDescription);
            return;
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (IBAction)onScreenTap:(id)sender {
    [self.view endEditing:true];
}

@end
