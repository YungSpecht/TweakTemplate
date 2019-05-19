#import <Cephei/HBPreferences.h>

//Utils
HBPreferences *pfs;

// Settings
BOOL enabled = YES;
BOOL AwesomeFeature = YES;

%group AwesomeTweak

//Here goes your Code that does something awesome!
%hook SpringBoard
- (bool)isAwesomeFeatureEnabled {
	if(AwesomeFeature)
        return YES;
	else
		return %orig;
} 

%end // AwesomeTweak Group

%ctor {
    pfs = [[HBPreferences alloc] initWithIdentifier:@"com.rango.gasolinaprefs"];

    // General
    [pfs registerBool:&enabled default:YES forKey:@"Enabled"];

    // Custom Settings
    [pfs registerBool:&AwesomeFeature default:YES forKey:@"AwesomeFeature"];

    if (!enabled) return;

    %init(Tweak);
	
}