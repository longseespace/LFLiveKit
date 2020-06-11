//
//  LFLiveDebug.m
//  LaiFeng
//
//  Created by LaiFeng on 16/5/20.
//  Copyright © 2016年 LaiFeng All rights reserved.
//

#import "LFLiveDebug.h"

@implementation LFLiveDebug

- (NSString *)description {
	return [NSString stringWithFormat:@"DropFrame:%ld TotalFrames:%ld AudioCount:%d VideoCount:%d UnsendCount:%ld TotalFlow:%0.f",(long)_dropFrame,(long)_totalFrame,_currentCapturedAudioCount,_currentCapturedVideoCount,(long)_unSendCount,_dataFlow];
}


@end
