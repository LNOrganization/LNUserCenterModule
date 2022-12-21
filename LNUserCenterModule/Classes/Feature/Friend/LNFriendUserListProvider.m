//
//  LNFriendUserListProvider.m
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/9.
//

#import "LNFriendUserListProvider.h"
#import "LNUserModel.h"

@implementation LNFriendUserListProvider

- (LNHTTPRequest *)requestWithSuccess:(LNLoadSuccessBlock)success
                              failure:(LNLoadFailureBlock)failure
{
    return [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        request.urlPath = @"";
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            [params setObject:@(self.pageSize) forKey:@"pageSize"];
            [params setObject:@(self.currentPage) forKey:@"pageNum"];
        }];
    } succeed:^(id  _Nonnull data) {
        LN_SAFE_BLOCK_CALL(success, data);
    } failed:^(NSError * _Nonnull error) {
        LN_SAFE_BLOCK_CALL(failure, error);
#if DEBUG
        LN_SAFE_BLOCK_CALL(success, [self localDatas]);
#endif
    }];
}

- (NSDictionary *)localDatas
{
    NSMutableArray *datas = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++) {
        NSMutableDictionary *user = [[NSMutableDictionary alloc] init];
        user[@"name"] = [NSString stringWithFormat:@"我的关注%@", @(index)];
        user[@"iconUrl"] = @"https://t7.baidu.com/it/u=2582370511,530426427&fm=193&f=GIF";
        [datas addObject:[user copy]];
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"code"] = @(200);
    dict[@"message"] = @"请求成功";
    dict[@"data"] = [datas copy];
    return [dict copy];
}

- (Class)modelClass
{
    return [LNUserModel class];
}


@end
