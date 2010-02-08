#import "BehaviorDelegatedTableViewController.h"

@interface SimpleButtonBehavior : NSObject <ViewControllerBehavior> {
    NSString *label;
    NSString *detailLabel;
    id target;
    SEL selector;

    UITableViewCellAccessoryType accessoryType;
    UITableViewCellStyle cellStyle;
}

@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) NSString *detailLabel;
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic, assign) UITableViewCellStyle cellStyle;

+ (SimpleButtonBehavior*)buttonBehaviorWithTarget:(id)tar selector:(SEL)sel;

- (id)initWithTarget:(id)tar selector:(SEL)sel;

- (id)withAccessoryType:(UITableViewCellAccessoryType)type;
- (id)withStyle:(UITableViewCellStyle)style;
- (id)withLabel:(NSString*)label;
- (id)withDetailLabel:(NSString*)detailLabel;

@end

