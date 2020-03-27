#import "Blocks.h"

@implementation Blocks

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        __block NSObject *res;
        
        self.blockA = [self.blockA copy];
        self.blockB = [self.blockB copy];
        self.blockC = [self.blockC copy];
        
        NSMutableString *resStr = [[NSMutableString alloc] init];
        __block NSNumber *numRes = [[NSNumber alloc] init];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"dd.MM.yyyy";
        
        self.blockA = ^(NSArray *arr) {
            self.arr = arr;
        };
        
        self.blockB = ^(Class class) {
            self.myClass = class;
            
            if (self.myClass == NSString.self) {
                for (NSObject *one in self.arr) {
                    if ([one isKindOfClass:NSString.self]) {
                        [resStr appendString:(NSString *)one];
                    }
                }
                res = (NSObject *)resStr;
                self.blockC(res);
            } else if (self.myClass == NSNumber.self) {
                NSInteger accum = 0;
                for (NSObject *one in self.arr) {
                    if ([one isKindOfClass:NSNumber.self]) {
                        NSNumber *some = (NSNumber *)one;
                        accum += [some integerValue];
                    }
                }
                
                numRes = [NSNumber numberWithInteger:accum];
                self.blockC(numRes);
            } else if (self.myClass == NSDate.self) {
                NSDate *dateMin = [[NSDate alloc] init];
                for (NSObject *one in self.arr) {
                    
                    if ([one isKindOfClass: NSDate.self]) {
                        NSDate *some = (NSDate *)one;
                        
                        if (some.timeIntervalSinceNow > dateMin.timeIntervalSinceNow)
                            dateMin = some;
                    }
                }
                NSString *strDate = [formatter stringFromDate:dateMin];
                self.blockC((NSObject *)strDate);
            }
            
        };
        
    }
    return self;
}

@end

