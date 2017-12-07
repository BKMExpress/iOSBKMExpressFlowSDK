# BKM EXPRESS FLOW SDK

###Gereksinimler

 - iOS 8.0 ve üzeri
 - CocoaPods

###CocoaPods Entegrasyonu

```ruby
pod 'BKMExpressFlowSDK', '1.0.3'
```

###Örnek Kullanım 

```objc
// instantiate view controller with custom constructor
BKMExpressPaymentViewController *expressPaymentViewController= [[BKMExpressPaymentViewController alloc] initWithBexTicketToken:PAYMENT_TICKET_TOKEN bexTicketPath:PAYMENT_TICKET_PATH bexTicketId:PAYMENT_TICKET_ID delegate:self];

// if debug mode is enabled, this sdk connect to preprod otherwise connect to prod.
[expressPaymentViewController setEnableDebugMode:YES];

// Present view controller
[self presentViewController:expressPaymentViewController animated:YES completion:nil];
}
```
DebugMode enable edilerek test sunucularına, disable edilerek production sunucularına istek gönderilebilir.

###BKMOTPDelegate

```objc
- (void)bkmExpressPaymentDidComplete{
   NSLog(@"Successful payment");
}

- (void)bkmExpressPaymentDidCancel{
   NSLog(@"Payment is canceled by user");
}

- (void)bkmExpressPaymentDidFail:(NSError *)error{
   NSLog(@"An error has occurred on payment = %@", error.localizedDescription);
}
```


