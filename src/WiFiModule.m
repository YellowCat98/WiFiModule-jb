#import "WiFiModule.h"

typedef struct __WiFiManager *WiFiManagerRef;

extern WiFiManagerRef WiFiManagerClientCreate(CFAllocatorRef allocator, int flags);
extern void WiFiManagerClientSetProperty(WiFiManagerRef manager, CFStringRef property, CFPropertyListRef value);

BOOL wifiEnabled() {
    id manager = [NSClassFromString(@"SBWiFiManager") performSelector:@selector(sharedInstance)];
    return [manager performSelector:@selector(wiFiEnabled)];
}

void setWifiEnabled(BOOL enabled) {
    WiFiManagerRef manager = WiFiManagerClientCreate(kCFAllocatorDefault, 0);

    if (!manager) return;

    WiFiManagerClientSetProperty(manager, CFSTR("AllowEnable"), enabled ? kCFBooleanTrue : kCFBooleanFalse);

    CFRelease(manager);
}

@implementation WiFiModule

- (UIImage *)iconGlyph {
    return [UIImage systemImageNamed:@"wifi"];
}


// Current state of your module
- (BOOL)isSelected {
    return wifiEnabled();
}

- (UIColor*)selectedColor {
    UIColor* color = [UIColor systemBlueColor];

    NSLog(@"Color: %@", color);

    return color;
}

- (void)setSelected:(BOOL)selected {
    setWifiEnabled(selected);
}

@end
