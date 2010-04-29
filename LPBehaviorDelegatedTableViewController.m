#import "LPBehaviorDelegatedTableViewController.h"

@implementation LPBehaviorDelegatedTableViewController

@synthesize behaviors;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.behaviors = [NSArray array];
}

- (NSArray*)tableView:(UITableView*)tableView usableBehaviorsInSection:(int)section {
    NSArray *rowBehaviors = [behaviors objectAtIndex:section];
    NSUInteger indices[] = {section, 0};
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[[self.behaviors objectAtIndex:section] count]];
    for (int i = 0; i < rowBehaviors.count; i++) {
        id<ViewControllerBehavior> behavior = [rowBehaviors objectAtIndex:i];
        indices[1] = i;
        if ([behavior controller:self tableView:tableView shouldUseBehaviorAtIndexPath:[NSIndexPath indexPathWithIndexes:indices length:2]])
            [result addObject:behavior];
    }

    return result;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return behaviors.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self tableView:tableView usableBehaviorsInSection:section] count];
}

- (id<ViewControllerBehavior>)tableView:(UITableView*)tableView behaviorForContext:(id)ctx andIndexPath:(NSIndexPath*)indexPath {
    return [[self tableView:tableView usableBehaviorsInSection:indexPath.section] objectAtIndex:indexPath.row];
}

- (UITableViewCell*)tableView:(UITableView*)aTableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    id<ViewControllerBehavior> behavior = [self tableView:aTableView behaviorForContext:self andIndexPath:indexPath];
    return [behavior controller:self tableView:aTableView cellForRowAtIndexPath:indexPath];
}

- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id<ViewControllerBehavior> behavior = [self tableView:tableView behaviorForContext:self andIndexPath:indexPath];
    return [behavior controller:self tableView:tableView willSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    id<ViewControllerBehavior> behavior = [self tableView:tableView behaviorForContext:self andIndexPath:indexPath];
    return [behavior controller:self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
