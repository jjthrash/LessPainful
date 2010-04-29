#import "LPBehaviorDelegatedTableViewController.h"

@interface LPBasicTableCellBehavior : NSObject <ViewControllerBehavior> {
    NSString *label;
    NSString *detailLabel;
    UIImage  *image;
    UIImage  *backgroundImage;
    BOOL      clearBackground;
    float     textLabelFontSize;
    UIColor  *textColor;
    UIView   *accessoryView;

    UITableViewCellAccessoryType accessoryType;
    UITableViewCellStyle cellStyle;
}

@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) NSString *detailLabel;
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic, retain) UIView   *accessoryView;
@property (nonatomic, assign) UITableViewCellStyle cellStyle;
@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage  *backgroundImage;
@property (nonatomic, assign) float textLabelFontSize;

+ (id)behavior;

- (id)withAccessoryType:(UITableViewCellAccessoryType)type;
- (id)withAccessoryView:(UIView*)view;
- (id)withStyle:(UITableViewCellStyle)style;
- (id)withLabel:(NSString*)label;
- (id)withDetailLabel:(NSString*)detailLabel;
- (id)withImage:(UIImage*)i;
- (id)withTextLabelFontSize:(float)size;
- (id)withTextColor:(UIColor*)color;
- (id)withBackgroundImage:(UIImage*)i;
- (id)withClearBackground;

@end


