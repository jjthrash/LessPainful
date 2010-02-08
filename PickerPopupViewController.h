#import "BehaviorDelegatedTableViewController.h"

@protocol PickerPopupViewControllerDelegate;

@interface PickerPopupViewController : BehaviorDelegatedTableViewController {
    NSString *label;
    UIView *popup;

    id<PickerPopupViewControllerDelegate> delegate;

    id value;
}

@property (nonatomic, retain) id<PickerPopupViewControllerDelegate> delegate;
@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) UIView *popup;
@property (nonatomic, retain) id value;

- (void)refreshData;

@end

@protocol PickerPopupViewControllerDelegate <NSObject>
- (void)pickerPopupDidSave:(PickerPopupViewController*)pickerPopup;
@end
