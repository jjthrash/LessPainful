#import "SimpleButtonBehavior.h"

@implementation SimpleButtonBehavior

@synthesize label;
@synthesize detailLabel;
@synthesize accessoryType;
@synthesize cellStyle;

+ (SimpleButtonBehavior*)buttonBehaviorWithTarget:(id)tar selector:(SEL)sel {
    return [[[SimpleButtonBehavior alloc] initWithTarget:tar selector:sel] autorelease];
}

- (id)withAccessoryType:(UITableViewCellAccessoryType)type {
    accessoryType = type;
    return self;
}

- (id)withStyle:(UITableViewCellStyle)style {
    cellStyle = style;
    return self;
}

- (id)withLabel:(NSString*)aLabel {
    label = [aLabel retain];
    return self;
}

- (id)withDetailLabel:(NSString*)aDetailLabel {
    detailLabel = [aDetailLabel retain];
    return self;
}

- (id)initWithTarget:(id)tar selector:(SEL)sel {
    if (self = [super init]) {
        target = [tar retain];
        selector = sel;
    }

    return self;
}

- (BOOL)controller:(id)controller tableView:(UITableView*)tableView shouldUseBehaviorAtIndexPath:(NSIndexPath*)indexPath {
    return YES;
}

- (UITableViewCell*)controller:(id)controller tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    NSString *reuseID = [NSString stringWithFormat:@"%@Cell", label];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:cellStyle reuseIdentifier:reuseID] autorelease];
    }

    cell.textLabel.text = label;
    cell.detailTextLabel.text = detailLabel;
    cell.accessoryType = accessoryType;

    return cell;
}

- (NSIndexPath*)controller:(id)controller tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    return indexPath;
}

- (void)controller:(id)controller tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [target performSelector:selector];
}

@end

