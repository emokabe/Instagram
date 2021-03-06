//
//  ProfileViewController.m
//  Instagram
//
//  Created by Emily Ito Okabe on 6/29/22.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "ComposeViewController.h"
#import "Post.h"
#import "ProfilePostCell.h"
#import "PostDetailsViewController.h"

@interface ProfileViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self getPosts];
    
    // Initialize a UIRefreshControl
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    NSLog(@"%@", PFUser.currentUser.username);
}

-(void)getPosts {
    // construct PFQuery
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    [postQuery whereKey:@"author" equalTo:PFUser.currentUser];
    NSUInteger limit = 10;
    __block NSUInteger skip = 0;
    postQuery.limit = limit;
    postQuery.skip = 0;

    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            NSLog(@"%@", posts);
            
            self.arrayOfPosts = [NSMutableArray arrayWithArray:posts];
            NSLog(@"%@", self.arrayOfPosts);
            
            if (posts.count == limit) {
                skip += limit;
                postQuery.skip = skip;
            }
            
            [self.tableView reloadData];
        }
        else {
            NSLog(@"Error!");
        }
        [self.refreshControl endRefreshing];
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProfilePostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfilePostCell"];
    
    [cell setPost:self.arrayOfPosts[indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfPosts.count;
}

@end
