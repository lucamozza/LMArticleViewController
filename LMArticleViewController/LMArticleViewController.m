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
}
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *headlineLabel;
@property (strong, nonatomic) UILabel *authorLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UIView *divider;
@property (strong, nonatomic) UILabel *bodyLabel;

@end

@implementation LMArticleViewController

// Setup

- (void)viewDidLoad {
    [super viewDidLoad];
    
    backgroundColorSet = NO;
    headlineColorSet = NO;
    dateColorSet = NO;
    authorColorSet = NO;
    bodyColorSet = NO;
    
    if ( self.autoColored && self.image ) {
        // Set auto colors!
        self.backgroundColor = [UIColor colorWithAverageColorFromImage:self.image];
    }
    else {
        self.backgroundColor = [UIColor whiteColor];
    }
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.bounds.size.width];
    constraint.active = YES;
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
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
    [self.headlineLabel sizeToFit];
    self.headlineLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:36];
    // Set font here! (size 36)
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
    [self.authorLabel sizeToFit];
    self.authorLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
    // Set font here! (size 12)
    
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
    [self.dateLabel sizeToFit];
    self.dateLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    // Set font here (size 12)
}

- (void)setupBody {
    
    self.bodyLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.backgroundView addSubview:self.bodyLabel];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.bodyLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.dateLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:20];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.bodyLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeLeft multiplier:1 constant:14];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.bodyLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeRight multiplier:1 constant:-14];
    constraint.active = YES;
    
    constraint = [NSLayoutConstraint constraintWithItem:self.bodyLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeBottom multiplier:1 constant:-30];
    constraint.active = YES;
    
    
    self.bodyLabel.numberOfLines = 0;
    
    self.bodyLabel.font = [UIFont fontWithName:@"Georgia" size:20];
    [self.bodyLabel sizeToFit];
    
    
    // Set font here! (size 20)
}

// Setters

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

- (void)setHeadline:(NSString *)headline {
    self.headlineLabel.text = headline;
}

- (void)setAuthor:(NSString *)author {
    self.authorLabel.text = [NSString stringWithFormat:@"by %@", author];
}

- (void)setDate:(NSString *)date {
    self.dateLabel.text = date;
}

- (void)setBody:(NSString *)body {
    self.bodyLabel.text = body;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    backgroundColorSet = YES;
    self.backgroundView.backgroundColor = backgroundColor;
    self.view.backgroundColor = backgroundColor;
}

- (void)setHeadlineColor:(UIColor *)headlineColor {
    headlineColorSet = YES;
    self.headlineLabel.textColor = headlineColor;
}

- (void)setDateColor:(UIColor *)dateColor {
    dateColorSet = YES;
    self.dateLabel.textColor = dateColor;
}

- (void)setAuthorColor:(UIColor *)authorColor {
    authorColorSet = YES;
    self.authorLabel.textColor = authorColor;
}

- (void)setBodyColor:(UIColor *)bodyColor {
    bodyColorSet = YES;
    self.bodyLabel.textColor = bodyColor;
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

- (UILabel *)bodyLabel {
    if (!_bodyLabel)
        _bodyLabel = [UILabel new];
    return _bodyLabel;
}

@end
