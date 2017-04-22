//
//  Analyser.m
//  FirstConsoleApp
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 ParnasusIndustries. All rights reserved.
//

#import "Analyser.h"

@implementation Analyser
- (void)foo:(NSString *)bar

{
    NSArray *words = [bar componentsSeparatedByString:@" "];
    NSMutableDictionary *statistics = [[NSMutableDictionary alloc]init];
    for(NSString* word in words)
    {
        NSNumber *repetitions =[statistics valueForKey:word];
        int count = [repetitions intValue];
        if(count==0)
        {
            [statistics setObject:[[NSNumber alloc] initWithLong:(1)] forKey:word];
        }
        else
        {
            [statistics setObject:[[NSNumber alloc] initWithLong:([repetitions integerValue]+1)] forKey: word];

        }
    }
    NSArray *sortedKeys = [statistics keysSortedByValueUsingSelector:@selector(compare:)];
    NSNumber *size = [[NSNumber alloc] initWithLong:([sortedKeys count])];
    long sz = [size longValue];
    for(int i = 0;i<5 && i<sz;i++)
    {
        NSNumber* count = [statistics valueForKey:sortedKeys[sz-1-i]];
        NSLog(@"%@ -- %ld\n",sortedKeys[sz-1-i],[count longValue]);
    }
    NSLog(bar);
    
    
}@end
