//
//  HDPhotoHelper.m
//  HDCore
//
//  Created by 张达棣 on 16/7/7.
//  Copyright © 2016年 HD. All rights reserved.
//

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
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        if (_selectImageBlock) {
            _selectImageBlock(mediaURL);
        }
    }
    
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}



@end
