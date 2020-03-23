#import "NSString+Transform.h"

@implementation NSString (Transform)


- (NSString *)transform {
    
    NSCharacterSet *setOfAlphabet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    NSCharacterSet *setOfVowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    NSCharacterSet *setOfСonsonants = [NSCharacterSet characterSetWithCharactersInString:@"bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ"];
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray: [self componentsSeparatedByString:@" "]];
    
    [arr removeObject:@""];
    
    if ([[NSCharacterSet characterSetWithCharactersInString:[self lowercaseString]] isSupersetOfSet:setOfAlphabet]) {
        return [self editString:arr setOfSomething:setOfVowels];
    } else {
        return [self editString:arr setOfSomething:setOfСonsonants];
    }
}

- (NSString *) editString:(NSArray *)arr setOfSomething:(NSCharacterSet *)set {
    NSMutableArray *arrRes = [[NSMutableArray alloc] init];
    
    for (NSString *one in arr) {
        NSMutableString *oneReady;
        oneReady = [NSMutableString stringWithString:one];
        long accum = 0;
        for (long i = 0; i < one.length; i++) {
            
            if ([set isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString: [one substringWithRange:NSMakeRange(i, 1)]]]) {
                accum++;
                [oneReady replaceCharactersInRange:NSMakeRange(i, 1) withString:[[one substringWithRange:NSMakeRange(i, 1)] uppercaseString]];
            }
        }
        [oneReady insertString:[NSString stringWithFormat:@"%li", accum] atIndex:0];
        [arrRes addObject:oneReady];
    }
    
    [arrRes sortUsingComparator:^NSComparisonResult(id  _Nonnull first, id  _Nonnull second) {
        return [[(NSString *)first substringWithRange:NSMakeRange(0, 1)] compare:[(NSString *)second substringWithRange:NSMakeRange(0, 1)] options:NSCaseInsensitiveSearch];
    }];
    
    return [arrRes componentsJoinedByString:@" "];
}


@end
