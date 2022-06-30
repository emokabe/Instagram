//
//  Post.h
//  Instagram
//
//  Created by Emily Ito Okabe on 6/28/22.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *postID;
@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) PFUser *author;
@property (strong, nonatomic) NSString *caption;
//@property (strong, nonatomic) NSDate *createdAt;
@property (strong, nonatomic) NSNumber *likeCount;
//@property (strong, nonatomic) NSNumber *commentCount;
@property (strong, nonatomic) UIImage *uiimage;
@property (strong, nonatomic) PFFileObject *image;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
