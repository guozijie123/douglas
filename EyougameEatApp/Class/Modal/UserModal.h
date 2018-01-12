//
//  UserModal.h
//  EyougameEatApp
//
//  Created by Douglas on 2017/12/7.
//  Copyright © 2017年 Douglas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModal : NSObject

+ (instancetype) defaultHelper;

@property (nonatomic,copy)NSString * TokeniD;

@property (nonatomic,copy)NSArray<NSDictionary *>* currentList; //当前订单

-(void)createSaveOrder_idPlistFile:(NSDictionary *)dict; //增

-(void)checkTheSaveOrder_idPlistFile:(void(^)(NSMutableDictionary*dict))block;  //查

-(void)removeTheSaveOrder_idPlistFileWith:(NSDictionary *)dic; //删
@end
