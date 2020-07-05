//
//  GTLocation.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/7/5.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface GTLocation()<CLLocationManagerDelegate>
@property(nonatomic, strong, readwrite) CLLocationManager *manager;
@end

@implementation GTLocation

+ (GTLocation *)locationManager{
    static GTLocation *locationManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationManager = [[GTLocation alloc] init];
    });
    return locationManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

- (void)checkLocationAthorization{
    
    //判断系统是否开启
    if (![CLLocationManager locationServicesEnabled]) {
        //引导弹窗
        //
    }
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        
        [self.manager requestWhenInUseAuthorization];
        
    }
}

#pragma mark - delegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        //
        [self.manager startUpdatingLocation];
    }else if (status == kCLAuthorizationStatusDenied){
        //
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    //地理信息
    CLLocation *location = [locations firstObject];
    
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //地标信息
        NSLog(@"%@", placemarks);
    }];
    
    
    [self.manager stopUpdatingLocation];
    
}

@end
