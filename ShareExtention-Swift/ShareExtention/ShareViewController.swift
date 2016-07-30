//
//  ShareViewController.swift
//  ShareExtention
//
//  Created by Vishal Gandhi on 7/30/16.
//  Copyright © 2016 Vishal Gandhi. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let content = extensionContext!.inputItems[0] as! NSExtensionItem
        let contentTypeVideo = kUTTypeAppleProtectedMPEG4Video as String
        
        // Here kUTTypeAppleProtectedMPEG4Video is one kind of video type you can modified base on your requirement.

        
        let contentTypeImage = kUTTypeImage as String

        
        for item in extensionContext?.inputItems as! [NSExtensionItem]
        {
            for attachment in content.attachments as! [NSItemProvider] {
                
                if attachment.hasItemConformingToTypeIdentifier(contentTypeVideo)
                {
                    attachment.loadItemForTypeIdentifier(contentTypeVideo, options: nil) { data, error in
                        if error == nil {
                            let url = data as! NSURL
                            
                            // You will get Video data here that you can submit to server.

                            
                            if let videoData = NSData(contentsOfURL: url) {
                                // get Video from data
                            }
                        }
                    }

                }
                
                if attachment.hasItemConformingToTypeIdentifier(contentTypeImage) {
                    
                    attachment.loadItemForTypeIdentifier(contentTypeImage, options: nil) { data, error in
                        if error == nil {
                            let url = data as! NSURL
                            
                            // You will get Image data here that you can submit to server.

                            
                            if let imageData = NSData(contentsOfURL: url) {
                                // get Image from data
                            }
                        }
                    }
                }
            }

        }
    
    }

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
    }

    override func configurationItems() -> [AnyObject]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
