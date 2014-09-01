Pod::Spec.new do |s|
  s.name     = 'MCBlurredModalController'
  s.version  = '0.1.0'
  s.ios.deployment_target   = '6.0'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'A sleek way to display your view controller modally.'
  s.homepage = 'https://github.com/matthewcheok/MCBlurredModalController'
  s.author   = { 'Matthew Cheok' => 'cheok.jz@gmail.com' }
  s.requires_arc = true
  s.source   = {
    :git => 'https://github.com/matthewcheok/MCBlurredModalController.git',
    :branch => 'master',
    :tag => s.version.to_s
  }
  s.source_files = 'MCBlurredModalController/*.{h,m}'
  s.public_header_files = 'MCBlurredModalController/*.h'
end
