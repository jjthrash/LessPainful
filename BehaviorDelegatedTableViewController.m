#import "BehaviorDelegatedTableViewController.h"

@implementation BehaviorDelegatedTableViewController

@synthesize behaviors;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.behaviors = [NSArray array];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return behaviors.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rowBehaviors = [behaviors objectAtIndex:section];
    NSUInteger indices[] = {section, 0};
    NSInteger countToUse = 0;
    for (int i = 0; i < rowBehaviors.count; i++) {
        id<ViewControllerBehavior> behavior = [rowBehaviors objectAtIndex:i];
        indices[1] = i;
        if ([behavior controller:self tableView:tableView shouldUseBehaviorAtIndexPath:[NSIndexPath indexPathWithIndexes:indices length:2]])
            countToUse++;
    }
    return countToUse;
}

- (id<ViewControllerBehavior>)behaviorForContext:(id)ctx andIndexPath:(NSIndexPath*)indexPath {
    return [[behaviors objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

- (UITableViewCell*)tableView:(UITableView*)aTableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    id<ViewControllerBehavior> behavior = [self behaviorForContext:self andIndexPath:indexPath];
    return [behavior controller:self tableView:aTableView cellForRowAtIndexPath:indexPath];
}

- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id<ViewControllerBehavior> behavior = [self behaviorForContext:self andIndexPath:indexPath];
    return [behavior controller:self tableView:tableView willSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    id<ViewControllerBehavior> behavior = [self behaviorForContext:self andIndexPath:indexPath];
    return [behavior controller:self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
