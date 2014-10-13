//
//  MyImagePickerController.h
//

#import <UIKit/UIKit.h>

@interface MyImagePickerController : UIImagePickerController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong, readonly) UIImage *imagePicked;

@end

