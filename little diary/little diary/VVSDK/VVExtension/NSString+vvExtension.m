//
//  NSString+vvExtension.m
//  vvExtension
//
//  Created by wangyang on 2019/12/10.
//  Copyright © 2019 iule. All rights reserved.
//

#import "NSString+vvExtension.h"

@implementation NSString (vvExtension)

/// attributedStr
- (NSMutableAttributedString *)vv_attributedStr {
    return [[NSMutableAttributedString alloc] initWithString:self];
}

/**
 字符串高度
 
 @param font 字体
 @return 高度
 */
- (CGFloat)vv_heightWithFont:(UIFont *)font width:(CGFloat)width {
    return [self vv_heightWithFont:font lineSpace:0 width:width];
}

/**
 根据字体大小 行间距 宽度 计算字符串高度
 
 @param font font description
 @param lineSpace lineSpace description
 @param width width description
 @return return value description
 */
- (CGFloat)vv_heightWithFont:(UIFont *)font
                   lineSpace:(CGFloat)lineSpace
                       width:(CGFloat)width {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:font forKey:NSFontAttributeName];
    if (lineSpace > 0) {
        NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
        [para setLineSpacing:lineSpace];
        [dic setObject:para forKey:NSParagraphStyleAttributeName];
    }
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil];
    //此处要使用ceil函数 大于或等于的最小整数
    CGFloat height = ceil(CGRectGetHeight(rect));
    return height;
}

/**
 字符串宽度
 
 @param font 字体
 @return 宽度
 */
- (CGFloat)vv_widthWithFont:(UIFont *)font {
    return [self vv_widthWithFont:font wordSpace:0];
}

/**
 根据字体大小 字间距 计算字符串宽度
 
 @param font font description
 @param wordSpace wordSpace description
 @return return value description
 */
- (CGFloat)vv_widthWithFont:(UIFont *)font wordSpace:(CGFloat)wordSpace {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if (font) {
        [dic setObject:font forKey:NSFontAttributeName];
    }
    if (wordSpace > 0) {
        [dic setObject:@(wordSpace) forKey:NSKernAttributeName];
    }
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, font.lineHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //此处要使用ceil函数 大于或等于的最小整数
    CGFloat width = ceil(CGRectGetWidth(rect));
    return width;
}

@end
