//
//  LMNewsArticleViewController.h
//  Mooves
//
//  Created by Luca Mozzarelli on 10/01/17.
//  Copyright © 2017 Luca Mozzarelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMArticleViewController : UIViewController <UIScrollViewDelegate, UITextViewDelegate>

// Content
@property (strong, nonatomic, setter = setImage:          ) UIImage             *image;
@property (strong, nonatomic, setter = setHeadline:       ) NSString            *headline;
@property (strong, nonatomic, setter = setAuthor:         ) NSString            *author;
@property (strong, nonatomic, setter = setDate:           ) NSDate              *date;
@property (strong, nonatomic, setter = setDateString:     ) NSString            *dateString;
@property (strong, nonatomic, setter = setBody:           ) NSString            *body;
@property (strong, nonatomic, setter = setAttributedBody: ) NSAttributedString  *attributedBody;

// Color
@property (nonatomic) BOOL autoColored;
@property (nonatomic) BOOL navBarAutoColored;
@property (strong, nonatomic, setter = setBackgroundColor:  ) UIColor *backgroundColor;
@property (strong, nonatomic, setter = setHeadlineColor:    ) UIColor *headlineColor;
@property (strong, nonatomic, setter = setDateColor:        ) UIColor *dateColor;
@property (strong, nonatomic, setter = setAuthorColor:      ) UIColor *authorColor;
@property (strong, nonatomic, setter = setBodyColor:        ) UIColor *bodyColor;
@property (strong, nonatomic, setter = setTextColor:        ) UIColor *textColor;

// Font
@property (strong, nonatomic) UIFont *headlineFont;
@property (strong, nonatomic) UIFont *dateFont;
@property (strong, nonatomic) UIFont *authorFont;
@property (strong, nonatomic) UIFont *bodyFont;

// Image View
@property (nonatomic) BOOL              stretchImageView;
@property (nonatomic) UIViewContentMode imageViewContentMode;

@end
