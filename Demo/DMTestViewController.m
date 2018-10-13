//
//  DMTestViewController.m
//  Demo
//
//  Created by roki on 2018/4/26.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMTestViewController.h"
#import <CocoaAsyncSocket/GCDAsyncSocket.h>
#import "DMSocketTest.h"
#import <AVFoundation/AVFoundation.h>
#import "NCSoundHintManager.h"
#import "DMBSView.h"
#import "DMGradientTextView.h"
#import "DMTableViewCell.h"
#import "DMDetailViewController.h"

#define kNumberAudioQueueBuffers 3  //定义了三个缓冲区
#define kDefaultBufferDurationSeconds 0.1279   //调整这个值使得录音的缓冲区大小为2048bytes
#define kDefaultSampleRate 8000   //定义采样率为8000

@interface DMTestViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong, nonatomic)DMSocketTest *test;
@property(strong, nonatomic)AVAudioSession *session;
@property(strong, nonatomic)AVAudioRecorder *recorder;
@property(weak,nonatomic)UIView *redView;
@property(strong, nonatomic)NSMutableArray *images;
@property(strong, nonatomic)NSMutableArray *imageDataArray;
@property(strong, nonatomic)NSMutableArray *TESTImageDataArray;


@property(strong, nonatomic)NSMutableArray *dataSource;
@property(weak,nonatomic)UITableView *tableView;
@end

@implementation DMTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIView *redView = [[UIView alloc] init];
//    redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:redView];
//    redView.frame = CGRectMake(100, 100, 200, 200);
//    _redView = redView;
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
//    [redView addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
    
//    _test = [[DMSocketTest alloc] init];
//    [_test test];
    
//    DMBSView *bs = [[DMBSView alloc] init];
//    [self.view addSubview:bs];
//
//    bs.frame = CGRectMake(0, 0, 375, 300);
    
//    DMGradientTextView *gradientText = [[DMGradientTextView alloc] init];
//    gradientText.textLabel.text = @"我是DEMO~~";
//    gradientText.textLabel.font = [UIFont systemFontOfSize:20];
//    [self.view addSubview:gradientText];
////    gradientText.frame = CGRectMake(100, 100, 100, 20);
//    [gradientText mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//    }];
    
    _dataSource = [NSMutableArray array];
    NSString *a = @"就是两个就是两个静安寺多路公交上路公交上打了个撒感觉爱上";
    NSString *b = @"法拉数据法拉盛就搞定了时间哥斯达黎加孤陋寡闻论文就浪费时间的垃圾数量估计是垃圾爱上邓丽君发送的垃圾管理局";
    NSString *c = @"放暑假了感觉上当了";
    NSString *d = @"归结为了解了解阿斯古丽撒娇歌垃圾啊工具按揭房老师的价格为IE我就放了大数据分类是关键是垃圾分类的说法见识到了噶是哪里撒多路公交爱上两个家里感觉是个我文件是个垃圾管理局sad论坛积分拉数据分类 ";
    [_dataSource addObject:a];
    [_dataSource addObject:a];
    [_dataSource addObject:b];
    [_dataSource addObject:d];
//    [_dataSource addObject:a];
//    [_dataSource addObject:c];
//    [_dataSource addObject:a];
//    [_dataSource addObject:d];
//    [_dataSource addObject:d];
//    [_dataSource addObject:b];
//    [_dataSource addObject:b];
//    [_dataSource addObject:a];
//    [_dataSource addObject:c];
//    [_dataSource addObject:b];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 100;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
    
    [self reloadView];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"");
    CGFloat maxY = _tableView.contentSize.height;
    CGFloat gapY = maxY - self.view.frame.size.height;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.tableView.contentOffset = CGPointMake(0, gapY);
    });
}

- (void)reloadView {

    [_dataSource addObject:@"放暑假了感觉上当了"];
    
    [_tableView reloadData];
    
    NSLog(@"hahha");
}


