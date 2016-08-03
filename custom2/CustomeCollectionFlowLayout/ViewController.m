//
//  ViewController.m
//  CustomeCollectionFlowLayout
//
//  Created by fengsonglin on 16/6/20.
//  Copyright © 2016年 fengsonglin. All rights reserved.
//

#import "ViewController.h"
#import "SLPhotoCell.h"
#import "SLLineLayout.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

static NSString *const SLPhotoId = @"photo";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建布局
    SLLineLayout *layout = [[SLLineLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);
    //创建CollectionView
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 200;
    CGRect frame = CGRectMake(0, 150, collectionW, collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    //注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SLPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:SLPhotoId];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SLPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SLPhotoId forIndexPath:indexPath];
    cell.imageName = [NSString stringWithFormat:@"%zd",indexPath.item + 1];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%zd个",indexPath.item);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
