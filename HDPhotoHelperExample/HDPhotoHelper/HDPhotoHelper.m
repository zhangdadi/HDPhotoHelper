//
//  HDPhotoHelper.m
//  HDCore
//
//  Created by 张达棣 on 16/7/7.
//  Copyright © 2016年 HD. All rights reserved.
//
//  GitHub:https://github.com/zhangdadi/HDPhotoHelper
//  email: z_dadi@163.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "HDPhotoHelper.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface HDPhotoDelegateHelper: NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, copy) HDPhotoHelperBlock selectImageBlock;

@end

@interface HDPhotoHelper ()
@property (nonatomic, strong) HDPhotoDelegateHelper *helper;

@end

@implementation HDPhotoHelper

+ (instancetype)creatWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    HDPhotoHelper *picker          = [[HDPhotoHelper alloc] init];
    picker.helper                  = [[HDPhotoDelegateHelper alloc] init];
    picker.delegate                = picker.helper;
    picker.sourceType              = sourceType;
    return picker;
}

- (void)showWithSelectImageBlock:(HDPhotoHelperBlock)selectImageBlock {
    self.helper.selectImageBlock = selectImageBlock;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self animated:YES completion:nil];
}

@end



@implementation HDPhotoDelegateHelper

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:( NSString *)kUTTypeImage]){
        UIImage *theImage = nil;
        // 判断，图片是否允许修改
        if ([picker allowsEditing]){
            theImage = [info objectForKey:UIImagePickerControllerEditedImage];
        } else {
            theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            
        }
        if (_selectImageBlock) {
            _selectImageBlock(theImage);
        }
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]){
        //获取视频文件的url
        NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
        if (_selectImageBlock) {
            _selectImageBlock(mediaURL);
        }
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}



@end
