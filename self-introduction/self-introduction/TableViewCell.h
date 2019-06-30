//
//  TableViewCell.h
//  self-introduction
//
//  Created by Randi on 22/6/2019.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *TitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *DescriptionLabel;

@property (strong, nonatomic) IBOutlet UIImageView *ThumbImage;


@end
