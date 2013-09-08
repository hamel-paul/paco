/* Copyright 2013 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

@protocol PacoLocationDelegate <NSObject>
 @optional
- (void)timerUpdated;
- (void)locationUpdated:(CLLocation *)location;
@end

@interface PacoLocation : NSObject {
}
@property (nonatomic, assign) id <PacoLocationDelegate> delegate;
@property (nonatomic, copy, readonly) CLLocation *location;

- (void)updateLocation;
- (void)enableLocationService;
- (void)disableLocationService;

@end
