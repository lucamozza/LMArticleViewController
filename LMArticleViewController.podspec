Pod::Spec.new do |s|

  
  s.name         = "LMArticleViewController"
  s.version      = "1.2"
  s.summary      = "An Objective-C subclass of UIViewController inspired by Apple News"
  s.description  = "This subclass of UIViewController provides an article view controller with one top image, title, date, author and body labels."

  s.homepage     = "https://github.com/lucamozza/LMArticleViewController"

  s.license      = { :type => 'MIT', :file => 'license.txt' }

  s.author        = "Luca Mozzarelli"

  s.platform      = :ios, "9.0"
  
  s.source	  = { :git => "https://github.com/lucamozza/LMArticleViewController.git", :tag => 'v1.2'}

  s.source_files  = "LMArticleViewController", "LMArticleViewController/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"
  
  s.dependency 'ChameleonFramework'
  s.dependency 'TLYShyNavBar'
end
