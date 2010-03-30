#import "BehaviorDelegatedTableViewController.h"
#import "BasicTableCellBehavior.h"

#define DECLARE_BUTTON_BEHAVIOR(name) \
@interface name : SimpleButtonBehavior {} \
@end

@interface SimpleButtonBehavior : BasicTableCellBehavior {
    id target;
    SEL selector;
    BOOL enabled;
}

@property (nonatomic, assign) BOOL enabled;

+ (SimpleButtonBehavior*)buttonBehaviorWithTarget:(id)tar selector:(SEL)sel;

- (id)initWithTarget:(id)tar selector:(SEL)sel;

- (id)withTarget:(id)tar;
- (id)withSelector:(SEL)sel;

@end

