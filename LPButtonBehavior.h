#import "LPBehaviorDelegatedTableViewController.h"
#import "LPBasicTableCellBehavior.h"

#define DECLARE_BUTTON_BEHAVIOR(name) \
@interface name : LPButtonBehavior {} \
@end

@interface LPButtonBehavior : LPBasicTableCellBehavior {
    id target;
    SEL selector;
    BOOL enabled;
}

@property (nonatomic, assign) BOOL enabled;

+ (LPButtonBehavior*)buttonBehaviorWithTarget:(id)tar selector:(SEL)sel;

- (id)initWithTarget:(id)tar selector:(SEL)sel;

- (id)withTarget:(id)tar;
- (id)withSelector:(SEL)sel;

@end

