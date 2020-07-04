#import "SfPlugin.h"
#if __has_include(<sf/sf-Swift.h>)
#import <sf/sf-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sf-Swift.h"
#endif

@implementation SfPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSfPlugin registerWithRegistrar:registrar];
}
@end
