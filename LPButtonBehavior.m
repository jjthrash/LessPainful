#import "LPButtonBehavior.h"
#import "UIViewHelpers.h"

@implementation LPButtonBehavior

@synthesize enabled;

+ (LPButtonBehavior*)buttonBehaviorWithTarget:(id)tar selector:(SEL)sel {
    return [[[LPButtonBehavior alloc] initWithTarget:tar selector:sel] autorelease];
}

- (id)withTarget:(id)tar {
    target = tar;
    return self;
}

- (id)withSelector:(SEL)sel {
    selector = sel;
    return self;
}

- (id)init {
    if (self = [super init]) {
        self.enabled = YES;
    }

    return self;
}

- (id)initWithTarget:(id)tar selector:(SEL)sel {
    if (self = [self init]) {
        target = tar;
        selector = sel;
    }

    return self;
}

- (UITableViewCell*)controller:(id)controller tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell *cell = [super controller:controller tableView:tableView cellForRowAtIndexPath:indexPath];

    cell.textLabel.enabled = self.enabled;
    cell.detailTextLabel.enabled = self.enabled;

    return cell;
}

- (NSIndexPath*)controller:(id)controller tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    if (self.enabled)
        return indexPath;
    else
        return nil;
}

- (void)controller:(id)controller tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [target performSelector:selector withObject:self];
}

@end

