//
//  HDPhotoHelper.h
//  HDCore
//
//  Created by 张达棣 on 16/7/7.
//  Copyright © 2016年 HD. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  选择照片后回调
 *
 *  @param data 类型为UIIimage和NSURL,如果为NSURL则为视频地址,否则为图片数据
 */
typedef void (^HDPhotoHelperBlock) (id data);

/**
 *  照片助手
 */
@interface HDPhotoHelper : UIImagePickerController

/**
 *  创建照片助手
 *
 *  @param sourceType       类型
 *
 *  @return 本对象
 */
+ (instancetype)creatWithSourceType:(UIImagePickerControllerSourceType)sourceType;

/**
 *  开始显示
 *
 *  @param selectImageBlock 选择照片后回调
 */
- (void)showWithSelectImageBlock:(HDPhotoHelperBlock)selectImageBlock;

@property(nonatomic, weak) id<UINavigationControllerDelegate, UIImagePickerControllerDelegate> delegate NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "不可使用delegate");

@end
