//
//  AppDelegate.m
//  KeyValueObserving
//
//  Created by Tobias Preuss on 30.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize text = m_text;
@synthesize button = m_button;

- (void)dealloc {
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification*)notification {
	self.text = @"KeyValueObserving";
}

- (void)awakeFromNib {
	assert(m_button);
	
	[self addObserver:self 
		   forKeyPath:@"text" 
			  options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial 
			  context:nil];
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context {
	self.button.title = self.text;
}



@end
