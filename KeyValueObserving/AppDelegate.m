//
//  AppDelegate.m
//  KeyValueObserving
//
//  Created by Tobias Preuss on 30.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"


NSString* const kTextChangedNotification = @"TextChanged";


@implementation AppDelegate

@synthesize window = _window;
@synthesize text = m_text;
@synthesize button = m_button;

- (void)setText:(NSString*)text {
	m_text = text;
	
	// Sending the notification.
	NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter postNotificationName:kTextChangedNotification object:self];
}

- (void)dealloc {
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification*)notification {
	self.text = @"Notifications";
}

- (void)awakeFromNib {
	
	assert(m_button);
	
	// Register for notfications.
	NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter addObserver:self selector:@selector(textChanged:) name:kTextChangedNotification object:self];
}

- (void)textChanged:(NSNotification*)notification {
	self.button.title = self.text;
}


@end
