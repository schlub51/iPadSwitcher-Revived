#include "ipsRootListController.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <rootless.h>
#import "NSTask.h"

@implementation ipsRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)sbreload
{
	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"iPadSwitcher Revived"
							message:@"Settings have been saved\n Respring now?"
							preferredStyle:UIAlertControllerStyleActionSheet];
		UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel
		handler:^(UIAlertAction * action) {}];
		UIAlertAction* yes = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive
		handler:^(UIAlertAction * action) {
			NSTask *t = [[NSTask alloc] init];
			[t setLaunchPath:ROOT_PATH_NS(@"/usr/bin/sbreload")];
			[t launch];
		}];
		[alert addAction:defaultAction];
		[alert addAction:yes];
		[self presentViewController:alert animated:YES completion:nil];

}

@end
