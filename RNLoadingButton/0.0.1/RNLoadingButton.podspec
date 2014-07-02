Pod::Spec.new do |s|
  s.name         = "RNLoadingButton"
  s.version      = "0.0.1"
  s.summary      = "A UIButton subclass with loading animation"
  s.description  = <<-DESC
                   RNLoadingButton offers alignment "loading" options, hide text or image while loading the animation is running.
                   DESC
  s.homepage     = "http://romilson.wordpress.com/"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT"
  s.author             = { "Romilson Nunes" => "souzainf3@yahoo.com.br" }
  s.social_media_url   = "http://twitter.com/souzainf3"
  s.platform     = :ios, "5.0"
  s.source       = { :git => "git@bitbucket.org:souzainf3/rnloadingbutton.git", :tag => "0.0.1" }
  s.requires_arc = true
  s.source_files  = "RNLoadingButton/*"
end
