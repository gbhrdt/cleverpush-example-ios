//
//  ViewController.m
//  cleverpush-example-ios
//
//  Created by Marius Gebhardt on 01.07.19.
//  Copyright © 2019 CleverPush. All rights reserved.
//

#import "ViewController.h"
#import <CleverPush/CleverPush.h>

@interface ViewController ()

@property NSArray *fruits;

@end

@implementation ViewController

- (IBAction)buttonClick:(id)sender {
    [CleverPush showTopicsDialog];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
