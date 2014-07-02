Pod::Spec.new do |spec|
  spec.name         = 'RNLoadingButton'
  spec.version      = '1.0'
  spec.license      = 'MIT'
  spec.summary      = 'An Objective-C custom object. Button with Loading'
  spec.homepage     = 'https://romilson.wordpress.com'
  spec.author       = 'Romilson Nunes'
  spec.source       =  :git => 'git@bitbucket.org:souzainf3/rnloadingbutton.git', :tag => 'v1.0'
  spec.source_files = 'Classes/*'
  spec.requires_arc = true
end
