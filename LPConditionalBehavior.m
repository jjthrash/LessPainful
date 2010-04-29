#import "LPConditionalBehavior.h"

@implementation LPConditionalBehavior

@synthesize behavior;

+ (LPConditionalBehavior*)conditionalBehavior {
    return [[[LPConditionalBehavior alloc] init] autorelease];
}

- (id)withTarget:(id)tar {
    target = tar;
    return self;
}

- (id)withSelector:(SEL)sel {
    conditionSelector = sel;
    return self;
}

- (id)withBehavior:(id<ViewControllerBehavior>)aBehavior {
    behavior = [aBehavior retain];
    return self;
}

- (BOOL)controller:(id)controller tableView:(UITableView*)tableView shouldUseBehaviorAtIndexPath:(NSIndexPath*)indexPath {
    return [[target performSelector:conditionSelector withObject:controller withObject:indexPath] boolValue];
}

- (UITableViewCell*)controller:(id)controller tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    return [behavior controller:controller tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSIndexPath*)controller:(id)controller tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    return [behavior controller:controller tableView:tableView willSelectRowAtIndexPath:indexPath];
}

- (void)controller:(id)controller tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    return [behavior controller:controller tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
