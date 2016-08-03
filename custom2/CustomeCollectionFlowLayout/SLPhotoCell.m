//
//  SLPhotoCell.m
//  CustomeCollectionFlowLayout
//
//  Created by fengsonglin on 16/6/20.
//  Copyright © 2016年 fengsonglin. All rights reserved.
//

#import "SLPhotoCell.h"

@interface SLPhotoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SLPhotoCell

- (void)awakeFromNib {
    // Initialization code
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 10;
}

- (void)setImageName:(NSString *)imageName{
    _imageName = [imageName copy];
    self.imageView.image = [UIImage imageNamed:imageName];
}

@end
