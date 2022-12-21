//
//  LNUserInfoProvider.m
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/11.
//

#import "LNUserInfoProvider.h"

@implementation LNUserInfoProvider

- (LNHTTPRequest *)requestWithSuccess:(LNLoadSuccessBlock)success
                              failure:(LNLoadFailureBlock)failure
{
    return [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        request.urlPath = @"userCenter/getUserInfo";
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            if(self.userId){
                [params setObject:self.userId forKey:@"userId"];
            }else{
                [params setObject:@"longinUserId" forKey:@"userId"];
            }
        }];
    } succeed:^(id  _Nonnull data) {
        LN_SAFE_BLOCK_CALL(success, data);
    } failed:^(NSError * _Nonnull error) {
        LN_SAFE_BLOCK_CALL(failure, error);
    }];
}

@end
