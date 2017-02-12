//
//  LMNewsArticleViewController.m
//  Mooves
//
//  Created by Luca Mozzarelli on 10/01/17.
//  Copyright © 2017 Luca Mozzarelli. All rights reserved.
//

#import "LMArticleViewController.h"
#import <TLYShyNavBar/TLYShyNavBarManager.h>
#import <ChameleonFramework/Chameleon.h>

@interface LMArticleViewController () {
    BOOL backgroundColorSet;
    BOOL headlineColorSet;
    BOOL dateColorSet;
    BOOL authorColorSet;
    BOOL bodyColorSet;
    BOOL stretchImageViewSet;
}

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *headlineLabel;
@property (strong, nonatomic) UILabel *authorLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UIView *divider;
@property (strong, nonatomic) UITextView *bodyTextView;
@property (strong, nonatomic) NSLayoutConstraint *heightConstraint;
@property (strong, nonatomic) NSLayoutConstraint *topConstraint;
@property (assign, nonatomic) CGFloat lastContentOffset;

@end

@implementation LMArticleViewController

// Setup

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
    // Default background color is white
    if ( !backgroundColorSet )
        self.backgroundColor = [UIColor whiteColor];
    
    // Default setting is yes
    if ( !stretchImageViewSet)
        self.stretchImageView = YES;
    
    // If the author is not set empty it
    if ([[self.authorLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@"by"])
        self.authorLabel.text = @"";
    
    // Add after the VC is added to a nav controller
    self.shyNavBarManager.scrollView = self.scrollView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    [self setupScrollView];
    [self setupImageView];
    [self setupHeadline];
    [self setupAuthor];
    [self setupDate];
    [self setupBody];
}

- (void)setupScrollView {
    
    // Scroll View
    self.scrollView.delegate = self;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.scrollView];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    constraint.active = YES;
    
    // Background View
    
    self.backgroundView.translatesAutoresizingMaskIntoConstraints = false;
    [self.scrollView addSubview:self.backgroundView];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.backgroundView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.backgroundView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.backgroundView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.backgroundView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.backgroundView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.bounds.size.width];
    constraint.active = YES;
}

- (void)setupImageView {
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.backgroundView addSubview:self.imageView];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    self.topConstraint=constraint;
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.bounds.size.width];
    self.heightConstraint = constraint;
    constraint.active = YES;
    
    if (!self.imageViewContentMode)
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    else
        self.imageView.contentMode = self.imageViewContentMode;
    
    self.imageView.clipsToBounds = YES;
}

- (void)setupHeadline {
    
    self.headlineLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.backgroundView addSubview:self.headlineLabel];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.headlineLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeBottom multiplier:1 constant:8];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.headlineLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeLeft multiplier:1 constant:14];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.headlineLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeRight multiplier:1 constant:-24];
    constraint.active = YES;
    
    self.headlineLabel.numberOfLines = 0;
    
    
    if (!self.headlineFont)
        self.headlineLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:36];
    else
        self.headlineLabel.font = [self.headlineFont fontWithSize:36];
    
    [self.headlineLabel sizeToFit];
}

- (void)setupAuthor {
    
    self.authorLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.backgroundView addSubview:self.authorLabel];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.authorLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.headlineLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:8];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.authorLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeLeft multiplier:1 constant:14];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.authorLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeRight multiplier:1 constant:-14];
    constraint.active = YES;
    
    self.authorLabel.numberOfLines = 0;
    
    
    if (!self.authorFont)
        self.authorLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
    else
        self.authorLabel.font = [self.authorFont fontWithSize:12];

    [self.authorLabel sizeToFit];
}

- (void)setupDate {
    
    self.dateLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.backgroundView addSubview:self.dateLabel];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.dateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.authorLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:8];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.dateLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeLeft multiplier:1 constant:14];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.dateLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeRight multiplier:1 constant:-14];
    constraint.active = YES;
    
    self.dateLabel.numberOfLines = 0;
    
    
    if (!self.dateFont)
        self.dateLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    else
        self.dateLabel.font = [self.dateFont fontWithSize:12];
    
    [self.dateLabel sizeToFit];
}

- (void)setupBody {
    
    self.bodyTextView.translatesAutoresizingMaskIntoConstraints = false;
    [self.backgroundView addSubview:self.bodyTextView];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.bodyTextView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.dateLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:20];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.bodyTextView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeLeft multiplier:1 constant:14];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.bodyTextView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeRight multiplier:1 constant:-14];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.bodyTextView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeBottom multiplier:1 constant:-30];
    constraint.active = YES;
    
    self.bodyTextView.delegate = self;
    self.bodyTextView.scrollEnabled = NO;
    self.bodyTextView.editable = NO;
    self.bodyTextView.backgroundColor = [UIColor clearColor];
    
    if (!self.bodyFont && !self.attributedBody)
        self.bodyTextView.font = [UIFont fontWithName:@"Georgia" size:20];
    else if (!self.attributedBody)
        self.bodyTextView.font = [self.bodyFont fontWithSize:20];
    
    [self.bodyTextView sizeToFit];
}

