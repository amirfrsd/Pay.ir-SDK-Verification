//
//  PayIRVerification.h
//  SepPay+PayIR
//
//  Created by Amir Hossein on 10/7/17.
//  Copyright © 2017 Emersad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PayIRVerification : NSObject
typedef void (^VerificationBlock)(BOOL success, NSDictionary *response);
@property (nonatomic, retain) NSString *mPin;
@property (nonatomic, retain) NSURL *serverAddress;
- (id)initWithMerchantId:(NSString *)merchantId andMerchantServerAddress:(NSURL *)serverAddress;
- (void)verifyPaymentWithRefNum:(NSString *)refNum andMSISDN:(NSString *)msisdn andBlock:(VerificationBlock)block;
@end
