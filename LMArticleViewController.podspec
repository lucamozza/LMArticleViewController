Pod::Spec.new do |s|

  
  s.name         = "LMArticleViewController"
  s.version      = "0.0.1"
  s.summary      = "An Objective-C subclass of UIViewController inspired by Apple News"
  s.description  = "An Objective-C subclass of UIViewController inspired by Apple News"

  s.homepage     = "http://EXAMPLE/LMArticleViewController"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }



  s.author        = "Luca Mozzarelli"
  # s.social_media_url   = "http://twitter.com/Luca Mozzarelli"

  s.platform      = :ios, "9.0"
  
  s.source	  = { :git => "http:/example.com/LM.git"}
  #s.source       = { :git => "http://EXAMPLE/LMArticleViewController.git", :tag => "#{s.version}" }

  s.source_files  = "LMArticleViewController", "LMArticleViewController/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

end
