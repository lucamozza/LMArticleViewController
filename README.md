# LMArticleViewController
![License](https://img.shields.io/cocoapods/l/LMArticleViewController.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/LMArticleViewController.svg?style=flat)
![Version](https://img.shields.io/cocoapods/v/LMArticleViewController.svg?style=flat)

This framework allows you to create Apple News-inspired UIViewControllers with ease.

It is heavily inspired by [MRArticleViewController], in fact the core is a simple translation of it. However I added some features I thought could be useful.

## Features
The layout is shown in the images above, here's some extra features.
#### Animations
- [x] The navigation bar shrinks when you scroll down.
- [x] The image view stretches when the scrollview bounces ( just like Facebook's Instant Articles).

#### Appereance
- [x] You can set custom fonts for all the text.
- [x] Supports `NSAttributedString` in the body.
- [x] Supports automatic background color and automatic light/dark text color.


## Installation
LMArticleViewController is available through CocoaPods. Simply add the following line to your Podfile.

```ruby
pod 'LMArticleViewController'
```

## Usage
You can either subclass `LMArticleViewController` and set the contents in the `viewDidLoad:` method or instantiate an LMArticleViewController object, set its properties and present it.

#### Case A: Subclass
```Objective-C
- (void)viewDidLoad {

    // Set custom fonts
    // Size doesn't matter here, the super class overrides with default values
    [self setHeadlineFont:[UIFont fontWithName:@"Nexa Bold" size:1]];
    [self setAuthorFont:[UIFont fontWithName:@"Roboto-Regular" size:1]];
    [self setDateFont:[UIFont fontWithName:@"Roboto-Regular" size:1]];

    // Set contents
    self.headline       = self.dataDictionary[k_TITLE];
    self.image          = self.dataDictionary[k_IMAGE];
    self.author         = self.dataDictionary[k_AUTHOR];
    self.attributedBody = self.dataDictionary[k_BODY];
    self.date           = self.dataDictionary[k_DATE];

    // IMPORTANT! Setup must happen before [super viewDidLoad]!!
    [super viewDidLoad];

}
```
#### Case B: Init and push
```Objective-C
- (void)openArticleWithContents:(NSDictionary *)dataDictionary {

    LMArticleViewController* articleViewController = [[LMArticleViewController alloc]init];

    [articleViewController setBodyFont:[UIFont fontWithName:@"Roboto-Medium" size:1]];

    articleViewController.headline       = dataDictionary[k_TITLE];
    articleViewController.image          = dataDictionary[k_IMAGE];
    articleViewController.author         = dataDictionary[k_AUTHOR];
    articleViewController.attributedBody = dataDictionary[k_BODY];
    articleViewController.date           = dataDictionary[k_DATE];

    [self.navigationController pushViewController:articleViewController animated:YES];
}
```


## To-Do List
- [ ] Adjust image view size and proportions.
- [ ] Use [ColorArt] instead of [Chamaleon] (?)


[MRArticleViewController]: https://github.com/mrigdon/MRArticleViewController
[ColorArt]: https://github.com/vinhnx/ColorArt
[Chamaleon]: https://github.com/ViccAlexander/Chameleon
