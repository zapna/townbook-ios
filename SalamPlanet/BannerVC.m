//
//  BannerVC.m
//  SalamCenterApp
//
//  Created by Waseem Asif on 30/11/2015.
//  Copyright © 2015 Globit. All rights reserved.
//

#import "BannerVC.h"
#import "UIImageView+WebCache.h"
@interface BannerVC ()

@end

@implementation BannerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.imageView setImageWithURL:[NSURL URLWithString:_imageUrl] placeholderImage:[UIImage imageNamed:@"place-holder"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
