#import "LPPickerPopupViewController.h"
#import "LPButtonBehavior.h"

@implementation LPPickerPopupViewController

@synthesize popup;
@synthesize label;
@synthesize delegate;
@synthesize value;

- (void)viewDidLoad {
    self.behaviors =
        [NSArray arrayWithObject:
            [NSArray arrayWithObject:
                [[[LPButtonBehavior buttonBehaviorWithTarget:nil selector:nil]
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
    [self.parentViewController.view addSubview:self.popup];

    [self refreshData];

    [UIView beginAnimations:@"popup" context:NULL];
    [UIView setAnimationDuration:0.25];
    self.popup.transform = CGAffineTransformMakeTranslation(0, -1 * popupFrame.size.height);
    [UIView commitAnimations];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self dismissPopup];
}

- (void)dismissPopup {
    [UIView beginAnimations:@"popup" context:NULL];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(popdownComplete)];

    self.popup.transform = CGAffineTransformIdentity;

    [UIView commitAnimations];
}

- (void)cancel {
    [self dismissPopup];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popdownComplete {
    [self.popup removeFromSuperview];
}

- (void)save {
    [self.delegate pickerPopupDidSave:self];
    [self dismissPopup];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [popup release];
    [label release];
    [value release];

    [super dealloc];
}

@end
