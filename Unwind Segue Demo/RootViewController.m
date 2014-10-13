//
//  RootViewController.m
//

#import "RootViewController.h"

#import "MyImagePickerController.h"
#import "MyModalViewController.h"
#import "MyPushViewController.h"

@implementation RootViewController
{
    IBOutlet UIImageView *iv;
    IBOutlet UILabel *labelPush;
    IBOutlet UILabel *labelModal;
    
    NSInteger sequencePush;
    NSInteger sequenceModal;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    sequencePush = 0;
    sequenceModal = 0;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    labelPush.text = [NSString stringWithFormat:@"%ld", sequencePush];
    labelModal.text = [NSString stringWithFormat:@"%ld", sequenceModal];
}

#pragma mark -
#pragma mark Storyboard support

- (IBAction)unwindPickImage:(UIStoryboardSegue *)segue
{
    NSLog(@"In RootViewController:unwindPickImage:");
    
    MyImagePickerController *vc = [segue sourceViewController];
    iv.image = vc.imagePicked;
}

- (IBAction)unwindPush:(UIStoryboardSegue *)segue
{
    NSLog(@"In RootViewController:unwindPush:");
    
    MyPushViewController *vc = [segue sourceViewController];
    sequencePush = vc.sequencePush;
}

- (IBAction)unwindModal:(UIStoryboardSegue *)segue
{
    NSLog(@"In RootViewController:unwindModal:");
    
    MyModalViewController *vc = [segue sourceViewController];
    sequenceModal = vc.sequenceModal;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"In RootViewController:prepareForSegue: for %@",[segue identifier]);

    if ([[segue identifier] isEqualToString:@"imagePickerCamera"])
    {
        MyImagePickerController *vc = [segue destinationViewController];
        [vc setSourceType:UIImagePickerControllerSourceTypeCamera];
        [vc setAllowsEditing:NO];
        [vc setShowsCameraControls:YES];
    }
    else if ([[segue identifier] isEqualToString:@"imagePickerAlbum"])
    {
        MyImagePickerController *vc = [segue destinationViewController];
        [vc setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
    else if ([[segue identifier] isEqualToString:@"MyPush"])
    {
        MyPushViewController *vc = [segue destinationViewController];
        [vc setSequencePush:sequencePush];
    }
    else if ([[segue identifier] isEqualToString:@"MyModal"])
    {
        UINavigationController *nc = [segue destinationViewController];
        MyModalViewController *vc = (MyModalViewController *)nc.viewControllers[0];
        [vc setSequenceModal:sequenceModal];
    }
}

@end
