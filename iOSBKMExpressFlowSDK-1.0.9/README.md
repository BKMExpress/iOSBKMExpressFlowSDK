# BKM EXPRESS FLOW SDK


## NE İŞE YARAR?

> Hizmetinize sunulan BKM Express Flow iOS SDK paketi ile son kullanıcının iOS cihazında BKMExpress uygulaması kurulu olmasa dahi, "Ödeme Yapma" özelliğini, uygulamanızdan çıkış yapma gereksinimi olmadan halletmenize olanak sunar.

## Gereksinimler

- iOS 9.0 ve üzeri
- CocoaPods

## NASIL ÇALIŞIR?

Işyerleri BKM Express entegrasyonlarını tamamlayarak gerekli İşyeri servis uygulamaları ile BKM sunucularında oturum açtıktan sonra, yarattıkları ödeme işlerinden kendilerine iletilen **TICKET_TOKEN** , **TICKET_ID** ve **TICKET_PATH** parametreleri ile çalışmak istedikleri ortamı seçerek BKMExpress Flow SDK akışı başlatabilirler.
BKM sunucularında oturum açma ile detayli bilgiye [buradan](https://test-api.bkmexpress.com.tr/docs) ulaşabilirsiniz.

## CocoaPods Entegrasyonu

```ruby
pod 'BKMExpressFlowSDK', '1.0.8'
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


