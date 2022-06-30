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
#import "ComposeViewController.h"
#import "Post.h"
#import "PostCell.h"
#import "PostDetailsViewController.h"

@interface HomeFeedViewController () <ComposeViewControllerDelegate, PostCellViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    //self.navigationController.navigationBarHidden = NO;
    
    [self getPosts];
    
    // Initialize a UIRefreshControl
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    NSLog(@"%@", PFUser.currentUser.username);
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
     PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
     
     [cell setPost:self.arrayOfPosts[indexPath.row]];
     
     return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfPosts.count;
}

- (IBAction)didTapLogout:(id)sender {
    NSLog(@"%@", PFUser.currentUser.username);
    
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        NSLog(@"%@", loginViewController);
        self.view.window.rootViewController = loginViewController; // substitute, less elegant
        
        //[self.navigationController.tabBarController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    NSLog(@"%@", PFUser.currentUser.username);
}



#pragma mark - Navigation


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"composeSegue"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
        composeController.delegate = self;
    } else if([segue.identifier isEqualToString:@"detailsSegue"]) {
        // 1 Get indexpath
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        // 2 Get movie dictionary
        Post *dataToPass = self.arrayOfPosts[indexPath.row]; // results -> movies
        
        // 3 Get reference to destination controller
        PostDetailsViewController *detailsVC = [segue destinationViewController];
        
        // 4 Pass the local dictionary to the view controller property
        detailsVC.postInfo = dataToPass;
    }
}

-(void)getPosts {
    // construct PFQuery
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;

    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
            // display all cells here?
            NSLog(@"%@", posts);
            self.arrayOfPosts = [NSMutableArray arrayWithArray:posts];
            [self.tableView reloadData];
        }
        else {
            NSLog(@"Error!");
        }
        [self.refreshControl endRefreshing];
    }];
}


- (void)didPost {
    //[self.arrayOfTweets insertObject:tweet atIndex:0];
    //[self.tableView reloadData];
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    [self getPosts];
}

- (void)didEditPost {
    [self getPosts];
}


@end
