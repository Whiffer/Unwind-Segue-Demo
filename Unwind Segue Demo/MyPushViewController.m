//
//  MyPushViewController.m
//

#import "MyPushViewController.h"

@implementation MyPushViewController
{
    IBOutlet UILabel *label;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    label.text = [NSString stringWithFormat:@"%ld", self.sequencePush];
}

#pragma mark -
#pragma mark Storyboard support

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"In MyPushViewController:prepareForSegue: for %@",[segue identifier]);
    
    if ([[segue identifier] isEqualToString:@"unwindPush"])
    {
        self.sequencePush++;
    }
}

@end
