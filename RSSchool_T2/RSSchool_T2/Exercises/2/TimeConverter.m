#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    if ([minutes intValue] > 60) {
        return @"";
    }
    
    NSDictionary *arrOfNumber = @{@"1" : @"one", @"2" : @"two", @"3" : @"three",
                                  @"4" : @"four", @"5" : @"five", @"6" : @"six",
                                  @"7" : @"seven", @"8" : @"eight", @"9" : @"nine",
                                  
                                  @"11" : @"eleven", @"12" : @"twelve", @"13" : @"thirteen",
                                  @"14" : @"fourteen", @"15" : @"fiveteen", @"16" : @"sixteen",
                                  @"17" : @"seventeen", @"18" : @"eighteen", @"19" : @"nineteen",
                                  
                                  @"10" : @"ten", @"20" : @"twenty", @"30" : @"thirty",
                                  @"40" : @"fourty", @"50" : @"fivety" };
    
    NSString *half = @"half";
    NSString *past = @"past";
    NSString *quarter = @"quarter";
    NSString *myMinutes = @"minutes";
    NSString *oclock = @"o'clock";
    NSString *to = @"to";
    
    NSString *wordHour = [arrOfNumber objectForKey:hours];
    NSString *increaseHour = [arrOfNumber objectForKey:[NSString stringWithFormat:@"%li", [hours integerValue] + 1]];
    
    if ([[minutes substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"]) {
        minutes = [minutes substringWithRange:NSMakeRange(1, 1)];
    }
    
    NSString *wordMinutes = [arrOfNumber objectForKey:minutes];
    NSString *minMinutes = [arrOfNumber objectForKey:[NSString stringWithFormat:@"%li", 60 - [minutes integerValue]]];
    NSInteger minmin = 60 - [minutes integerValue];
    
    if ([minutes integerValue] == 0) {
        return [NSString stringWithFormat:@"%@ %@", wordHour, oclock];
    } else if ([minutes integerValue] == 15) {
        return [NSString stringWithFormat:@"%@ %@ %@", quarter, past, wordHour];
    } else if ([minutes integerValue] == 45) {
        return [NSString stringWithFormat:@"%@ %@ %@", quarter, to, increaseHour];
    } else if ([minutes integerValue] == 30) {
        return [NSString stringWithFormat:@"%@ %@ %@", half, past, wordHour];
    } else if ([minutes integerValue] > 50) {
        return [NSString stringWithFormat:@"%@ %@ %@ %@", minMinutes, myMinutes, to, increaseHour];
        
    } else if ([minutes integerValue] > 30) {
        
        NSInteger indexDop = minmin % 10;
        NSInteger minutesN = minmin-indexDop;
        
        return [NSString stringWithFormat:@"%@ %@ %@ %@ %@", [arrOfNumber objectForKey:[NSString stringWithFormat:@"%li", minutesN]], [arrOfNumber objectForKey:[NSString stringWithFormat:@"%li", indexDop]], myMinutes, to, increaseHour];
        
    } else {
        return [NSString stringWithFormat:@"%@ %@ %@ %@", wordMinutes, myMinutes, past, wordHour];
    }
    
    return @"";
}
@end

