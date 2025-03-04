//
//  Utils.m
//  crumbit
//
//  Created by apple on 10/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UtilsFunctions.h"
#import "Constants.h"
#import "DataManager.h"


@implementation UtilsFunctions

+(UIView *) setNavigationBarTitle:(NSString *)titleString
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 10, 40, 19)];
    imageView.image = [UIImage imageNamed:@"top_logo.png"];
    [view addSubview:imageView];
    
    CGRect frame = CGRectMake(150, 0, [titleString sizeWithFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]].width, 44);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    label.textColor = [UIColor colorWithRed:201.0/255.0 green:140.0/255 blue:27.0/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = titleString;
    [view addSubview:label];
    return view;
}
void ShowMessage(NSString *title, NSString *msg)
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg
												   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
	[alert show];
}
BOOL SaveIntegerWithKey(NSInteger i, NSString* key)
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:i forKey:key];
    return [defaults synchronize];
}
BOOL SaveStringWithKey(NSString* s, NSString* key)
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:s forKey:key];
    return [defaults synchronize];
}
BOOL SaveDictObjectWithKey(id obj,NSString * key){
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:obj forKey:key];
    return [defaults synchronize];
}
BOOL SaveArrayWithKey (NSArray *array, NSString * key){
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:array forKey:key];
    return [defaults synchronize];
}
NSInteger GetIntegerWithKey(NSString * key)
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    return (NSInteger)[defaults integerForKey:key];
}
NSString* GetStringWithKey(NSString * key)
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:key];
}
BOOL SaveDataWithKey(NSData* s, NSString* key)
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:s forKey:key];
    return [defaults synchronize];
}
NSData * GetDataWithKey(NSString* key)
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults dataForKey:key];
}
id  GetDictObjectWithKey(NSString* key){
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}
NSArray * GetArrayWithKey(NSString* key){
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}
BOOL DeleteDataWithKey(NSString * key)
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    return YES;
}

BOOL BoolWithKey(NSString* key)
{
    if(!key) return NO;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
    
}
+(void)makeUIImageViewRound:(UIImageView*)imgView ANDRadius:(float)rad{
    CALayer *imageLayer = imgView.layer;
    [imageLayer setCornerRadius:rad];
    [imageLayer setMasksToBounds:YES];
}
+(void)makeUIViewRound:(UIView*)view ANDRadius:(int)rad{
    CALayer *viewLayer = view.layer;
    [viewLayer setCornerRadius:rad];
    [viewLayer setMasksToBounds:YES];
}
+(UIColor *) getNavTintColor {
    return [UIColor colorWithRed:24.0f/255.0f green:133.0f/255.0f blue:242.0f/255.0f alpha:1.0f];
}

