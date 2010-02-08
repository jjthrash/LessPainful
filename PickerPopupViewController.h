#import "BehaviorDelegatedTableViewController.h"

@interface PickerPopupViewController : BehaviorDelegatedTableViewController {
    NSString *label;
    UIView *popup;
}

- (void)refreshData;

@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) UIView *popup;

@end
