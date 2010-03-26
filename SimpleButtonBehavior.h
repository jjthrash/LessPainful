#import "BehaviorDelegatedTableViewController.h"

#define DECLARE_BUTTON_BEHAVIOR(name) \
@interface name : SimpleButtonBehavior {} \
@end

@interface SimpleButtonBehavior : NSObject <ViewControllerBehavior> {
    NSString *label;
    NSString *detailLabel;
    UIImage  *image;
    id target;
    SEL selector;

    float textLabelFontSize;

    UIColor *textColor;

    BOOL enabled;
    UITableViewCellAccessoryType accessoryType;
    UITableViewCellStyle cellStyle;
}

@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) NSString *detailLabel;
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic, assign) UITableViewCellStyle cellStyle;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, assign) float textLabelFontSize;

+ (SimpleButtonBehavior*)buttonBehaviorWithTarget:(id)tar selector:(SEL)sel;

- (id)initWithTarget:(id)tar selector:(SEL)sel;

- (id)withTarget:(id)tar;
- (id)withSelector:(SEL)sel;
- (id)withAccessoryType:(UITableViewCellAccessoryType)type;
- (id)withStyle:(UITableViewCellStyle)style;
- (id)withLabel:(NSString*)label;
- (id)withDetailLabel:(NSString*)detailLabel;
- (id)withImage:(UIImage*)i;
- (id)withTextLabelFontSize:(float)size;

@end

