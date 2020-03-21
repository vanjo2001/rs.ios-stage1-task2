#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    if ([month integerValue] > 12 || ([month integerValue] == 2 && [day integerValue] > 28)) {
        return @"Такого дня не существует";
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *resultFormatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy-MM-dd";
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    
    resultFormatter.dateFormat = @"d MMMM, EEEE";
    resultFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    
    NSString *myDate = [NSString stringWithFormat:@"%@-%@-%@", year, month, day];
    NSDate *date = [formatter dateFromString: myDate];
    
    NSString *result = [resultFormatter stringFromDate:date];
    
    return result;
}

@end
