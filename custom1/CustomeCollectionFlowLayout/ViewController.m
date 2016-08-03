//
//  ViewController.m
//  CustomeCollectionFlowLayout
//
//  Created by fengsonglin on 16/6/20.
//  Copyright © 2016年 fengsonglin. All rights reserved.
//

#import "ViewController.h"
#import "SLGridLayout.h"
#import "SLPhotoCell.h"

static NSString * const SLPhotoId = @"photo";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建布局
    SLGridLayout *layout = [[SLGridLayout alloc]init];
    //创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    //注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SLPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:SLPhotoId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SLPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SLPhotoId forIndexPath:indexPath];
    cell.imageName = [NSString stringWithFormat:@"%zd",indexPath.item + 1];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第几%zd行",indexPath.item);
}
@end
