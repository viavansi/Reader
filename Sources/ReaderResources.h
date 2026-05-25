//
//	ReaderResources.h
//	Reader
//
//	Helper que centraliza la localización del bundle de recursos de la lib.
//	Compatibilidad dual:
//	  • CocoaPods: el podspec mete los PNG sueltos en el main bundle del app
//	    consumidor (`s.resources = 'Graphics/Reader-*.png'`). Fallback a mainBundle.
//	  • SwiftPM: los recursos se empaquetan en un subbundle del módulo
//	    (`Reader_Reader.bundle`) dentro de `[NSBundle bundleForClass:]`.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReaderResources : NSObject

/// Bundle desde el que cargar imágenes y strings localizadas de la lib.
+ (NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
