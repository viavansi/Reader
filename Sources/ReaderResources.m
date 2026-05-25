//
//	ReaderResources.m
//	Reader
//

#import "ReaderResources.h"

@implementation ReaderResources

+ (NSBundle *)bundle {
	static NSBundle *bundle = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSBundle *classBundle = [NSBundle bundleForClass:self];
		// SPM: bundle del módulo "Reader_Reader.bundle" dentro del bundle de la clase.
		NSURL *spmURL = [classBundle URLForResource:@"Reader_Reader" withExtension:@"bundle"];
		if (spmURL) {
			bundle = [NSBundle bundleWithURL:spmURL];
			return;
		}
		// CocoaPods: el podspec inyecta los PNG sueltos en el mainBundle del app
		// consumidor. UIImage imageNamed:inBundle: con mainBundle los encuentra.
		bundle = [NSBundle mainBundle];
	});
	return bundle;
}

@end
