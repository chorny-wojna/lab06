//
//  ViewController.m
//  Weather
//
//  Created by Admin on 22.04.17.
//  Copyright © 2017 ParnasusIndustries. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UITextField *City;
@end

@implementation ViewController
-(NSArray*)colorWeather: (double) _temperature{
    if(_temperature <= -30.0)
        return [NSArray arrayWithObjects: @"114", @"18", @"158", nil];
    if(_temperature < -20.0 && _temperature > -30)
        return [NSArray arrayWithObjects: @"18", @"29", @"100", nil];
    if(_temperature < -10.0 && _temperature >= -20)
        return [NSArray arrayWithObjects: @"31", @"165", @"183", nil];
    if(_temperature < 0.0 && _temperature >= -10)
        return [NSArray arrayWithObjects: @"160", @"243", @"255", nil];
    if(_temperature >= 0.0 && _temperature < 10)
        return [NSArray arrayWithObjects: @"103", @"247", @"118", nil];
    if(_temperature >= 10 && _temperature < 20)
        return [NSArray arrayWithObjects: @"253", @"247", @"118", nil];
    if(_temperature >= 20 && _temperature < 30)
        return [NSArray arrayWithObjects: @"247", @"158", @"49", nil];
    return [NSArray arrayWithObjects: @"255", @"87", @"40", nil];    }

- (IBAction)refresh:(id)sender {
    [[self labelText] setText:@"0 C"];
    
    
    NSURL *url = [[NSURL alloc]
                  initWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&APPID=3ef5dcaa905ffe8dcb4d910a412453e3", self.City.text]];
    
    NSData * contents = [[NSData alloc] initWithContentsOfURL:url];
    
    
    
    if (contents)
    {
        NSDictionary *forcasting = [NSJSONSerialization JSONObjectWithData:contents options:NSJSONReadingMutableContainers error:nil];
    
        NSDictionary* main = [[NSDictionary alloc] initWithDictionary:[forcasting valueForKey:@"main"]];
    
        NSNumber *temp = [main valueForKey:@"temp"];
        double tem = [temp doubleValue] - 273.15;
        NSArray *rgb = [self colorWeather: tem];
        
        _labelText.textColor = [UIColor
                                   colorWithRed: ([rgb[0] doubleValue]/255.f)
                                   green: ([rgb[1] doubleValue]/255.f)
                                   blue: ([rgb[2] doubleValue]/255.f)
                                   alpha: 1.0];
        [[self labelText] setText:[NSString stringWithFormat:@"%.1f C", tem]];
    }
    else
    {
        [[self labelText] setText:@"No data"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
