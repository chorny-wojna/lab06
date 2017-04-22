//
//  main.m
//  FirstConsoleApp
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 ParnasusIndustries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Analyser.h"

int main(int argc, const char * argv[]) {
    Analyser *analyser = [[Analyser alloc]init];
    
    [analyser foo:@"foo bar foo bar lala lala lala lala"];
    return 0;
}
