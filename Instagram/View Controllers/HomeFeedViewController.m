//
//  HomeFeedViewController.m
//  Instagram
//
//  Created by Emily Ito Okabe on 6/27/22.
//

#import "HomeFeedViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface HomeFeedViewController () // <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;

@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.feedTableView.dataSource = self;
    //self.feedTableView.delegate = self;
    
    //self.navigationController.navigationBarHidden = NO;
    
    NSLog(@"%@", PFUser.currentUser.username);
}

/*
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection: (NSInteger) section {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
}
 */

- (IBAction)didTapLogout:(id)sender {
    NSLog(@"%@", PFUser.currentUser.username);

    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        NSLog(@"%@", loginViewController);
        self.view.window.rootViewController = loginViewController; // substitute, less elegant
        /*
         
        // Option 1: Swap window root view controller
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        NSLog(@"%@", loginViewController);
        self.view.window.rootViewController = loginViewController; // substitute, less elegant
        
         */
        // Option 2: Trace back to the view controller that was presented and ask to be dismissed
        //[self.navigationController.tabBarController dismissViewControllerAnimated:YES completion:nil];
        
        // PFUser.current() will now be nil
    }];
    
    
    NSLog(@"%@", PFUser.currentUser.username);
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
