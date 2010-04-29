#import "LPControlBehavior.h"

@implementation LPControlBehavior

- (id)initWithLabel:(NSString*)aLabel control:(UIControl*)aControl {
    if (self = [super init]) {
        label = [aLabel retain];
        control = [aControl retain];
        self.cellStyle = UITableViewCellStyleDefault;
    }

    return self;
}

- (UITableViewCell*)controller:(id)controller tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell *cell = [super controller:controller tableView:tableView cellForRowAtIndexPath:indexPath];

    control.center = CGPointMake(300 - control.frame.size.width / 2 - 10,
                                 cell.contentView.frame.size.height / 2);
    [cell.contentView addSubview:control];

    return cell;
}

- (NSIndexPath*)controller:(id)controller tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    return nil;
}

- (void)dealloc {
    [control release];
    [super dealloc];
}

@end
