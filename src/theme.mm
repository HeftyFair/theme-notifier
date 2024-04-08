
#import <Cocoa/Cocoa.h>
#include <cstdio>

#import "AppDelegate.h"

@implementation AppDelegate


    
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Subscribe to the Dark Mode change notification
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(interfaceThemeChanged:)
                                                 name:@"AppleInterfaceThemeChangedNotification"
                                               object:nil];

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Remove the observer when the application is about to terminate
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





- (void)interfaceThemeChanged:(NSNotification *)notification {
    // Determine the current interface style
    NSString *theme = [[NSUserDefaults standardUserDefaults] stringForKey:@"AppleInterfaceStyle"];
    
    if ([theme isEqualToString:@"Dark"]) {
        @autoreleasepool {
            NSTask *task = [[NSTask alloc] init];
            [task setLaunchPath:@"/opt/homebrew/bin/kitty"];
            NSArray *arguments = [NSArray arrayWithObjects:@"+kitten", @"themes",
                                  @"--reload-in=all", @"--config-file-name",
                                  @"Catppuccin-Mocha.conf", @"Catppuccin-Mocha" , nil];
            [task setArguments:arguments];
            [task launch];
        }
        NSLog(@"The system has switched to Dark Mode.");
    } else {
        @autoreleasepool {
            NSTask *task = [[NSTask alloc] init];
            [task setLaunchPath:@"/opt/homebrew/bin/kitty"];
            
            NSArray *arguments = [NSArray arrayWithObjects:@"+kitten", @"themes",
                                  @"--reload-in=all", @"--config-file-name", @"Ayu Light.conf", @"Ayu Light" , nil];

            
            [task setArguments:arguments];
            [task launch];
        }
        NSLog(@"The system has switched to Light Mode.");
    }
}

@end



int main(int argc, char *argv[])
{
    
  @autoreleasepool {
        // Create an application instance
        NSApplication *application = [NSApplication sharedApplication];
        
        // Create an instance of your AppDelegate
        AppDelegate *appDelegate = [[AppDelegate alloc] init];
        
        // Set the application's delegate
        application.delegate = appDelegate;
        
        // Start the application
        [application run];
        
        // Optionally, directly call a method on appDelegate here
        // [appDelegate yourMethodHere];
  }
}

