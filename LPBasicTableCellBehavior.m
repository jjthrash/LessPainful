#import "LPBasicTableCellBehavior.h"
#import "UIViewHelpers.h"

@implementation LPBasicTableCellBehavior

@synthesize label;
@synthesize detailLabel;
@synthesize accessoryType;
@synthesize accessoryView;
@synthesize cellStyle;
@synthesize textColor;
@synthesize image;
@synthesize backgroundImage;
@synthesize textLabelFontSize;

+ (id)behavior {
    return [[[self alloc] init] autorelease];
}

- (id)withAccessoryType:(UITableViewCellAccessoryType)type {
    accessoryType = type;
    return self;
}

- (id)withAccessoryView:(UIView*)view {
    self.accessoryView = view;
    return self;
}

- (id)withStyle:(UITableViewCellStyle)style {
    cellStyle = style;
    return self;
}

- (id)withLabel:(NSString*)aLabel {
    self.label = aLabel;
    return self;
}

- (id)withDetailLabel:(NSString*)aDetailLabel {
    self.detailLabel = aDetailLabel;
    return self;
}

- (id)withImage:(UIImage*)i {
    self.image = i;
    return self;
}

- (id)withTextLabelFontSize:(float) size {
    textLabelFontSize = size;
    return self;
}

- (id)withTextColor:(UIColor*)color {
    self.textColor = color;
    return self;
}

- (id)withBackgroundImage:(UIImage*)i {
    self.backgroundImage = i;
    return self;
}

- (id)withClearBackground {
    clearBackground = YES;
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
    cell.textLabel.font = [cell.textLabel.font fontWithSize:textLabelFontSize];
    cell.detailTextLabel.text = detailLabel;
    if (self.accessoryView)
        cell.accessoryView = self.accessoryView;
    else
        cell.accessoryType = accessoryType;
    if (self.textColor)
        cell.textLabel.textColor = self.textColor;
    if (self.image)
        cell.imageView.image = self.image;

    if (clearBackground)
        [cell.contentView makeViewAndSubviewsTransparent];

    if (self.backgroundImage)
        cell.backgroundView = [[[UIImageView alloc] initWithImage:backgroundImage] autorelease];

    return cell;
}

- (NSIndexPath*)controller:(id)controller tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    return indexPath;
}

- (void)controller:(id)controller tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
}

- (void)dealloc {
    [label release];
    [detailLabel release];
    [image release];
    [backgroundImage release];
    [textColor release];
    [accessoryView release];
    [super dealloc];
}

@end

