//
//  ViewController.m
//  SepPay+PayIR
//
//  Created by Amir Hossein on 10/7/17.
//  Copyright © 2017 Emersad. All rights reserved.
//

#import "ViewController.h"
#import "PayIRVerification.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PayIRVerification *verificationObject = [[PayIRVerification alloc] initWithMerchantId:@"MERCHANT_ID" andMerchantServerAddress:[NSURL URLWithString:@"MERCHANT_VERIFICATION_URL"]];
    //you've to call this method after your seppay sdk gives you a success callback
    [verificationObject verifyPaymentWithRefNum:@"something" andMSISDN:@"something" andBlock:^(BOOL success, NSDictionary *response) {
        if (success) {
            //successful payment, voila
        } else {
            //smth is fucked up
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
