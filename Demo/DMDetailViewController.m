//
//  DMDetailViewController.m
//  Demo
//
//  Created by roki on 2018/8/24.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMDetailViewController.h"
#import "DMTableViewCell.h"


@interface DMDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic)NSMutableArray *dataSource;
@property(weak,nonatomic)UITableView *tableView;

@end

@implementation DMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataSource = [NSMutableArray array];
    NSString *a = @"就是两个就是两个静安寺多路公交上路公交上打了个撒感觉爱上";
    NSString *b = @"法拉数据法拉盛就搞定了时间哥斯达黎加孤陋寡闻论文就浪费时间的垃圾数量估计是垃圾爱上邓丽君发送的垃圾管理局";
    NSString *c = @"放暑假了感觉上当了";
    NSString *d = @"归结为了解了解阿斯古丽撒娇歌垃圾啊工具按揭房老师的价格为IE我就放了大数据分类是关键是垃圾分类的说法见识到了噶是哪里撒多路公交爱上两个家里感觉是个我文件是个垃圾管理局sad论坛积分拉数据分类 ";
    [_dataSource addObject:a];
    [_dataSource addObject:a];
    [_dataSource addObject:b];
    [_dataSource addObject:d];
    [_dataSource addObject:a];
    [_dataSource addObject:c];
    [_dataSource addObject:a];
    [_dataSource addObject:d];
    [_dataSource addObject:d];
    [_dataSource addObject:b];
    [_dataSource addObject:b];
    [_dataSource addObject:a];
    [_dataSource addObject:c];
    [_dataSource addObject:b];
    [_dataSource addObject:a];
    [_dataSource addObject:a];
    [_dataSource addObject:b];
    [_dataSource addObject:d];
    [_dataSource addObject:a];
    [_dataSource addObject:c];
    [_dataSource addObject:a];
    [_dataSource addObject:d];
    [_dataSource addObject:d];
    [_dataSource addObject:b];
    [_dataSource addObject:b];
    [_dataSource addObject:a];
    [_dataSource addObject:c];
    [_dataSource addObject:b];
    [_dataSource addObject:a];
    [_dataSource addObject:a];
    [_dataSource addObject:b];
    [_dataSource addObject:d];
    [_dataSource addObject:a];
    [_dataSource addObject:c];
    [_dataSource addObject:a];
    [_dataSource addObject:d];
    [_dataSource addObject:d];
    [_dataSource addObject:b];
    [_dataSource addObject:b];
    [_dataSource addObject:a];
    [_dataSource addObject:c];
    [_dataSource addObject:b];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 100;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    
//    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.bottom.equalTo(self.view);
//    }];
    
    tableView.frame = self.view.bounds;
    
    [self reloadView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self reloadView];
    
    NSLog(@"");
    CGFloat maxY = _tableView.contentSize.height;
    CGFloat gapY = maxY - [UIScreen mainScreen].bounds.size.height;
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.tableView.contentOffset = CGPointMake(0, gapY);
//    });
    
//    self.tableView.contentOffset = CGPointMake(0, gapY);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath *lastCell = [NSIndexPath indexPathForRow:self.dataSource.count - 1 inSection:0];
        NSLog(@"scrollToRowAtIndexPath");
        [self.tableView scrollToRowAtIndexPath:lastCell atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    });
    
//    NSIndexPath *lastCell = [NSIndexPath indexPathForRow:self.dataSource.count - 1 inSection:0];
//    [self.tableView scrollToRowAtIndexPath:lastCell atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}

- (void)reloadView {
    
//    [_dataSource addObject:@"放暑假了感觉上当了"];
    
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
        [self reloadView];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrolloffset:%@",NSStringFromCGPoint(scrollView.contentOffset));
}
@end
