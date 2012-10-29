/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiSocialModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"
#import <Social/Social.h>

@implementation TiSocialModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"3252ec7d-a202-4272-bc75-e709e74834de";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.social";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

#pragma Properties

-(NSNumber *)isFacebookSupported
{
    BOOL available = NO;
    
    if (NSClassFromString(@"SLComposeViewController")) {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            available = YES;
        }
    }
    
    return NUMBOOL(available);
}

-(NSNumber *)isTwitterSupported
{
    BOOL available = NO;
    
    if (NSClassFromString(@"SLComposeViewController")) {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            available = YES;
        }
    }
    
    return NUMBOOL(available);
}

-(NSNumber *)isSinaWeiboSupported
{
    BOOL available = NO;
    
    if (NSClassFromString(@"SLComposeViewController")) {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
            available = YES;
        }
    }
    
    return NUMBOOL(available);
}

#pragma Methods

-(void)createFacebookDialog:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
        ENSURE_UI_THREAD(createFacebookDialog, args);

        NSString *message = [TiUtils stringValue:@"text" properties:args def:nil];
        NSString *url = [TiUtils stringValue:@"url" properties:args def:nil];
        NSString *image = [TiUtils stringValue:@"image" properties:args def:nil];
        BOOL animated = [TiUtils boolValue:@"animated" properties:args def:YES];
        
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        controller.completionHandler = ^(SLComposeViewControllerResult result) {
			if (result == SLComposeViewControllerResultCancelled) {
                NSDictionary *event = @{@"success":NUMBOOL(NO),@"service":@"facebook"};
				[self fireEvent:@"cancelled" withObject:event];
			} else {
                NSDictionary *event = @{@"success":NUMBOOL(YES),@"service":@"facebook"};
				[self fireEvent:@"complete" withObject:event];
			}
			[controller dismissViewControllerAnimated:animated completion:nil];
        };
        
        if (message != nil) {
            [controller setInitialText:message];
        }
        
        if (url != nil) {
            [controller addURL:[NSURL URLWithString:url]];
        }
        
        if (image != nil) {
            [controller addImage:[UIImage imageNamed:image]];
        }
        
        [[TiApp app] showModalController:controller animated:animated];
        
    }
}

-(void)createTwitterDialog:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        ENSURE_UI_THREAD(createTwitterDialog, args);
        
        NSString *message = [TiUtils stringValue:@"text" properties:args def:nil];
        NSString *url = [TiUtils stringValue:@"url" properties:args def:nil];
        NSString *image = [TiUtils stringValue:@"image" properties:args def:nil];
        BOOL animated = [TiUtils boolValue:@"animated" properties:args def:YES];
        
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        controller.completionHandler = ^(SLComposeViewControllerResult result) {
	        if (result == SLComposeViewControllerResultCancelled) {
                NSDictionary *event = @{@"success":NUMBOOL(NO),@"service":@"twitter"};
                [self fireEvent:@"cancelled" withObject:event];
            } else {
                NSDictionary *event = @{@"success":NUMBOOL(YES),@"service":@"twitter"};
                [self fireEvent:@"complete" withObject:event];
            }
            [controller dismissViewControllerAnimated:animated completion:nil];
        };
        

        if (message != nil) {
            [controller setInitialText:message];
        }
        
        if (url != nil) {
            [controller addURL:[NSURL URLWithString:url]];
        }
        
        if (image != nil) {
            [controller addImage:[UIImage imageNamed:image]];
        }
        
        [[TiApp app] showModalController:controller animated:animated];
    }
}

-(void)createSinaWeiboDialog:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        
        ENSURE_UI_THREAD(createSinaWeiboDialog, args);
        
        NSString *message = [TiUtils stringValue:@"text" properties:args def:nil];
        NSString *url = [TiUtils stringValue:@"url" properties:args def:nil];
        NSString *image = [TiUtils stringValue:@"image" properties:args def:nil];
        BOOL animated = [TiUtils boolValue:@"animated" properties:args def:YES];
        
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
        controller.completionHandler = ^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultCancelled) {
                NSDictionary *event = @{@"success":NUMBOOL(NO),@"service":@"sinaweibo"};
				[self fireEvent:@"cancelled" withObject:event];
			} else {
                NSDictionary *event = @{@"success":NUMBOOL(YES),@"service":@"sinaweibo"};
				[self fireEvent:@"complete" withObject:event];
			}
            [controller dismissViewControllerAnimated:animated completion:nil];
        };
        
        if (message != nil) {
            [controller setInitialText:message];
        }
        
        if (url != nil) {
            [controller addURL:[NSURL URLWithString:url]];
        }
        
        if (image != nil) {
            [controller addImage:[UIImage imageNamed:image]];
        }
        
        [[TiApp app] showModalController:controller animated:animated];
        
    }
}



@end
