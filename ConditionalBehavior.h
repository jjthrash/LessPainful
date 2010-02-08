#import "BehaviorDelegatedTableViewController.h"

@interface ConditionalBehavior : NSObject <ViewControllerBehavior> {
    id  target;
    SEL conditionSelector;
    id<ViewControllerBehavior> behavior;
}

@property (nonatomic, retain) id<ViewControllerBehavior> behavior;

+ (ConditionalBehavior*)conditionalBehavior;
- (id)withTarget:(id)tar;
- (id)withSelector:(SEL)sel;
- (id)withBehavior:(id<ViewControllerBehavior>)aBehavior;

@end
