//
//  PayIRVerification.m
//  SepPay+PayIR
//
//  Created by Amir Hossein on 10/7/17.
//  Copyright © 2017 Emersad. All rights reserved.
//

#import "PayIRVerification.h"

@implementation PayIRVerification

@synthesize mPin;

#pragma MARK - Class Constructorss
- (id)initWithMerchantId:(NSString *)merchantId andMerchantServerAddress:(NSURL *)serverAddress {
    if (self = [super init]) {
        [self setMPin:merchantId];
        [self setServerAddress:serverAddress];
    }
    return self;
}
- (id)init {
    return [self initWithMerchantId:nil andMerchantServerAddress:nil];
}

#pragma MARK - Public Methods
- (void)verifyPaymentWithRefNum:(NSString *)refNum andMSISDN:(NSString *)msisdn andBlock:(VerificationBlock)block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.serverAddress];
        request.HTTPMethod = @"POST";
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:@{@"ref_no":refNum, @"m_id":self.mPin, @"mobile_no":msisdn} options:kNilOptions error:NULL];
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error == nil) {
                if (((NSHTTPURLResponse *) response).statusCode == 200) {
                    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                    if ([[json valueForKey:@"ResponseCode"] intValue] == 1) {
                        block(YES, json);
                    } else {
                        block(NO, json);
                    }
                }
            } else {
                block(NO, @{});
            }
        }];
        [task resume];
    });
}

@end
