Pod::Spec.new do |s|
  s.name = 'RACAlamofire'
  s.version = '0.0.5'
  s.license = 'MIT'
  s.summary = 'ReactiveCocoa extensions for Alamofire'
  s.homepage = 'https://github.com/ararog/Alamofire-RACExtensions'
  s.social_media_url = 'http://twitter.com/ararog'
  s.authors = { 'Rogério Araújo' => 'rogerio.araujo@gmail.com.br' }
  s.source = { :git => 'https://github.com/ararog/Alamofire-RACExtensions.git', :tag => '0.0.5' }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'RACAlamofire/*.swift'

  s.dependency 'Alamofire', '~> 1.1.0'
  s.dependency 'ReactiveCocoa', '~> 2.0'

end
