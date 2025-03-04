//
//  Utils.h
//  crumbit
//
//  Created by apple on 10/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


@interface UtilsFunctions : NSObject

BOOL SaveIntegerWithKey(NSInteger i, NSString* key);
BOOL SaveStringWithKey(NSString* s, NSString* key);
BOOL SaveDataWithKey(NSData* s, NSString* key);
BOOL SaveDictObjectWithKey(id obj,NSString * key);
BOOL SaveArrayWithKey (NSArray *array, NSString * key);

NSString * getBackgroundImageName(NSString *bkImageId);

NSInteger GetIntegerWithKey(NSString * key);
NSString* GetStringWithKey(NSString* key);
NSData * GetDataWithKey(NSString* key);
id GetDictObjectWithKey(NSString* key);
NSArray * GetArrayWithKey(NSString* key);

BOOL DeleteDataWithKey(NSString * key);
void ShowMessage(NSString *title, NSString *msg);

+(UIColor *) getNavTintColor;

+(NSString *)getImageNameAgainstCategoryName:(NSString *)catName;

+(void)setGrayBackgroundToButton:(UIButton*)b;
//+(void)setBackgroundToLogInButton:(UIButton*)b;
//+(void)setBackgroundToRegisterButton:(UIButton*)b;
+(UIView *) setNavigationBarTitle:(NSString *)titleString;
BOOL BoolWithKey(NSString* key);
+ (BOOL) validateEmail: (NSString *)candidate;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+(UIImage *)reScaleImageWithProportionWith:(UIImage *)image;
+ (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size;
+(void)setSize:(CGSize)size toView:(UIView*)v;

+(void)makeUIImageViewRound:(UIImageView*)imgView ANDRadius:(float)rad;
+(void)makeUIViewRound:(UIView*)view ANDRadius:(int)rad;
+ (NSString *) getFormattedDateFromDate:(NSDate *)addedDate;
+ (NSString *) getFormattedTimeFromDate:(NSDate *)addedDate;
+(NSString *) getFormattedDateFromString:(NSString *)addedDate;
+ (NSString *) getFormattedDateFromDateWithProfileFormat:(NSDate *)addedDate;

+(void)saveAllEndorsementArrayInUserDefaults:(NSArray *)array;

+(UIImage *)compressImage:(UIImage *)img WithSize:(CGSize)newSize;

+(NSInteger)getIndexOfCharTappedWith:(UITouch*)touch ANDInTheLabel:(UILabel*)label;

+(CGSize)getStringSizeWithString:(NSString *)text ANDFont:(UIFont*)font;

+ (CGImageRef)CGImageRotatedByAngle:(CGImageRef)imgRef angle:(CGFloat)angle;

+(NSString *)getBase64StringFromImage:(UIImage*)image;

+(NSString *)getUTCFormatDate:(NSDate *)localDate;
+(NSDateFormatter*)getServerDateFormatter;
+(NSInteger)getHourComponentFromDate:(NSDate*)date;
+(NSString *)getShortDaySymbolFromDateString:(NSString*)dateString;
//+(NSURL *)saveImageInDirectory:(UIImage*)image;
+(NSString *)saveImageInDirectory:(UIImage*)image;

@end