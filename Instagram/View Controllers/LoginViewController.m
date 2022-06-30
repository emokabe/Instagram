//
//  LoginViewController.m
//  Instagram
//
//  Created by Emily Ito Okabe on 6/27/22.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "HomeFeedViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)loginUser:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil]; //
            HomeFeedViewController *feedVC = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"]; //
            self.view.window.rootViewController = feedVC;
        }
    }];
}

- (IBAction)registerUser:(id)sender {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            [self performSegueWithIdentifier:@"segueOnLoginSuccess" sender:nil];
            // manually segue to logged in view
        }
    }];
}

- (IBAction)onScreenTap:(id)sender {
    [self.view endEditing:true];
}

@end
