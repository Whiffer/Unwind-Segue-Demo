//
//  MyModalViewController.m
//

#import "MyModalViewController.h"

@implementation MyModalViewController
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
    
    label.text = [NSString stringWithFormat:@"%ld", self.sequenceModal];
}

#pragma mark -
#pragma mark Storyboard support

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"In MyModalViewController:prepareForSegue: for %@",[segue identifier]);
    
    if ([[segue identifier] isEqualToString:@"unwindModalDone"])
    {
        self.sequenceModal++;
    }
    else if ([[segue identifier] isEqualToString:@"unwindModalCancel"])
    {
    }
}

@end
