//
//  ViewController.m
//  HDPhotoHelperExample
//
//  Created by 张达棣 on 16/9/8.
//  Copyright © 2016年 张达棣. All rights reserved.
//

#import "ViewController.h"
#import "HDPhotoHelper.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//打开相机
- (IBAction)cameraButtonClick:(id)sender {
    [[HDPhotoHelper creatWithSourceType:UIImagePickerControllerSourceTypeCamera] showWithSelectImageBlock:^(id data) {
        NSLog(@"照片数据：%@", data);

    }];
}

//选择照片
- (IBAction)photoLibraryButtonClick:(id)sender {
    
    [[HDPhotoHelper creatWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary] showWithSelectImageBlock:^(id data) {
        NSLog(@"照片数据：%@", data);
        
    }];
}

@end
