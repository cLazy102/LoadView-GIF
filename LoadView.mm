#import <UIKit/UIKit.h>
#include "Includes.h"
#import "menuIcon.h"
#import "../mahoa.h"// file encrypt
#import <ImageIO/ImageIO.h>

#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
extern bool MenDeal;
@interface MenuLoad()
@property (nonatomic, strong) ImGuiDrawView *vna;
- (ImGuiDrawView*) GetImGuiView;
@end

static MenuLoad *extraInfo;

UIButton* InvisibleMenuButton;
UIButton* VisibleMenuButton;
MenuInteraction* menuTouchView;
UITextField* hideRecordTextfield;
UIView* hideRecordView;
ImVec2 menuPos, menuSize;
static UIImageView *cLazyGIF;

@interface MenuInteraction()
@end

@implementation MenuInteraction

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}

@end

@implementation MenuLoad

- (ImGuiDrawView*) GetImGuiView
{
    return _clazy;
}

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info)
{   
    timer(4) {
        extraInfo = [MenuLoad new];
        [extraInfo initTapGes];
				
    });
}



__attribute__((constructor)) static void initialize()
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDrop);
}

//tạo paid key đặt dưới này
//paid key mà ko làm được, phải hỏi chat gpt thì mày nghỉ mẹ đi, hắc cơ cái lồn què gì ?

- (void) // void gì ? lại search gpt à ?

-(void)initTapGes
{
    UIView* mainView = [UIApplication sharedApplication].windows[0].rootViewController.view;
    hideRecordTextfield = [[UITextField alloc] init];
    hideRecordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    [hideRecordView setBackgroundColor:[UIColor clearColor]];
    [hideRecordView setUserInteractionEnabled:YES];
    hideRecordTextfield.secureTextEntry = true;
    [hideRecordView addSubview:hideRecordTextfield];
    CALayer *layer = hideRecordTextfield.layer;
    if ([layer.sublayers.firstObject.delegate isKindOfClass:[UIView class]]) {
        hideRecordView = (UIView *)layer.sublayers.firstObject.delegate;
    } else {
        hideRecordView = nil;
    }

    [[UIApplication sharedApplication].keyWindow addSubview:hideRecordView];
    
    if (!_clazy) {
         ImGuiDrawView *vc = [[ImGuiDrawView alloc] init];
         _clazy = vc;
    }
     
    [ImGuiDrawView showChange:false];
    [hideRecordView addSubview:_clazy.view];


    menuTouchView = [[MenuInteraction alloc] initWithFrame:mainView.frame];
    [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:menuTouchView];

    CGFloat size = 50.0;// gif to hoặc nhỏ
    cLazyGIF = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, size, size)];
    cLazyGIF.contentMode = UIViewContentModeScaleAspectFit;
    cLazyGIF.layer.cornerRadius = size / 2;
    cLazyGIF.layer.masksToBounds = YES;
    cLazyGIF.userInteractionEnabled = NO;

    NSString *linktaigif = (NSSENCRYPT("dán domain (link gif) vào đây"));
    NSString *tenfile = [linktaigif lastPathComponent];
    NSString *luudocument = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *timfilereplaceㅤㅤㅤ⁡⁠⁢⁡⁠⁢ = [luudocument stringByAppendingPathComponent:tenfile];

    if ([[NSFileManager defaultManager] fileExistsAtPath:timfilereplace]) {
        NSData *laynoidunggif = [NSData dataWithContentsOfFile:timfilereplace];
        [self hienthigif:cLazyGIF withData:laynoidunggif];
    } else {
        NSURLSessionDataTask *cLazyGifDow = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:linktaigif] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data && !error) {
                [data writeToFile:timfilereplace atomically:YES];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self hienthigif:cLazyGIF withData:data];
                });
            }
        }];
        [cLazyGifDow resume];
    }

    InvisibleMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    InvisibleMenuButton.frame = cLazyGIF.frame;
    InvisibleMenuButton.backgroundColor = [UIColor clearColor];
    [InvisibleMenuButton addTarget:self action:@selector(gifbyclazy) forControlEvents:UIControlEventTouchUpInside];
[InvisibleMenuButton addTarget:self action:@selector(buttonDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
[InvisibleMenuButton addTarget:self action:@selector(gifbyclazy) forControlEvents:UIControlEventTouchUpInside];

    [mainView addSubview:cLazyGIF];
    [mainView addSubview:InvisibleMenuButton];
  [mainView bringSubviewToFront:cLazyGIF];
[mainView bringSubviewToFront:InvisibleMenuButton];
}

- (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:button] anyObject];
    CGPoint previousLocation = [touch previousLocationInView:button.superview];
    CGPoint location = [touch locationInView:button.superview];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;
    
    CGPoint newCenter = CGPointMake(button.center.x + delta_x, button.center.y + delta_y);
    button.center = newCenter;
    cLazyGIF.center = newCenter;
}

- (void)hienthigif:(UIImageView *)imageView withData:(NSData *)data {
    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)data, NULL);
    size_t count = CGImageSourceGetCount(source);
    NSMutableArray *images = [NSMutableArray array];
    for (size_t i = 0; i < count; i++) {
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
        if (image) {
            [images addObject:[UIImage imageWithCGImage:image]];
            CGImageRelease(image);
        }
    }

    imageView.animationImages = images;
    imageView.animationDuration = 5.0;// tốc độ giff
    [imageView startAnimating];
    CFRelease(source);
}

- (void)gifbyclazy {
    static BOOL isMenuVisible = NO;
    isMenuVisible = !isMenuVisible;
    [ImGuiDrawView showChange:isMenuVisible];
}

@end




/*

Share thì kèm cái repo vào nha đừng đớp không như vậy

github: https://github.com/cLazy102

Tele: @lazyvna

group: https://t.me/+1QyIjqDnPW02OGU1

group chat: @clazychat

*/