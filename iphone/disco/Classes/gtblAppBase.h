//
//  gtblAppBase.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gtblStore.h"


@interface gtblAppBase : NSObject

extern gtblAppBase *GetableApp;

@property NSMutableArray *CachedStores;
@property NSString *CurrentApiKey;
@property gtblStore *CurrentStore;

@end
