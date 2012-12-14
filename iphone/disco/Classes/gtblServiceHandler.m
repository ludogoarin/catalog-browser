//
//  GTBLServiceHandler.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "GTBLServiceHandler.h"
#import "GTBLDataHelpers.h"

#define GTBLQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define GTBLSvcUrl @"https://api.getable.com/widget/"


#define getStoreMethod [NSString URLWithString: @"https://api.getable.com/widget/getProductsByCategoryId?widgetApiKey=7e8bec75-9829-4088-89b2-88d02f7d901c&categoryId=64&pageIndex=0&pageSize=100"]

@implementation GTBLServiceHandler

+(void)getStoreLocation:(NSString*)apiKey callBackDelegate:(id) callBackDelegate callBackSelector:(SEL) callBackSelector
{
    //NSString *apiKey = @"7e8bec75-9829-4088-89b2-88d02f7d901c";
    NSString *svcMethod = [NSString stringWithFormat:@"getBusinessSettings?widgetApiKey=%@", apiKey];
    NSURL *svcCallUrl = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", GTBLSvcUrl, svcMethod]];
    
    dispatch_sync(GTBLQueue, ^{
        
        // get data from API
        NSData *data = [NSData dataWithContentsOfURL:svcCallUrl];
        
        GTBLStore *store = [GTBLDataHelpers parseJsonToStore:data];
               
        [callBackDelegate performSelector:callBackSelector
                            withObject:store];
         
    });
}

+(void)getStoreLocationNSURL:(NSString*)apiKey
{
    NSString *svcMethod = [NSString stringWithFormat:@"getBusinessSettings?widgetApiKey=%@", apiKey];
    NSURL *svcCallUrl = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", GTBLSvcUrl, svcMethod]];
    NSURLRequest *request = [NSURLRequest requestWithURL:svcCallUrl];
    
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:[[NSOperationQueue alloc] init]
     completionHandler:^(NSURLResponse *response,
                         NSData *data,
                         NSError *error)
    {
        NSArray *decodedResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // callback
        NSLog(@"loaded data with NSURL: %@", decodedResponse);
    }];
}

+ (void) getStoreCategoryProducts:(NSString*)apiKey categoryId:(NSNumber*)categoryId callBackDelegate:(id) callBackDelegate callBackSelector:(SEL) callBackSelector
{
    int pageIndex = 0;
    int pageSize = 20;
    NSString *svcMethod = [NSString stringWithFormat:@"getProductsByCategoryId?widgetApiKey=%@&categoryId=%@&pageIndex=%d&pageSize=%d", apiKey, categoryId, pageIndex, pageSize];
    NSURL *svcCallUrl = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", GTBLSvcUrl, svcMethod]];
    
    dispatch_sync(GTBLQueue, ^{
        
        // get data from API
        NSData *data = [NSData dataWithContentsOfURL:svcCallUrl];
        
        NSArray *products = [GTBLDataHelpers parseRawJsonToProducts:data];
        
        [callBackDelegate performSelector:callBackSelector
                               withObject:products];
        
    });

}


@end
