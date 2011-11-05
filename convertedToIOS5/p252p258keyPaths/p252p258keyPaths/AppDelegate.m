
#import "AppDelegate.h"
#import "MyClass.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // (added nicer log messages throughout)
    
    MyClass* myObject = [[MyClass alloc] init];
    // access via key path
    NSLog(@"theData.name:\n%@", [myObject valueForKeyPath:@"theData.name"]);
    // access via facade
    NSLog(@"pepBoys:\n%@", [myObject valueForKey: @"pepBoys"]);
    // access via facade & key path
    NSLog(@"pepBoys.name:\n%@", [myObject valueForKeyPath:@"pepBoys.name"]);
    // mutable access via facade
    NSMutableArray* marr = [myObject mutableArrayValueForKey: @"pepBoys"];
    [marr removeObjectAtIndex:0];
    NSLog(@"fetch mutable array and remove first element:\n%@", marr);
    // proof that we really did mutate
    NSLog(@"pepBoys:\n%@", [myObject valueForKey: @"pepBoys"]);

    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [UIViewController new]; // silence new annoying runtime warning
    [self.window makeKeyAndVisible];
    return YES;
}

@end