#import "NSString+Transform.h"

@implementation NSString (Transform)

- (NSString *)transform {

    NSCharacterSet *setOfAlphabet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    NSCharacterSet *setOfVowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray: [self componentsSeparatedByString:@" "]];
    NSMutableArray *arrRes = [[NSMutableArray alloc] init];
    
    if ([[NSCharacterSet characterSetWithCharactersInString:[self lowercaseString]] isSupersetOfSet:setOfAlphabet]) {
        
        for (NSString *one in arr) {
            NSMutableString *oneReady;
            oneReady = [NSMutableString stringWithString:one];
            long accum = 0;
            for (long i = 0; i < one.length; i++) {
                
                if ([setOfVowels isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString: [one substringWithRange:NSMakeRange(i, 1)]]]) {
                    accum++;
                    [oneReady replaceCharactersInRange:NSMakeRange(i, 1) withString:[[one substringWithRange:NSMakeRange(i, 1)] uppercaseString]];
                    NSLog(@"");
                }
            }
            [oneReady insertString:[NSString stringWithFormat:@"%li",accum] atIndex:0];
            [arrRes addObject:oneReady];
            
            NSLog(@"");
        }
        
        [arrRes sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            
            NSString *first = (NSString *)obj1;
            NSString *second = (NSString *)obj2;
            
            return [[first substringWithRange:NSMakeRange(0, 1)] compare:[second substringWithRange:NSMakeRange(0, 1)] options:NSCaseInsensitiveSearch];
        }];
        return [arrRes componentsJoinedByString:@" "];
        
        NSLog(@"");
        
    } else {
        
    }
    
    return self;
}

@end