// Properties setters

- (void)setImage:(UIImage *)image {
    
    _image = image;
    
    self.imageView.image = image;
    
    float imageHeight = image.size.height;
    float imageWidth  = image.size.width;
    float imageRatio  = imageWidth/imageHeight;
    float imageViewHeight = self.view.bounds.size.width/imageRatio;
    
    self.heightConstraint.constant = imageViewHeight;
    
    if ( self.autoColored ) {
        self.backgroundColor = [UIColor colorWithAverageColorFromImage:image];
        self.textColor = [UIColor colorWithContrastingBlackOrWhiteColorOn:self.backgroundColor isFlat:NO];
    }
    
}

- (void)setHeadline:(NSString *)headline {
    _headline = headline;
    self.headlineLabel.text = headline;
}

- (void)setAuthor:(NSString *)author {
    _author = author;
    self.authorLabel.text = [NSString stringWithFormat:@"by %@", author];
}

- (void)setDate:(NSDate *)date {
    _date = date;
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = NSDateFormatterLongStyle;
    self.dateString = [formatter stringFromDate:date];
}

- (void)setDateString:(NSString *)dateString {
    _dateString = dateString;
    self.dateLabel.text = dateString;
}

- (void)setBody:(NSString *)body {
    _body = body;
    self.bodyTextView.text = body;
}

- (void)setAttributedBody:(NSAttributedString *)attributedBody {
    _attributedBody = attributedBody;
    self.bodyTextView.attributedText = attributedBody;
    _body = attributedBody.string;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    backgroundColorSet = YES;
    self.backgroundView.backgroundColor = backgroundColor;
    self.view.backgroundColor = backgroundColor;
}

- (void)setHeadlineColor:(UIColor *)headlineColor {
    _headlineColor = headlineColor;
    headlineColorSet = YES;
    self.headlineLabel.textColor = headlineColor;
}

- (void)setDateColor:(UIColor *)dateColor {
    _dateColor = dateColor;
    dateColorSet = YES;
    self.dateLabel.textColor = dateColor;
}

- (void)setAuthorColor:(UIColor *)authorColor {
    _authorColor = authorColor;
    authorColorSet = YES;
    self.authorLabel.textColor = authorColor;
}

- (void)setBodyColor:(UIColor *)bodyColor {
    _bodyColor = bodyColor;
    bodyColorSet = YES;
    self.bodyTextView.textColor = bodyColor;
}

- (void)setTextColor:(UIColor *)textColor {
    self.headlineColor = textColor;
    self.authorColor = textColor;
    self.dateColor = textColor;
    self.bodyColor = textColor;
}

- (void)setStretchImageView:(BOOL)stretchImageView {
    _stretchImageView = stretchImageView;
    stretchImageViewSet = YES;
}

// Initialization

- (UIScrollView *)scrollView {
    if (!_scrollView)
        _scrollView = [UIScrollView new];
    return _scrollView;
}

- (UIView *)backgroundView {
    if (!_backgroundView)
        _backgroundView = [UIView new];
    return _backgroundView;
}

- (UIImageView *)imageView {
    if (!_imageView)
        _imageView = [UIImageView new];
    return _imageView;
}

- (UILabel *)headlineLabel {
    if (!_headlineLabel)
        _headlineLabel = [UILabel new];
    return _headlineLabel;
}

- (UILabel *)authorLabel {
    if (!_authorLabel)
        _authorLabel = [UILabel new];
    return _authorLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel)
        _dateLabel = [UILabel new];
    return _dateLabel;
}

- (UITextView *)bodyTextView {
    if (!_bodyTextView)
        _bodyTextView = [UITextView new];
    return _bodyTextView;
}

// Animation

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if ( self.stretchImageView ) {
        
        // Animate imageview when bouncing
        float contentOffset = scrollView.contentOffset.y;
        if (scrollView.contentOffset.y < self.imageView.frame.size.height - self.imageView.frame.origin.y)
            [UIView animateWithDuration:0 animations:^{
                self.topConstraint.constant = contentOffset;
                self.heightConstraint.constant = self.view.bounds.size.width-contentOffset;
            }];
    }
}

// Links
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    return YES;
}
@end
