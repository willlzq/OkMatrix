//
//  EditDistance.m
//  OkMatrix_Example
//
//  Created by macairlzq on 2023/6/16.
//  Copyright © 2023 willlzq. All rights reserved.
//

#import "EditDistance.h"
#import "YCMatrix.h"

@implementation EditDistance
//计算两个字符串的最大公约数
+(NSString*)StringGreatest:(NSString*)FirstString  Sencond:(NSString*)SencondString{
if (FirstString.length==0|| SencondString.length==0) {
    return @"";
}
if ([FirstString containsString:SencondString]) {
    return SencondString;
}
if ([SencondString containsString:FirstString]) {
    return FirstString;
}
NSRange maxRange=NSMakeRange(0, 0);
NSString *maxstr=((int)[FirstString length]>(int)[SencondString length])?FirstString:SencondString;
NSString *minstr=((int)[FirstString length]>(int)[SencondString length])?SencondString:FirstString;

for (int i=0; i<((int)[minstr length]-1); i++) {
    int pointer=(int) [maxstr rangeOfString:   [minstr substringWithRange: NSMakeRange(i, 1)]].location;
    
    if (pointer>=0) {
        NSRange rg=[EditDistance stringGreatestCommonDivisor: maxstr Sencond:minstr pointer: NSMakeRange(i, (int)[minstr length]-i)];
        if (maxRange.length<rg.length) {
            maxRange=rg;
                // webLog(@"i=%d maxRange=%@ str=%@", i, NSStringFromRange(maxRange),[minstr substringWithRange:  maxRange] );
            
        }
        
    }
    
}
if ((int)(maxRange.length)<=0) {
    return @"";
}
return  [minstr substringWithRange:  maxRange];
}
+(NSRange)stringGreatestCommonDivisor:(NSString*)maxstr  Sencond:(NSString*)minstr pointer:(NSRange)range{
NSInteger location= range.location;
for (NSInteger i=0; i<(range.length-1); i++) {
    NSRange NewRange=NSMakeRange(location,  range.length-i);
        // webLog(@"string i=%ld NewRange=%@ str=%@", (long)i, NSStringFromRange(NewRange),[minstr substringWithRange:  NewRange] );
    
    if ([maxstr containsString:[minstr substringWithRange:  NewRange] ]) {
        return NewRange;
    }
}
return NSMakeRange(0, 0);


}

+(NSRange)iSstringGreatestCommonDivisor:(NSString*)maxstr  Sencond:(NSString*)minstr pointer:(NSRange)range{
NSRange rg=NSMakeRange(0, 0);
if ([maxstr containsString:[minstr substringWithRange:  range] ]) {
    return range;
}else{
    if ((range.length-1)>=1) {
        NSRange NewRange=NSMakeRange(range.location,  range.length-1);
        rg= [EditDistance iSstringGreatestCommonDivisor:maxstr  Sencond:minstr pointer: NewRange];
    }
    else{
        return rg;
    }
}
return rg;
}
+(double)StringSimilarity:(NSString*)FirstString SencondCharacterSequence:(NSString*)SencondString{
size_t m = FirstString.length;
size_t n = SencondString.length;
double maxlength=MAX( m, n);
double  Distance=[EditDistance EditDistance: FirstString SencondCharacterSequence:SencondString];
return (maxlength-Distance)/maxlength;

}
+(NSInteger)EditDistance:(NSString*)FirstString SencondCharacterSequence:(NSString*)SencondString{
if(SencondString ==NULL)
    {return FirstString.length;}

size_t m = FirstString.length;
size_t n = SencondString.length;

    //定义矩阵
Matrix *EditMatrix = [Matrix matrixOfRows:n+1 columns:m+1 value:0.0];
for(int j=0;j<= m;j++){
        //初始化第一行
    [EditMatrix i:0 j:j set: j];
}
for(int i=0;i<= n;i++){
        //初始化第一列
    [EditMatrix i:i j:0 set: i];
}
    //levenshtein
    //meilenstein
for(int r=1;r<= m;r++){
    NSString *FirstS=[FirstString substringWithRange: NSMakeRange(r-1, 1)];
    for(int c=1;c<= n;c++){
        int cost=1;
        NSString *SencondS=[SencondString substringWithRange: NSMakeRange(c-1, 1)];
        if([FirstS isEqualToString:SencondS]){
            cost=0;
        }
        
        
            //左上角
        int lefthandcorner=[EditMatrix i: c-1 j:r-1];
            //左边角
        int upcorner=[EditMatrix i: c j:r-1];
            //上角
        int leftcorner=[EditMatrix i: c-1 j:r];
        
        int mincount=MIN( MIN(lefthandcorner,upcorner),leftcorner)+cost;
            //  webLog(@"%@[%d]%@=%@[%d]  [%d,%d,%d] min=%d",FirstS,r-1,(cost>0)?@"!":@"", SencondS,c-1,upcorner,lefthandcorner,leftcorner,mincount);
        [EditMatrix i:c j:r set: mincount ];
        
    }
}
    //webLog(@"Result:\n%@", [EditMatrix descriptionInt]);
return (int)[EditMatrix  i:n  j: m] ;
}
@end
