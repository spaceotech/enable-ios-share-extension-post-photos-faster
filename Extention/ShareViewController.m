//
//  ShareViewController.m
//  Extention
//
//  Created by Vishal Gandhi on 7/30/16.
//  Copyright © 2016 Vishal Gandhi. All rights reserved.
//

#import "ShareViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
@interface ShareViewController ()

@end

@implementation ShareViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    for (NSExtensionItem *item in self.extensionContext.inputItems) {
        for (NSItemProvider *itemProvider in item.attachments) {
            // Here kUTTypeAppleProtectedMPEG4Video is one kind of video type you can modified base on your requirement.
            if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeAppleProtectedMPEG4Video]) {
                [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeAppleProtectedMPEG4Video options:nil completionHandler:^(NSData *video, NSError *error)
                 {
                 // You will get Video data here that you can submit to server.
                     if(video) {
                     }
                 }];
            }
            // Here kUTTypeImage is one kind of photo type you can modified base on your requirement.
            if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeImage]) {
                [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeImage options:nil completionHandler:^(NSData *image, NSError *error) {
                    // You will get Image data here that you can submit to server.
                    if(image) {
                    }
                }];
            }
        }
    }

}

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

@end
