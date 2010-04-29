@interface LPBehaviorDelegatedTableViewController : UITableViewController {
    NSArray *behaviors;
}

@property (nonatomic, retain) NSArray *behaviors;

@end

#define DECLARE_BEHAVIOR(name) \
@interface name : NSObject <ViewControllerBehavior> \
@end

@protocol ViewControllerBehavior <NSObject>
- (BOOL)            controller:(id)controller tableView:(UITableView*)tableView shouldUseBehaviorAtIndexPath:(NSIndexPath*)indexPath;
- (UITableViewCell*)controller:(id)controller tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath;
- (NSIndexPath*)    controller:(id)controller tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath;
- (void)            controller:(id)controller tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath;
@end

