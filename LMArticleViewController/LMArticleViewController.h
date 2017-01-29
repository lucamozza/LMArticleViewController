//
//  LMNewsArticleViewController.h
//  Mooves
//
//  Created by Luca Mozzarelli on 10/01/17.
//  Copyright © 2017 Luca Mozzarelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMArticleViewController : UIViewController
@property (nonatomic) BOOL autoColored;
@property (strong, nonatomic, setter = setImage:    ) UIImage *image;
@property (strong, nonatomic, setter = setHeadline: ) NSString *headline;
@property (strong, nonatomic, setter = setAuthor:   ) NSString *author;
@property (strong, nonatomic, setter = setDate:     ) NSString *date;
@property (strong, nonatomic, setter = setBody:     ) NSString *body;

@property (strong, nonatomic, setter = setBackgroundColor:  ) UIColor *backgroundColor;
@property (strong, nonatomic, setter = setHeadlineColor:    ) UIColor *headlineColor;
@property (strong, nonatomic, setter = setDateColor:        ) UIColor *dateColor;
@property (strong, nonatomic, setter = setAuthorColor:      ) UIColor *authorColor;
@property (strong, nonatomic, setter = setBodyColor:        ) UIColor *bodyColor;

@end