+(UIImage*)getRedBorderAndGrayTransparacyResizableImage
{
    return [[UIImage imageNamed:@"bg_box.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
}
+(void)setGrayBackgroundToButton:(UIButton*)b
{
    UIImage *im = [[UIImage imageNamed:@"bg_btn.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
    UIImage *im_t = [[UIImage imageNamed:@"bg_btn_active.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
    
    [b setBackgroundImage:im forState:UIControlStateNormal];
    [b setBackgroundImage:im_t forState:UIControlStateHighlighted];
}

+ (BOOL) validateEmail: (NSString *)candidate {
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    
    return [emailTest evaluateWithObject:candidate];
}
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
//    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
//    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
    
    CGRect rect = CGRectMake(0,0,newSize.width,newSize.height);
    UIGraphicsBeginImageContext( rect.size );
    [image drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *img=[UIImage imageWithData:imageData];
    return img;
}
+(UIImage *)reScaleImageWithProportionWith:(UIImage *)image{
    float x,y;
    if (image.size.width>(320*2)) {
        x=image.size.width/(320*2);
        y=image.size.height/x;
    }
    else{
        return image;
    }
    CGRect rect = CGRectMake(0,0,320*2,y);
    UIGraphicsBeginImageContext( rect.size );
    [image drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *img=[UIImage imageWithData:imageData];
    return img;
}
+ (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size
{
    double x = (image.size.width - size.width) / 2.0;
    double y = (image.size.height - size.height) / 2.0;
    
    CGRect cropRect = CGRectMake(x, y, size.width, size.height);
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], cropRect);
    
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return cropped;
}
+(void)setSize:(CGSize)size toView:(UIView*)v
{
    CGRect frame = v.frame;
    frame = CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
    v.frame = frame;
}
NSString * getBackgroundImageName(NSString *bkImageId)
{
    if([bkImageId isEqualToString:@"image1"])
    {
        return (@"bkground_1.png");
    }
    else if([bkImageId isEqualToString:@"image2"])
    {
        return (@"bkground_2.png");
    }
    else if([bkImageId isEqualToString:@"image3"])
    {
        return (@"bkground_3.png");
    }
    else if([bkImageId isEqualToString:@"image4"])
    {
        return (@"bkground_4.png");
    }
    else if([bkImageId isEqualToString:@"image5"])
    {
        return (@"bkground_5.png");
    }
    else if([bkImageId isEqualToString:@"image6"])
    {
        return (@"bkground_6.png");
    }
    else if([bkImageId isEqualToString:@"image7"])
    {
        return (@"bkground_7.png");
    }
    else if([bkImageId isEqualToString:@"image8"])
    {
        return (@"bkground_8.png");
    }
    else if([bkImageId isEqualToString:@"image9"])
    {
        return (@"bkground_9.png");
    }
    else if([bkImageId isEqualToString:@"image10"])
    {
        return (@"bkground_10.png");
    }
    else if([bkImageId isEqualToString:@"image11"])
    {
        return (@"bkground_11.png");
    }
    else if([bkImageId isEqualToString:@"image12"])
    {
        return (@"bkground_12.png");
    }
    else{
        return (@"");
    }
}
+(NSString *)getImageNameAgainstCategoryName:(NSString *)catName{
    
    if([catName isEqualToString:kBookCategory])
    {
        return (@"books.png");
    }
    else{
        return (@"");
    }
}
+ (NSString *) getFormattedDateFromDate:(NSDate *)addedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yy"];//@"dd-MMM-yyyy"//@"yyyy-MM-dd"];
    NSString *date = [formatter stringFromDate:addedDate];
    return date;
}
+ (NSString *) getFormattedTimeFromDate:(NSDate *)addedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm"];// a
    NSString *date = [formatter stringFromDate:addedDate];
    return date;
}

+ (NSString *) getFormattedDateFromString:(NSString *)addedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    NSDate * dateString=[formatter dateFromString:addedDate];
    [formatter setDateFormat:@"MMMM dd, yyyy"];//@"yyyy-MM-dd"];
    NSString *date = [formatter stringFromDate:dateString];
    return date;
}
+ (NSString *) getFormattedDateFromDateWithProfileFormat:(NSDate *)addedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM dd,yyyy"];//@"dd-MMM-yyyy"//@"yyyy-MM-dd"];
    NSString *date = [formatter stringFromDate:addedDate];
    return date;
}
#pragma mark:Save Endorsement in user default
+(void)saveAllEndorsementArrayInUserDefaults:(NSArray *)array{
    NSMutableArray *archiveArray = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary * di in array) {
        NSData *personEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:di];
        [archiveArray addObject:personEncodedObject];
    }
    NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];
    [userData setObject:archiveArray forKey:kArrayEndorsementCreatedLocally];
}

