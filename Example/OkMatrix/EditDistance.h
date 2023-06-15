//
//  EditDistance.h
//  OkMatrix_Example
//
//  Created by macairlzq on 2023/6/16.
//  Copyright © 2023 willlzq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditDistance : NSObject
//he Levenshtein Distance of the two strings
//编辑距离 详情参考:http://www.cnblogs.com/sumuncle/p/5632032.html
+(NSInteger)EditDistance:(NSString*)FirstString SencondCharacterSequence:(NSString*)SencondString;
//计算2个字符串的相似比例
+(double)StringSimilarity:(NSString*)FirstString SencondCharacterSequence:(NSString*)SencondString;

//计算两个字符串的最大公约数
+(NSString*)StringGreatest:(NSString*)FirstString  Sencond:(NSString*)SencondString;
@end

NS_ASSUME_NONNULL_END
