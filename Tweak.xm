#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Security/Security.h>
#include <dlfcn.h>
#include <UIKit/UIKit.h>



@interface AppleKeychain : NSObject
- (NSString *)getSecureValueForKey:(NSString *)key service:(NSString *)service;
- (bool)storeSecureValue:(NSString *)value forKey:(NSString *)key service:(NSString *)service;
@end


@implementation AppleKeychain

- (NSString *)getSecureValueForKey:(NSString *)key service:(NSString *)service
{

    NSData *result;
    NSArray *keys = [[NSArray alloc] initWithObjects: (NSString *) kSecClass, kSecAttrService, kSecAttrAccount, kSecReturnData, nil];
    NSArray *objects = [[NSArray alloc] initWithObjects: (NSString *) kSecClassGenericPassword, service, key, kCFBooleanTrue, nil];
    NSDictionary *query = [[NSDictionary alloc] initWithObjects: objects forKeys: keys];

    SecItemCopyMatching((CFDictionaryRef) query, (CFTypeRef *)(void *) &result);
    SecItemDelete((CFDictionaryRef) query);
    NSString *uuid = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    return uuid;
}


- (bool)storeSecureValue:(NSString *)value forKey:(NSString *)key service:(NSString *)service {
    NSArray *keys = [[NSArray alloc] initWithObjects: (NSString *) kSecClass, kSecAttrService, kSecAttrAccount, kSecValueData, nil];
    NSArray *objects = [[NSArray alloc] initWithObjects: (NSString *) kSecClassGenericPassword, service, key, [value dataUsingEncoding: NSUTF8StringEncoding], nil];
    NSDictionary *query = [[NSDictionary alloc] initWithObjects: objects forKeys: keys];
    SecItemAdd((CFDictionaryRef) query, NULL);
    return YES;
}

@end

%hook NSURLSession

- (id)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(id)completionHandler{
    AppleKeychain *keychain = [[AppleKeychain alloc] init];
    [keychain getSecureValueForKey:@"eu.ctwoon.kinohome" service:@"KinoHome"];
    [keychain storeSecureValue:@"BE3170B3-9806-4D03-9CAA-85CFB5B5648F" forKey:@"eu.ctwoon.kinohome" service:@"KinoHome"];
    return %orig;
}
%end

