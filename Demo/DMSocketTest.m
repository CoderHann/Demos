//
//  DMSocketTest.m
//  Demo
//
//  Created by roki on 2018/5/14.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMSocketTest.h"
//#import <<#header#>>

@interface DMSocketTest()<GCDAsyncSocketDelegate>

// 客户端socket
@property (strong, nonatomic) GCDAsyncSocket *clientSocket;
@end

@implementation DMSocketTest
- (void)test {
    _clientSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    
    NSError *error = nil;
    [self.clientSocket connectToHost:@"120.76.103.100" onPort:28888 viaInterface:nil withTimeout:-1 error:&error];
    
    
    
}

- (void)heart {
    
    NSDictionary *dict = @{@"name":@"chat/heart",@"data":@""};
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSInteger length = jsonData.length;
    
    
//    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    NSLog(@"heartString:%@",jsonString);
//    jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    Byte b1 = length & 0xff;
    Byte b2 = length >> 8 & 0xff;
    Byte b3 = length >> 16 & 0xff;
    Byte b4 = length >> 24 & 0xff;
    
    Byte lengthBytes[] = {b4,b3,b2,b1};
    
    NSData *lengthData = [NSData dataWithBytes:lengthBytes length:sizeof(lengthBytes)];
    NSMutableData *totalData = [NSMutableData dataWithData:lengthData];
    [totalData appendData:jsonData];
    
    [self.clientSocket writeData:totalData withTimeout:10 tag:123];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self heart];
//    });
    NSLog(@"beating...");
    
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"connected!");
    [self heart];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    NSLog(@"disconnected!");
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSLog(@"readed!");
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    NSLog(@"writed!");
}
@end
