# Pay.ir-SDK-Verification
Verify Payments done through Pay.ir iOS SDK

##### You can use this class to send settlement request to Pay.IR server

## How can i use this?
### Objective-C:
Simply Drag Files to your project (PayIRVerification.h,.m) , Then `#import "PayIRVerification.h"`.

Request
```Objective-C
PayIRVerification *verificationObject = [[PayIRVerification alloc] initWithMerchantId:@"MERCHANT_ID" merchantServerAddress:[NSURL URLWithString:@"MERCHANT_VERIFICATION_URL"]];
//you've to call this method after your seppay sdk gives you a success callback
[verificationObject verifyPaymentWithRefNum:@"something" andMSISDN:@"something" andBlock:^(BOOL success, NSDictionary *response) {
    if (success) {
        //successful payment, voila
    } else {
        //smth is fucked up
    }
}];
```

### Swift:
Simply Drag Files to your project (PayIRVerification.h,.m) , Then `#import "PayIRVerification.h"` to your Bridging Header.

Request 
```Swift
let verificationObject = PayIRVerification.init(merchantId:"MERCHANT_ID", merchantServerAddress:URL(string:"MERCHANT_VERIFICATION_URL"))
verificationObject.verifyPayment(withRefNum: "something", andMSISDN: "something", andBlock: {(success,dictionary) in
    if success {
        //successful payment, voila :)
    } else {
        //smth is fucked up         
    }
})
```
