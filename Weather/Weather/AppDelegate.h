//
//  AppDelegate.h
//  Weather
//
//  Created by Admin on 22.04.17.
//  Copyright © 2017 ParnasusIndustries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

