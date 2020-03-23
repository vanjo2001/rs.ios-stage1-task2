#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    long my_number = [number integerValue];
    NSMutableArray *mutArr = [[NSMutableArray alloc] init];
    
    for (long i = 0, j = 1; true;) {
        long accum = i + j;
        i = j;
        j = accum;
        
        if (i * j == my_number) {
            [mutArr addObjectsFromArray:@[[NSNumber numberWithLong:i], [NSNumber numberWithLong:j], @1]];
            return mutArr;
        } else if (i * j > my_number) {
            [mutArr addObjectsFromArray:@[[NSNumber numberWithLong:i], [NSNumber numberWithLong:j], @0]];
            return mutArr;
        }
    }
}
@end
