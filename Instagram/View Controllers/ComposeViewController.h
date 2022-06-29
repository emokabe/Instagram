//
//  ComposeViewController.h
//  Instagram
//
//  Created by Emily Ito Okabe on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate

- (void)didPost;

@end

@interface ComposeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
// TODO: Add tableview delgate and datasource later

@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;

- (IBAction)didTapCancel:(id)sender;

- (IBAction)didTapSelectImage:(id)sender;

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
