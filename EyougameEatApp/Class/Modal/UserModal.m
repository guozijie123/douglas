//
//  UserModal.m
//  EyougameEatApp
//
//  Created by Douglas on 2017/12/7.
//  Copyright © 2017年 Douglas. All rights reserved.
//

#import "UserModal.h"

@implementation UserModal

+ (instancetype) defaultHelper {
    
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}


-(NSArray<NSDictionary *> *)currentList{
    if (!_currentList) {
        _currentList = [[NSArray alloc]init];
    }
    return _currentList;
}

-(void)createSaveOrder_idPlistFile:(NSDictionary *)dict{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * plistPath = [paths objectAtIndex:0];
    NSString * fileName = [plistPath stringByAppendingPathComponent:@"eatList"];
    NSMutableDictionary * orderData = [NSMutableDictionary dictionaryWithContentsOfFile:fileName];
    if (orderData == nil) {
        orderData = [NSMutableDictionary dictionary];
    }
    [orderData setObject:dict forKey:dict[@"id"]];
    if ([orderData writeToFile:fileName atomically:YES]) {
        NSLog(@"保存本地成功");
    }else
    {
        NSLog(@"保存本地不成功");
    }
}
-(void)checkTheSaveOrder_idPlistFile:(void(^)(NSMutableDictionary*dict))block{
    NSString * filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"eatList"];
    NSMutableDictionary * message = [[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
    if (block) {
        block(message);
    }
}

-(void)removeTheSaveOrder_idPlistFileWith:(NSDictionary *)dic{
    NSString * filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"eatList"];
    __block NSMutableDictionary * message = [[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
    NSString * orderName = dic[@"id"];
    [message removeObjectForKey:orderName];
    [message writeToFile:filePath atomically:YES];
}


@end
