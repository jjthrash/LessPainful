#import "PickerPopupViewController.h"
#import "SimpleButtonBehavior.h"

@implementation PickerPopupViewController

@synthesize popup;
@synthesize label;

- (void)viewDidLoad {
    self.behaviors =
        [NSArray arrayWithObject:
            [NSArray arrayWithObject:
                [[[SimpleButtonBehavior buttonBehaviorWithTarget:nil selector:nil]
                    withLabel:@"Text"]
                    withStyle:UITableViewCellStyleValue2]]];

    UIBarButtonItem *cancelButton =
        [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
            target:self
            action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    [cancelButton release];
    UIBarButtonItem *saveButton =
        [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemSave
            target:self
            action:@selector(save)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
}

- (void)refreshData {
    [[[self.behaviors objectAtIndex:0] objectAtIndex:0] setDetailLabel:self.label];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    //place it offscreen
    CGRect bounds = self.navigationController.view.bounds;
    CGRect popupFrame = self.popup.bounds;
    self.popup.frame = CGRectMake(0, bounds.size.height, popupFrame.size.width, popupFrame.size.height);
    [self.navigationController.view addSubview:self.popup];

    [self refreshData];

    [UIView beginAnimations:@"popup" context:NULL];
    [UIView setAnimationDuration:0.25];
    self.popup.transform = CGAffineTransformMakeTranslation(0, -1 * popupFrame.size.height);
    [UIView commitAnimations];
}

- (void)cancel {
    [UIView beginAnimations:@"popup" context:NULL];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(popdownComplete)];

    self.popup.transform = CGAffineTransformIdentity;

    [UIView commitAnimations];

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popdownComplete {
    [self.popup removeFromSuperview];
}

- (void)save {
    //TODO emit
    [self.navigationController popViewControllerAnimated:YES];
}

@end
