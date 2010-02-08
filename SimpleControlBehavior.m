#import "SimpleControlBehavior.h"

@implementation SimpleControlBehavior

- (id)initWithLabel:(NSString*)aLabel control:(UIControl*)aControl {
    if (self = [super init]) {
        label = aLabel;
        control = aControl;
    }

    return self;
}

- (BOOL)controller:(id)controller tableView:(UITableView*)tableView shouldUseBehaviorAtIndexPath:(NSIndexPath*)indexPath {
    return YES;
}

- (UITableViewCell*)controller:(id)controller tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    NSString *reuseID = [NSString stringWithFormat:@"%@ControlCell", label];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID] autorelease];
        cell.textLabel.text = label;

        control.center = CGPointMake(300 - control.frame.size.width / 2 - 10,
                                     cell.contentView.frame.size.height / 2);
        [cell.contentView addSubview:control];
    }

    return cell;
}

- (NSIndexPath*)controller:(id)controller tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    return nil;
}

- (void)controller:(id)controller tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
}

@end