#pragma mark:Compress or resize the image
+(UIImage *)compressImage:(UIImage *)img WithSize:(CGSize)newSize{
    UIGraphicsBeginImageContext(newSize);
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma mark:Get Index In UILabel With UITouch
+(NSInteger )getIndexOfCharTappedWith:(UITouch*)touch ANDInTheLabel:(UILabel*)label{
    
    CGPoint tapLocation = [touch locationInView:label];
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:label.attributedText];
    
    // init text storage
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:attributedText];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    
    // init text container
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(label.frame.size.width, label.frame.size.height+100) ];
    textContainer.lineFragmentPadding  = 0;
    textContainer.maximumNumberOfLines = label.numberOfLines;
    textContainer.lineBreakMode        = label.lineBreakMode;
    textContainer.layoutManager        = layoutManager;
    
    [layoutManager addTextContainer:textContainer];
    [layoutManager setTextStorage:textStorage];
    
    NSInteger characterIndex = [layoutManager characterIndexForPoint:tapLocation
                                                      inTextContainer:textContainer
                             fractionOfDistanceBetweenInsertionPoints:NULL];
    return characterIndex;
}
+(CGSize)getStringSizeWithString:(NSString *)text ANDFont:(UIFont*)font{
    return  [text sizeWithFont:font];
}
+ (CGImageRef)CGImageRotatedByAngle:(CGImageRef)imgRef angle:(CGFloat)angle
{
    
    CGFloat angleInRadians = angle * (M_PI / 180);
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    CGRect imgRect = CGRectMake(0, 0, width, height);
    CGAffineTransform transform = CGAffineTransformMakeRotation(angleInRadians);
    CGRect rotatedRect = CGRectApplyAffineTransform(imgRect, transform);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef bmContext = CGBitmapContextCreate(NULL,
                                                   rotatedRect.size.width,
                                                   rotatedRect.size.height,
                                                   8,
                                                   0,
                                                   colorSpace,
                                                   kCGImageAlphaPremultipliedFirst);
    CGContextSetAllowsAntialiasing(bmContext, YES);
    CGContextSetShouldAntialias(bmContext, YES);
    CGContextSetInterpolationQuality(bmContext, kCGInterpolationHigh);
    CGColorSpaceRelease(colorSpace);
    CGContextTranslateCTM(bmContext,
                          +(rotatedRect.size.width/2),
                          +(rotatedRect.size.height/2));
    CGContextRotateCTM(bmContext, angleInRadians);
    CGContextTranslateCTM(bmContext,
                          -(rotatedRect.size.width/2),
                          -(rotatedRect.size.height/2));
    CGContextDrawImage(bmContext, CGRectMake(0, 0,
                                             rotatedRect.size.width,
                                             rotatedRect.size.height),
                       imgRef);
    
    
    
    CGImageRef rotatedImage = CGBitmapContextCreateImage(bmContext);
    CFRelease(bmContext);
    
    return rotatedImage;
}
+(NSString *)getBase64StringFromImage:(UIImage*)image
{
    NSString * base64String = nil;
    if (image) {
        NSData *plainData = UIImagePNGRepresentation(image);
        base64String = [plainData base64EncodedStringWithOptions:0];
    }
    return base64String;
}
+(NSString *)getUTCFormatDate:(NSDate *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:localDate];
    return dateString;
}
+(NSDateFormatter*)getServerDateFormatter
{
    static NSDateFormatter* formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    });
    return formatter;
}
+ (NSInteger)getHourComponentFromDate:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit| NSMonthCalendarUnit | NSYearCalendarUnit |NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:date];
    NSInteger hourComponent = [components hour];
    return hourComponent;
}
+ (NSString *)getShortDaySymbolFromDateString:(NSString*)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:@"EEE"];
    NSString *daySymbol = [dateFormatter stringFromDate:date];
    return daySymbol;
}
//+ (NSURL *)saveImageInDirectory:(UIImage*)image
//{
//    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSString *imageDate=[formatter stringFromDate:[NSDate date]];
//    NSString *imageName=[NSString stringWithFormat:@"%@.png",imageDate];
//    NSURL *documentDirectory = [[DataManager sharedInstance] applicationDocumentsDirectory];
//    NSURL *filepath = [documentDirectory URLByAppendingPathComponent:imageName];
//    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(image, 0.5)];
//    if ([imageData writeToURL:filepath atomically:YES])
//        return filepath;
//    else
//        return nil;
////    NSString *filepath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:imageName];
////    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(image, 0.5)];
////    if ([imageData writeToFile:filepath atomically:YES])
////        return filepath;
////    else
////        return nil;
//}
+(NSString *)saveImageInDirectory:(UIImage*)image
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString *imageDate=[formatter stringFromDate:[NSDate date]];
    NSString *imageName=[NSString stringWithFormat:@"%@.png",imageDate];
    NSString *filepath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:imageName];
    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(image, 0.5)];
    
    //NSURL * url = [NSURL fileURLWithPath:filepath];
    if ([imageData writeToFile:filepath atomically:YES])
        return filepath;
    else
        return nil;
}
@end
