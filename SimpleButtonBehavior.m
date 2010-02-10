#import "SimpleButtonBehavior.h"

@implementation SimpleButtonBehavior

@synthesize label;
@synthesize detailLabel;
@synthesize accessoryType;
@synthesize cellStyle;
@synthesize enabled;
@synthesize textColor;

+ (SimpleButtonBehavior*)buttonBehaviorWithTarget:(id)tar selector:(SEL)sel {
    return [[[SimpleButtonBehavior alloc] initWithTarget:tar selector:sel] autorelease];
}

- (id)withTarget:(id)tar {
    target = tar;
    return self;
}

- (id)withSelector:(SEL)sel {
    selector = sel;
    return self;
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

- (id)init {
    if (self = [super init]) {
        self.enabled = YES;
    }

    return self;
}

- (id)initWithTarget:(id)tar selector:(SEL)sel {
    if (self = [self init]) {
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

    cell.textLabel.enabled = self.enabled;
    cell.textLabel.text = label;
    cell.detailTextLabel.text = detailLabel;
    cell.detailTextLabel.enabled = self.enabled;
    cell.accessoryType = accessoryType;
    if (self.textColor)
        cell.textLabel.textColor = self.textColor;

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

