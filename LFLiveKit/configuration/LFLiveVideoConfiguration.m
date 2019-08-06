//
//  LFLiveVideoConfiguration.m
//  LFLiveKit
//
//  Created by LaiFeng on 16/5/20.
//  Copyright © 2016年 LaiFeng All rights reserved.
//

#import "LFLiveVideoConfiguration.h"
#import <AVFoundation/AVFoundation.h>


@implementation LFLiveVideoConfiguration

#pragma mark -- LifeCycle

+ (instancetype)defaultConfiguration {
    LFLiveVideoConfiguration *configuration = [LFLiveVideoConfiguration defaultConfigurationForQuality:LFLiveVideoQuality_Default];
    return configuration;
}

+ (instancetype)defaultConfigurationForQuality:(LFLiveVideoQuality)videoQuality {
    LFLiveVideoConfiguration *configuration = [LFLiveVideoConfiguration defaultConfigurationForQuality:videoQuality outputImageOrientation:UIInterfaceOrientationPortrait];
    return configuration;
}

+ (instancetype)defaultConfigurationForQuality:(LFLiveVideoQuality)videoQuality outputImageOrientation:(UIInterfaceOrientation)outputImageOrientation {
	LFLiveVideoConfiguration *configuration = [LFLiveVideoConfiguration defaultConfigurationForQuality:videoQuality outputImageOrientation:UIInterfaceOrientationPortrait encode:true];
	return configuration;
}

