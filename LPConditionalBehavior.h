#import "LPBehaviorDelegatedTableViewController.h"

@interface LPConditionalBehavior : NSObject <ViewControllerBehavior> {
    id  target;
    SEL conditionSelector;
    id<ViewControllerBehavior> behavior;
}

@property (nonatomic, retain) id<ViewControllerBehavior> behavior;

+ (LPConditionalBehavior*)conditionalBehavior;
- (id)withTarget:(id)tar;
- (id)withSelector:(SEL)sel;
- (id)withBehavior:(id<ViewControllerBehavior>)aBehavior;

@end
