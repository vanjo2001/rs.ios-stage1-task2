#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSMutableCharacterSet *setA = [NSMutableCharacterSet characterSetWithCharactersInString: [a lowercaseString]];
    NSMutableCharacterSet *setB = [NSMutableCharacterSet characterSetWithCharactersInString: [b lowercaseString]];
    
    if ([setA isSupersetOfSet:setB]) {
        [setA formIntersectionWithCharacterSet:setB];
        
        long j = 0;
        
        for (long i = 0; i < a.length; i++) {
            
            if ([[[a lowercaseString] substringWithRange:NSMakeRange(i, 1)] isEqualToString:[[b lowercaseString] substringWithRange:NSMakeRange(j, 1)]]) {
                j++;
                if (b.length == j) {
                    return @"YES";
                }
            }
        }
        if (j < b.length) {
            return @"NO";
        }
        
        return @"YES";
    }
    
    
    
    return @"NO";
}
@end
