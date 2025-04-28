# BKM EXPRESS FLOW SDK


## NE İŞE YARAR?

> Hizmetinize sunulan BKM Express Flow iOS SDK paketi ile son kullanıcının iOS cihazında BKMExpress uygulaması kurulu olmasa dahi, "Ödeme Yapma" özelliğini, uygulamanızdan çıkış yapma gereksinimi olmadan halletmenize olanak sunar.

## Gereksinimler

- iOS **11.0** ve üzeri versiyonlarda desteklenmektedir.
    - *Swift Package Manager kullanılması halinde sürüm iOS* **12.0** *üzeri olmalıdır.*
- iPhone cihazlar desteklenmektedir.

## NASIL ÇALIŞIR?

Işyerleri BKM Express entegrasyonlarını tamamlayarak gerekli İşyeri servis uygulamaları ile BKM sunucularında oturum açtıktan sonra, yarattıkları ödeme işlerinden kendilerine iletilen **TICKET_TOKEN** , **TICKET_ID** ve **TICKET_PATH** parametreleri ile çalışmak istedikleri ortamı seçerek BKMExpress Flow SDK akışı başlatabilirler.
BKM sunucularında oturum açma ile detayli bilgiye [buradan](https://test-api.bkmexpress.com.tr/docs) ulaşabilirsiniz.

## ENTEGRASYON

**Cocoapods** kullanarak aşağıdaki komutla:

      pod 'BKMExpressFlowSDK', '1.0.16'

**Swift Package Manager** kullanarak:
  - Projenizin "Package Dependencies" kısmından gerekli sürüm bilgisini girerek 
  
  *veya*
  
  - Başka bir Swift Package içinde kullanılacaksa:
       1. Package.swift dosyanızdaki "dependencies" parametresi içerisine bağımlılığı ekledikten sonra
       
              .package(url: "https://github.com/BKMExpress/iOSBKMExpressFlowSDK.git", exact: "1.0.16")
          
       2. Bağımlılığı kullanmak istediğiniz target'in "dependencies" kısmına SDK'nin product'ını ekleyerek
      
              .product(name: "BKMExpress", package: "iOSBKMExpressFlowSDK")
              
SDK'yi kullanabilirsiniz.

## Örnek Kullanım 

```objc
// instantiate view controller with custom constructor
BKMExpressPaymentViewController *expressPaymsentViewController= [[BKMExpressPaymentViewController alloc] initWithBexTicketToken:PAYMENT_TICKET_TOKEN bexTicketPath:PAYMENT_TICKET_PATH bexTicketId:PAYMENT_TICKET_ID delegate:self];

// if debug mode is enabled, this sdk connect to preprod otherwise connect to prod.
[expressPaymentViewController setEnableDebugMode:YES];

// Present view controller
expressPaymentViewController.modalPresentationStyle = UIModalPresentationFullScreen;
[self presentViewController:expressPaymentViewController animated:YES completion:nil];
}
```
DebugMode enable edilerek test sunucularına, disable edilerek production sunucularına istek gönderilebilir.

## BKMOTPDelegate

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
