//
//  gtblDataHelpers.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "gtblDataHelpers.h"

@implementation gtblDataHelpers

+(gtblStore *) parseJsonToStore:(NSData *)data
{
    gtblStore *store = [[gtblStore alloc] init];
    
    // parse json data    
    NSData *jsonData = [self cleanupJSON:data];
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    NSLog(@"build object -- info");
    
    // business info
    NSDictionary* info = [json objectForKey:@"BusinessInfo"];
    store.LocationName = [info objectForKey:@"LocationName"];
    store.BusinessName = [info objectForKey:@"BusinessName"];
    store.BusinessLocationId = [info objectForKey:@"BusinessLocationId"];
    store.FetchTimeStamp = [NSDate date];
    store.LocationName = [info objectForKey:@"LocationName"];
    store.Longitude = (__bridge NSDecimal *)([info objectForKey:@"Longitude"]);
    store.Latitude = (__bridge NSDecimal *)([info objectForKey:@"Latitude"]);
    store.ParentOrganizationName = [info objectForKey:@"ParentOrganizationName"];
    store.ParentOrganizationId =  [info objectForKey:@"ParentOrganizationId"];
    store.Claimed = [[info objectForKey:@"Claimed"] intValue] == 1;
    store.PhysicalLocation = [[info objectForKey:@"PhysicalLocation"] intValue] == 1;
    store.MailDelivery = [[info objectForKey:@"MailDelivery"] intValue] == 1;
    store.LocalDelivery = [[info objectForKey:@"LocalDelivery"] intValue] == 1;
    store.Description = [info objectForKey:@"Description"];
    store.WebsiteUrl = [info objectForKey:@"WebsiteUrl"];
    store.Phone = [info objectForKey:@"Phone"];
    store.Currency = [info objectForKey:@"Currency"];
    store.TimeZoneId = [info objectForKey:@"TimeZoneId"];
    store.OnlineBookingEnabled = [[info objectForKey:@"OnlineBookingEnabled"] intValue] == 1;
    store.OnlineBookingMethod = [info objectForKey:@"OnlineBookingMethod"];
    store.City = [info objectForKey:@"City"];
    store.State = [info objectForKey:@"State"];
    store.StreetAddress = [info objectForKey:@"StreetAddress"];
    store.StreetAddress2 = [info objectForKey:@"StreetAddress2"];
    store.PostalCode = [info objectForKey:@"PostalCode"];
    store.Country = [info objectForKey:@"Country"];
    store.WidgetAPIKey = [info objectForKey:@"WidgetAPIKey"];
    store.IsPayPalPrimaryGateway = [[info objectForKey:@"IsPayPalPrimaryGateway"] intValue] == 1;
    
    // categories
    NSData *jsCategories = [info objectForKey:@"CategoryList"];
    NSArray *parsedCategories = [self parseJsonToCategories:jsCategories];
    
    NSLog(@"jsCategories: %@", parsedCategories);
    
    return store;
}

+(gtblCategory *) parseJsonToCategory:(NSDictionary *)data
{
    gtblCategory *category = [[gtblCategory alloc] init];
    
    category.FetchTimeStamp = [NSDate date];
    category.Title = [data objectForKey:@"Title"];
    category.CategoryId = [data objectForKey:@"CategoryId"];
    category.ImageUrl = [data objectForKey:@"ImageUrl"];

    return category;
}

+(gtblProduct *) parseJsonToProduct:(NSDictionary *)data
{
    gtblProduct *product = [[gtblProduct alloc] init];
    
    product.FetchTimeStamp = [NSDate date];
    product.Name = [data objectForKey:@"Name"];
    product.Description = [data objectForKey:@"Description"];
    product.ShortDescription = [data objectForKey:@"ShortDescription"];
    product.Picture = [data objectForKey:@"Picture"];
    product.Picture_thumbnail = [data objectForKey:@"Picture_thumbnail"];
    product.SKU = [data objectForKey:@"SKU"];
    product.BusinessProductId = [data objectForKey:@"BusinessProductId"];
    product.MarketplaceProductTypeId = [data objectForKey:@"MarketplaceProductTypeId"];
    product.Rate = [data objectForKey:@"Rate"];
    product.RateUnit = [data objectForKey:@"RateUnit"];
    product.RateUnitDisplayName = [data objectForKey:@"RateUnitDisplayName"];
    product.RateCustomDisplayName = [data objectForKey:@"RateCustomDisplayName"];
    product.RateUnitCount = [data objectForKey:@"RateUnitCount"];
    product.RateUnitMinimumQuantity = [data objectForKey:@"RateUnitMinimumQuantity"];
    product.MarketplaceUrl = [data objectForKey:@"MarketplaceUrl"];
    
    product.IsRetail = [[data objectForKey:@"IsRetail"] intValue] == 1;
    product.IsFavorite = [[data objectForKey:@"IsFavorite"] intValue] == 1;
    
    return product;
}

+(NSMutableArray *) parseJsonToCategories:(NSArray *)jsCategories
{
    NSEnumerator *e = [jsCategories objectEnumerator];

    NSMutableArray *categories = [[NSMutableArray alloc] init];
    id item;
    while (item = [e nextObject]) {
        if (!categories) {
            categories = [[NSMutableArray alloc] init];
        }
        // do something with item
        [categories insertObject:[self parseJsonToCategory:item] atIndex:[categories count]];
    };
    
    return categories;
}

+(NSMutableArray *) parseJsonToProducts:(NSArray *)jsProducts
{
    NSEnumerator *e = [jsProducts objectEnumerator];
    
    NSMutableArray *products = [[NSMutableArray alloc] init];
    id item;
    while (item = [e nextObject]) {
        if (!products) {
            products = [[NSMutableArray alloc] init];
        }
        // do something with item
        [products insertObject:[self parseJsonToProduct:item] atIndex:[products count]];
    };

    return products;
}

+(NSData *)cleanupJSON:(NSData *)data{
    
    // parse json data
    // remove opening and closing parenthesis
    NSString* dataString;
    dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"({"
                                                       withString:@"{"];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"})"
                                                       withString:@"}"];
    
    NSData *jsonData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    return jsonData;
}

-(void)fetchedData:(NSData *)responseData {
    //parse out the json data
    
    // remove opening and closing parenthesis
    NSString* responseString;
    responseString = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"({"
                                                               withString:@"{"];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"})"
                                                               withString:@"}"];
    
    NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    NSArray* products = [json objectForKey:@"Products"]; //2
    
    NSLog(@"Products: %@", products); //3
    
    NSEnumerator *e = [products objectEnumerator];
    id item;
    while (item = [e nextObject]) {
        // do something with item
        //[self insertNewItem:item];
    };
    
}


@end