+ (instancetype)defaultConfigurationForQuality:(LFLiveVideoQuality)videoQuality outputImageOrientation:(UIInterfaceOrientation)outputImageOrientation encode:(BOOL)encode {
    LFLiveVideoConfiguration *configuration = [LFLiveVideoConfiguration new];
	
    switch (videoQuality) {
			case LFLiveVideoQuality_SD_360: {
				configuration.sessionPreset = LFCaptureSessionPreset360x640;
			}
			break;
			
			case LFLiveVideoQuality_SD_480: {
				configuration.sessionPreset = LFCaptureSessionPreset480x854;
			}
			break;
			
			case LFLiveVideoQuality_SD_540: {
				configuration.sessionPreset = LFCaptureSessionPreset540x960;
			}
			break;
			
			case LFLiveVideoQuality_HD_720: {
				configuration.sessionPreset = LFCaptureSessionPreset720x1280;
			}
			break;
			
			case LFLiveVideoQuality_FullHD_1080: {
				configuration.sessionPreset = LFCaptureSessionPreset1920x1080;
			}
			break;
			
			case LFLiveVideoQuality_UltraHD_4K: {
				configuration.sessionPreset = LFCaptureSessionPreset3840x2160;
			}
			break;
    }
	
	configuration.outputImageOrientation = outputImageOrientation;
    configuration.sessionPreset = [configuration supportSessionPreset: configuration.sessionPreset];
	
	if (encode) {
		switch (configuration.sessionPreset) {
				case LFCaptureSessionPreset360x640: {
					configuration.sessionPreset = LFCaptureSessionPreset360x640;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 1000 * 1000;
					configuration.videoMaxBitRate = 1200 * 1000;
					configuration.videoMinBitRate = 800 * 1000;
					configuration.videoSize = CGSizeMake(360, 640);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset480x854: {
					configuration.sessionPreset = LFCaptureSessionPreset480x854;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 2000 * 1000;
					configuration.videoMaxBitRate = 2500 * 1000;
					configuration.videoMinBitRate = 1500 * 1000;
					configuration.videoSize = CGSizeMake(480, 854);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset540x960:{
					configuration.sessionPreset = LFCaptureSessionPreset540x960;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 3000 * 1000;
					configuration.videoMaxBitRate = 3000 * 1000;
					configuration.videoMinBitRate = 2000 * 1000;
					configuration.videoSize = CGSizeMake(480, 854);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset720x1280:{
					configuration.sessionPreset = LFCaptureSessionPreset720x1280;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 3500 * 1000;
					configuration.videoMaxBitRate = 4000 * 1000;
					configuration.videoMinBitRate = 3000 * 1000;
					configuration.videoSize = CGSizeMake(720, 1280);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset1920x1080:{
					configuration.sessionPreset = LFCaptureSessionPreset1920x1080;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 6000 * 1000;
					configuration.videoMaxBitRate = 7000 * 1000;
					configuration.videoMinBitRate = 5000 * 1000;
					configuration.videoSize = CGSizeMake(1080, 1920);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset3840x2160:{
					configuration.sessionPreset = LFCaptureSessionPreset3840x2160;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 18000 * 1000;
					configuration.videoMaxBitRate = 22000 * 1000;
					configuration.videoMinBitRate = 14000 * 1000;
					configuration.videoSize = CGSizeMake(2160, 3840);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
		}
	}
	else {
		switch (configuration.sessionPreset) {
				case LFCaptureSessionPreset360x640: {
					configuration.sessionPreset = LFCaptureSessionPreset360x640;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 600 * 1000;
					configuration.videoMaxBitRate = 1200 * 1000;
					configuration.videoMinBitRate = 400 * 1000;
					configuration.videoSize = CGSizeMake(360, 640);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset480x854: {
					configuration.sessionPreset = LFCaptureSessionPreset480x854;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 1200 * 1000;
					configuration.videoMaxBitRate = 1600 * 1000;
					configuration.videoMinBitRate = 800 * 1000;
					configuration.videoSize = CGSizeMake(480, 854);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset540x960:{
					configuration.sessionPreset = LFCaptureSessionPreset540x960;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 3000 * 1000;
					configuration.videoMaxBitRate = 3000 * 1000;
					configuration.videoMinBitRate = 2000 * 1000;
					configuration.videoSize = CGSizeMake(480, 854);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset720x1280:{
					configuration.sessionPreset = LFCaptureSessionPreset720x1280;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 2000 * 1000;
					configuration.videoMaxBitRate = 2500 * 1000;
					configuration.videoMinBitRate = 1500 * 1000;
					configuration.videoSize = CGSizeMake(720, 1280);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset1920x1080:{
					configuration.sessionPreset = LFCaptureSessionPreset1920x1080;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 5000 * 1000;
					configuration.videoMaxBitRate = 6000 * 1000;
					configuration.videoMinBitRate = 4000 * 1000;
					configuration.videoSize = CGSizeMake(1080, 1920);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
				
				case LFCaptureSessionPreset3840x2160:{
					configuration.sessionPreset = LFCaptureSessionPreset3840x2160;
					configuration.videoFrameRate = 30;
					configuration.videoMaxFrameRate = 30;
					configuration.videoMinFrameRate = 15;
					configuration.videoBitRate = 15000 * 1000;
					configuration.videoMaxBitRate = 20000 * 1000;
					configuration.videoMinBitRate = 10000 * 1000;
					configuration.videoSize = CGSizeMake(2160, 3840);
					configuration.videoMaxKeyframeInterval = 60;
				}
				break;
		}
	}
	
    if (configuration.landscape) {
		CGSize size = configuration.videoSize;
        configuration.videoSize = CGSizeMake(size.height, size.width);
    }
	
    return configuration;
    
}

#pragma mark -- Setter Getter
- (NSString *)avSessionPreset {
	NSString *avSessionPreset = nil;
	switch (self.sessionPreset) {
		case LFCaptureSessionPreset360x640:{
			avSessionPreset = AVCaptureSessionPreset640x480;
		}
			break;
		case LFCaptureSessionPreset540x960:{
			avSessionPreset = AVCaptureSessionPresetiFrame960x540;
		}
			break;
		case LFCaptureSessionPreset720x1280:{
			avSessionPreset = AVCaptureSessionPreset1280x720;
		}
			break;
			
		case LFCaptureSessionPreset1920x1080: {
			avSessionPreset = AVCaptureSessionPreset1920x1080;
		}
			break;
			
		case LFCaptureSessionPreset3840x2160: {
			avSessionPreset = AVCaptureSessionPreset3840x2160;
		}
			break;
			
		default: {
			avSessionPreset = AVCaptureSessionPreset640x480;
		}
			break;
	}
	return avSessionPreset;
}

- (BOOL)landscape{
    return (self.outputImageOrientation == UIInterfaceOrientationLandscapeLeft || self.outputImageOrientation == UIInterfaceOrientationLandscapeRight) ? YES : NO;
}

- (CGSize)videoSize{
    if(_videoSizeRespectingAspectRatio){
        return self.aspectRatioVideoSize;
    }
    return _videoSize;
}

- (void)setVideoMaxBitRate:(NSUInteger)videoMaxBitRate {
    _videoMaxBitRate = MAX(videoMaxBitRate, _videoBitRate);
}

- (void)setVideoMinBitRate:(NSUInteger)videoMinBitRate {
    _videoMinBitRate = MIN(videoMinBitRate, _videoBitRate);
}

- (void)setVideoMaxFrameRate:(NSUInteger)videoMaxFrameRate {
    _videoMaxFrameRate = MAX(videoMaxFrameRate, _videoFrameRate);
}

- (void)setVideoMinFrameRate:(NSUInteger)videoMinFrameRate {
	_videoMinFrameRate = MIN(videoMinFrameRate, _videoFrameRate);
}

- (void)setSessionPreset:(LFLiveVideoSessionPreset)sessionPreset{
    _sessionPreset = sessionPreset;
    _sessionPreset = [self supportSessionPreset:sessionPreset];
}

#pragma mark -- Custom Method
- (LFLiveVideoSessionPreset)supportSessionPreset:(LFLiveVideoSessionPreset)sessionPreset {
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    AVCaptureDevice *inputCamera;
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices){
        if ([device position] == AVCaptureDevicePositionFront){
            inputCamera = device;
        }
    }
    AVCaptureDeviceInput *videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:inputCamera error:nil];
    
    if ([session canAddInput:videoInput]){
        [session addInput:videoInput];
    }
	
	while (![session canSetSessionPreset:self.avSessionPreset] && sessionPreset>=0) {
		sessionPreset -= 1;
	}
	
    return sessionPreset;
}

- (CGSize)captureOutVideoSize{
    CGSize videoSize = CGSizeZero;
    switch (_sessionPreset) {
        case LFCaptureSessionPreset360x640:{
            videoSize = CGSizeMake(360, 640);
        }
            break;
		case LFCaptureSessionPreset480x854:{
			videoSize = CGSizeMake(480, 854);
		}
		break;
			
        case LFCaptureSessionPreset540x960:{
            videoSize = CGSizeMake(540, 960);
        }
            break;
        case LFCaptureSessionPreset720x1280:{
            videoSize = CGSizeMake(720, 1280);
        }
            break;
			
		case LFCaptureSessionPreset1920x1080:{
			videoSize = CGSizeMake(1080, 1920);
		}
			break;
			
		case LFCaptureSessionPreset3840x2160:{
			videoSize = CGSizeMake(2160, 3840);
		}
			break;
    }
    
    if (self.landscape){
        return CGSizeMake(videoSize.height, videoSize.width);
    }
    return videoSize;
}

- (CGSize)aspectRatioVideoSize{
    CGSize size = AVMakeRectWithAspectRatioInsideRect(self.captureOutVideoSize, CGRectMake(0, 0, _videoSize.width, _videoSize.height)).size;
    NSInteger width = ceil(size.width);
    NSInteger height = ceil(size.height);
    if(width %2 != 0) width = width - 1;
    if(height %2 != 0) height = height - 1;
    return CGSizeMake(width, height);
}

#pragma mark -- encoder
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[NSValue valueWithCGSize:self.videoSize] forKey:@"videoSize"];
    [aCoder encodeObject:@(self.videoFrameRate) forKey:@"videoFrameRate"];
    [aCoder encodeObject:@(self.videoMaxFrameRate) forKey:@"videoMaxFrameRate"];
    [aCoder encodeObject:@(self.videoMinFrameRate) forKey:@"videoMinFrameRate"];
    [aCoder encodeObject:@(self.videoMaxKeyframeInterval) forKey:@"videoMaxKeyframeInterval"];
    [aCoder encodeObject:@(self.videoBitRate) forKey:@"videoBitRate"];
    [aCoder encodeObject:@(self.videoMaxBitRate) forKey:@"videoMaxBitRate"];
    [aCoder encodeObject:@(self.videoMinBitRate) forKey:@"videoMinBitRate"];
    [aCoder encodeObject:@(self.sessionPreset) forKey:@"sessionPreset"];
    [aCoder encodeObject:@(self.outputImageOrientation) forKey:@"outputImageOrientation"];
    [aCoder encodeObject:@(self.autorotate) forKey:@"autorotate"];
    [aCoder encodeObject:@(self.videoSizeRespectingAspectRatio) forKey:@"videoSizeRespectingAspectRatio"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    _videoSize = [[aDecoder decodeObjectForKey:@"videoSize"] CGSizeValue];
    _videoFrameRate = [[aDecoder decodeObjectForKey:@"videoFrameRate"] unsignedIntegerValue];
    _videoMaxFrameRate = [[aDecoder decodeObjectForKey:@"videoMaxFrameRate"] unsignedIntegerValue];
    _videoMinFrameRate = [[aDecoder decodeObjectForKey:@"videoMinFrameRate"] unsignedIntegerValue];
    _videoMaxKeyframeInterval = [[aDecoder decodeObjectForKey:@"videoMaxKeyframeInterval"] unsignedIntegerValue];
    _videoBitRate = [[aDecoder decodeObjectForKey:@"videoBitRate"] unsignedIntegerValue];
    _videoMaxBitRate = [[aDecoder decodeObjectForKey:@"videoMaxBitRate"] unsignedIntegerValue];
    _videoMinBitRate = [[aDecoder decodeObjectForKey:@"videoMinBitRate"] unsignedIntegerValue];
    _sessionPreset = [[aDecoder decodeObjectForKey:@"sessionPreset"] unsignedIntegerValue];
    _outputImageOrientation = [[aDecoder decodeObjectForKey:@"outputImageOrientation"] unsignedIntegerValue];
    _autorotate = [[aDecoder decodeObjectForKey:@"autorotate"] boolValue];
    _videoSizeRespectingAspectRatio = [[aDecoder decodeObjectForKey:@"videoSizeRespectingAspectRatio"] unsignedIntegerValue];
    return self;
}

- (NSUInteger)hash {
    NSUInteger hash = 0;
    NSArray *values = @[[NSValue valueWithCGSize:self.videoSize],
                        @(self.videoFrameRate),
                        @(self.videoMaxFrameRate),
                        @(self.videoMinFrameRate),
                        @(self.videoMaxKeyframeInterval),
                        @(self.videoBitRate),
                        @(self.videoMaxBitRate),
                        @(self.videoMinBitRate),
                        self.avSessionPreset,
                        @(self.sessionPreset),
                        @(self.outputImageOrientation),
                        @(self.autorotate),
                        @(self.videoSizeRespectingAspectRatio)];

    for (NSObject *value in values) {
        hash ^= value.hash;
    }
    return hash;
}

- (BOOL)isEqual:(id)other {
    if (other == self) {
        return YES;
    } else if (![super isEqual:other]) {
        return NO;
    } else {
        LFLiveVideoConfiguration *object = other;
        return CGSizeEqualToSize(object.videoSize, self.videoSize) &&
               object.videoFrameRate == self.videoFrameRate &&
               object.videoMaxFrameRate == self.videoMaxFrameRate &&
               object.videoMinFrameRate == self.videoMinFrameRate &&
               object.videoMaxKeyframeInterval == self.videoMaxKeyframeInterval &&
               object.videoBitRate == self.videoBitRate &&
               object.videoMaxBitRate == self.videoMaxBitRate &&
               object.videoMinBitRate == self.videoMinBitRate &&
               [object.avSessionPreset isEqualToString:self.avSessionPreset] &&
               object.sessionPreset == self.sessionPreset &&
               object.outputImageOrientation == self.outputImageOrientation &&
               object.autorotate == self.autorotate &&
               object.videoSizeRespectingAspectRatio == self.videoSizeRespectingAspectRatio;
    }
}

- (id)copyWithZone:(nullable NSZone *)zone {
    LFLiveVideoConfiguration *other = [self.class defaultConfiguration];
    return other;
}

- (NSString *)description {
    NSMutableString *desc = @"".mutableCopy;
    [desc appendFormat:@"<LFLiveVideoConfiguration: %p>", self];
    [desc appendFormat:@" videoSize:%@", NSStringFromCGSize(self.videoSize)];
    [desc appendFormat:@" videoSizeRespectingAspectRatio:%i",self.videoSizeRespectingAspectRatio];
    [desc appendFormat:@" videoFrameRate:%zi", self.videoFrameRate];
    [desc appendFormat:@" videoMaxFrameRate:%zi", self.videoMaxFrameRate];
    [desc appendFormat:@" videoMinFrameRate:%zi", self.videoMinFrameRate];
    [desc appendFormat:@" videoMaxKeyframeInterval:%zi", self.videoMaxKeyframeInterval];
    [desc appendFormat:@" videoBitRate:%zi", self.videoBitRate];
    [desc appendFormat:@" videoMaxBitRate:%zi", self.videoMaxBitRate];
    [desc appendFormat:@" videoMinBitRate:%zi", self.videoMinBitRate];
    [desc appendFormat:@" avSessionPreset:%@", self.avSessionPreset];
    [desc appendFormat:@" sessionPreset:%zi", self.sessionPreset];
    [desc appendFormat:@" outputImageOrientation:%zi", self.outputImageOrientation];
    [desc appendFormat:@" autorotate:%i", self.autorotate];
    return desc;
}

@end
