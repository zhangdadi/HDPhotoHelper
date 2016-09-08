//
//  HDPhotoHelper.h
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

@end
