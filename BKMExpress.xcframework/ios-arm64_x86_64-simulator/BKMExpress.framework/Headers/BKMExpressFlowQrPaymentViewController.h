//
//  BKMExpressFlowQrPaymentViewController.h
//  BKMExpress
//
//  Created by Kadir Guzel on 22.10.2019.
//  Copyright © 2019 Bankalararası Kart Merkezi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BKMExpressFlowQrPaymentViewController : UINavigationController

@property (nonatomic, weak, readonly) id<BKMExpressPaymentDelegate> paymentDelegate;

-(void)setEnableDebugMode:(BOOL)isEnableDebugMode;

- (instancetype)initWithBexTicketToken:(NSString *)ticketToken bexTicketPath:(NSString *)ticketPath loginDictionary:(NSDictionary *)loginDictionary bexTicketId:(NSString *)ticketId delegate:(id<BKMExpressPaymentDelegate>)delegate DEPRECATED_MSG_ATTRIBUTE("Use BKMExpressPaymentViewController.initWithBexTicketToken instead of this method.");

@end
