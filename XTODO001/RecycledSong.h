//
//  RecycledSong.h
//  XTODO001
//
//  Created by Juan Manuel Moreno on 29/07/15.
//  Copyright (c) 2015 Juan Manuel Moreno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecycledSong : NSObject

@property NSString *name;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
