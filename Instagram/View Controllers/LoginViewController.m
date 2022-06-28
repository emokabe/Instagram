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
    // Do any additional setup after loading the view.
}

- (IBAction)loginUser:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            //[self performSegueWithIdentifier:@"segueOnLoginSuccess" sender:nil];
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil]; //
            HomeFeedViewController *feedVC = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"]; //
            self.view.window.rootViewController = feedVC;
            
            // no segueways, just swapping root view controllers
            
            
            //[self performSegueWithIdentifier:@"segueOnLoginSuccess" sender:nil];
            // display view controller that needs to shown after successful login
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
