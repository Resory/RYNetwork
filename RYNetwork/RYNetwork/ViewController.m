//
//  ViewController.m
//  RYNetwork
//
//  Created by billionsfinance-resory on 16/1/8.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "ViewController.h"
#import "RYWeatherDao.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[RYWeatherDao shareInstance] getWeatherInfoWithCity:@"beijing" andSuccess:^(id response) {
        
        NSLog(@"respone = %@",response);
        
    } andFailed:^(id response) {
        
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
