
//
//  ViewController.m
//  BKMExpressFlowSDKSample
//
//  Created by Bankalararası Kart Merkezi on 24/10/2017.
//  Copyright © 2017 Bankalararası Kart Merkezi. All rights reserved.
//

#import "ViewController.h"
#import <BKMExpress/BKMExpress.h>

#define BKM_EXPRESS_SDK_API_KEY @"Given by BKM"
#define PAYMENT_TICKET_ID @"Payment ticket id will be taken from BKM after the merchant integrationn"
#define PAYMENT_TICKET_TOKEN @"Payment ticket token will be taken from BKM after the merchant integration"
#define PAYMENT_TICKET_PATH @"Payment ticket path will be taken from BKM after the merchant integration"

@interface ViewController () <BKMExpressPaymentDelegate>
@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)paymentButtonTapped:(id)sender {
    [self sampleMethod];
}

- (void)sampleMethod{
    // instantiate view controller with custom constructor
    BKMExpressPaymentViewController *expressPaymentViewController= [[BKMExpressPaymentViewController alloc] initWithBexTicketToken:PAYMENT_TICKET_TOKEN bexTicketPath:PAYMENT_TICKET_PATH bexTicketId:PAYMENT_TICKET_ID delegate:self];
    
    // if debug mode is enabled, this sdk connect to preprod otherwise connect to prod.
    [expressPaymentViewController setEnableDebugMode:YES];
    
    // Present view controller
    expressPaymentViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:expressPaymentViewController animated:YES completion:nil];
}

- (void)bkmExpressPaymentDidComplete{
    NSLog(@"Successful payment");
}

- (void)bkmExpressPaymentDidCancel{
    NSLog(@"Payment is canceled by user");
}

- (void)bkmExpressPaymentDidFail:(NSError *)error{
    NSLog(@"An error has occurred on payment = %@", error.localizedDescription);
}

@end
