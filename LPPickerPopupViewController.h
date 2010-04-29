#import "LPBehaviorDelegatedTableViewController.h"

@protocol PickerPopupViewControllerDelegate;

@interface LPPickerPopupViewController : LPBehaviorDelegatedTableViewController {
    NSString *label;
    UIView *popup;

    id<PickerPopupViewControllerDelegate> delegate;

    id value;
}

@property (nonatomic, assign) id<PickerPopupViewControllerDelegate> delegate;
@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) UIView *popup;
@property (nonatomic, retain) id value;

- (void)refreshData;

@end

@protocol PickerPopupViewControllerDelegate <NSObject>
- (void)pickerPopupDidSave:(LPPickerPopupViewController*)pickerPopup;
@end
