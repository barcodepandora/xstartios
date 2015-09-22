//
//  WriteBrandViewController.m
//  XTODO001
//
//  Created by Juan Manuel Moreno on 26/07/15.
//  Copyright (c) 2015 Juan Manuel Moreno. All rights reserved.
//

#import "WriteBrandViewController.h"

@interface WriteBrandViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tSong;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *bSong;
@end

@implementation WriteBrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Hola soy el WriteBrand");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if (sender != self.bSong) return;
    
    if (self.tSong.text.length > 0) {

        self.song = [[RecycledSong alloc] init];
        self.song.name = self.tSong.text;
        self.song.completed = NO;
    }
}


@end
