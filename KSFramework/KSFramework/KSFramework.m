//
//  KSFramework.m
//  KSFramework
//
//  Created by Koson Gou on 12/5/14.
//  Copyright (c) 2014 Kineticspace Limited. All rights reserved.
//

#import "KSFramework.h"

@implementation KSFramework

- (void)sayHello:(NSString *)hello
{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"You say:%@",hello] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}

@end