#pragma mark -<UITableViewDataSource,UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DMTableViewCell *cell = [DMTableViewCell tableViewCellWithTableView:tableView];
    
    cell.title = _dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self reloadView];
    
    DMDetailViewController *vc = [[DMDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)tapHandle:(UITapGestureRecognizer *)tap {
//    _redView.layer.transform = CATransform3DScale(_redView.layer.transform, 0.9, 0.9, 1);
    
    [self testsound];
}

- (void)testsound {
//    SystemSoundID soundID = 1007;
////    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    AudioServicesPlayAlertSound(soundID);
    
    [NCSoundHintManager playSystemSoundForNewMessage];
}


- (void)testImage {
    
    
    _images = [NSMutableArray array];
    
    
    for (NSInteger index = 1; index <= 8; index++) {
        UIImage *tempImage = [UIImage imageNamed:[NSString stringWithFormat:@"IMG_%zd.JPG",index]];
        [_images addObject:tempImage];
        
    }
    
    NSLog(@"");
    
    _imageDataArray = [NSMutableArray array];
    for (UIImage *tempImage in _images) {
        NSData *tempData = UIImageJPEGRepresentation(tempImage, 0.9);
        
        [_imageDataArray addObject:tempData];
    }
    
    _TESTImageDataArray = [NSMutableArray arrayWithArray:_imageDataArray];
    
    NSLog(@"xxx");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self startRecord];
//    NSMutableArray *messNumbers = [NSMutableArray arrayWithArray:@[@19, @27, @3, @4, @9, @23, @7, @5, @92, @375, @92, @327, @92, @3, @75, @9, @52, @39, @57, @1, @0, @5, @74, @95]];
////    NSMutableArray *messNumbers = [NSMutableArray arrayWithArray:@[@4, @7, @3, @11, @2, @8]];
//    [self quickSort:messNumbers leftIndex:0 rightIndex:messNumbers.count - 1];
//    NSLog(@"");
    
    
}

- (void)quickSort:(NSMutableArray *)array leftIndex:(NSInteger)left rightIndex:(NSInteger)right {
    
    if (left >= right) {
        // 该回合结束
        return;
    }
    
    NSInteger i = left;
    NSInteger j = right;
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {//一个轮回
        
        while (i < j && [array[j] integerValue] >= key) {
            j--;
        }
        array[i] = array[j];
        
        while (i < j && [array[i] integerValue] <= key) {
            i++;
        }
        array[j] = array[i];
        
    }
    array[i] = @(key);
    [self quickSort:array leftIndex:left rightIndex:i - 1];
    [self quickSort:array leftIndex:i + 1 rightIndex:right];
    
    
}

- (void)bulbleSort {
    NSMutableArray *messNumbers = [NSMutableArray arrayWithArray:@[@19, @27, @3, @4, @9, @23, @7, @5, @92, @375, @92, @327, @92, @3, @75, @9, @52, @39, @57, @1, @0, @5, @74, @95]];
    
    NSInteger runTime = 0;
    for (NSInteger i = 0; i < messNumbers.count; i++) {
        
        for (NSInteger j = i+1; j < messNumbers.count; j++) {
            if ([messNumbers[j] integerValue] < [messNumbers[i] integerValue]) {
                NSNumber *tempNumber = messNumbers[i];
                messNumbers[i] = messNumbers[j];
                messNumbers[j] = tempNumber;
            }
            runTime++;
        }
    }
    
    NSLog(@"%@",messNumbers);
}

- (void)voiceTest {
    
//    [self setupAudioFormat:kAudioFormatLinearPCM SampleRate:16];
}

- (void)startRecord {
    
    NSLog(@"开始录音");
    
    AVAudioSession *session =[AVAudioSession sharedInstance];
    NSError *sessionError;
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    
    if (session == nil) {
        
        NSLog(@"Error creating session: %@",[sessionError description]);
        
    }else{
        [session setActive:YES error:nil];
        
    }
    
    self.session = session;
    
    
    //1.获取沙盒地址
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingString:@"/test.aac"];
    
    //2.获取文件路径
    NSURL *recordFileUrl = [NSURL fileURLWithPath:path];
    
    //设置参数
    NSDictionary *recordSetting = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   //采样率  8000/11025/22050/44100/96000（影响音频的质量）
                                   [NSNumber numberWithFloat: 8000.0],AVSampleRateKey,
                                   // 音频格式
                                   [NSNumber numberWithInt: kAudioFormatMPEG4AAC],AVFormatIDKey,
                                   //采样位数  8、16、24、32 默认为16
                                   [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,
                                   // 音频通道数 1 或 2
                                   [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
                                   //录音质量
                                   [NSNumber numberWithInt:AVAudioQualityMedium],AVEncoderAudioQualityKey,
                                   nil];
    
    
    _recorder = [[AVAudioRecorder alloc] initWithURL:recordFileUrl settings:recordSetting error:nil];
    
    if (_recorder) {
        
        _recorder.meteringEnabled = YES;
        [_recorder prepareToRecord];
        [_recorder record];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            if ([self.recorder isRecording]) {
                [self.recorder stop];
            }
        });
        
        
        
    }else{
        NSLog(@"音频格式和文件存储格式不匹配,无法初始化Recorder");
        
    }
    
    
}

@end
