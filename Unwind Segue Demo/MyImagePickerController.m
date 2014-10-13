//
//  MyImagePickerController.m
//

#import "MyImagePickerController.h"

@implementation MyImagePickerController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    return [super init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.delegate = self;
    
    _imagePicked = nil;
}

-(void)awakeFromNib
{
    
}

#pragma mark -
#pragma mark ImagePickerController delegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"In MyImagePickerController:imagePickerController:didFinishPickingMediaWithInfo:");
    
    _imagePicked = info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion: ^{
        [self performSegueWithIdentifier:@"unwindPickImage" sender:nil];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"In MyImagePickerController:imagePickerControllerDidCancel:");
    
    _imagePicked = nil;

    [picker dismissViewControllerAnimated:YES completion: ^{
        [self performSegueWithIdentifier:@"unwindPickImage" sender:nil];
    }];
}

#pragma mark -
#pragma mark Storyboard support

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"In MyImagePickerController:prepareForSegue: for %@",[segue identifier]);
    
    if ([[segue identifier] isEqualToString:@"unwindPickImage"])
    {
    }
}

@end
