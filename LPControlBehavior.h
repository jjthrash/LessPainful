#import "LPBehaviorDelegatedTableViewController.h"
#import "LPBasicTableCellBehavior.h"

@interface LPControlBehavior : LPBasicTableCellBehavior {
    UIControl *control;
}

- (id)initWithLabel:(NSString*)aLabel control:(UIControl*)aControl;

@end
