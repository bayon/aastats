//
//  MusicCell.m
//  Music Search
//
//  Created by Bayon Forte on 12/19/13.
//  Copyright (c) 2013 Mocura. All rights reserved.
//

#import "CompaniesCell.h"

@implementation CompaniesCell

@synthesize  leftLabel, rightLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		CGFloat windowWidth = [UIScreen mainScreen].bounds.size.width;
		UIImageView *tempBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, windowWidth, 61)];

		[self.contentView addSubview:tempBackgroundImageView];


		UILabel *tempLeftLabel = [[UILabel alloc] init];
		tempLeftLabel.frame = CGRectMake(5, 20, 100, 20);
		tempLeftLabel.font = [UIFont boldSystemFontOfSize:12];
		tempLeftLabel.backgroundColor = [UIColor clearColor];
		[self.contentView addSubview:tempLeftLabel];
		self.leftLabel = tempLeftLabel;

		UILabel *tempRightLabel = [[UILabel alloc] init];
		tempRightLabel.frame = CGRectMake(100, 20, 300, 20);
		tempRightLabel.font = [UIFont boldSystemFontOfSize:10];
		tempRightLabel.textColor = [UIColor grayColor];
		tempRightLabel.backgroundColor = [UIColor clearColor];
		[self.contentView addSubview:tempRightLabel];
		self.rightLabel = tempRightLabel;
	}
	return self;
}

@end
