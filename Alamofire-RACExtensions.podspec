Pod::Spec.new do |s|
  s.name = 'Alamofire-RACExtensions'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'ReactiveCocoa extensions for Alamofire'
  s.homepage = 'https://github.com/ararog/Alamofire-RACExtensions'
  s.social_media_url = 'http://twitter.com/ararog'
  s.authors = { 'Rogério Araújo' => 'rogerio.araujo@gmail.com.br' }
  s.source = { :git => 'https://github.com/ararog/Alamofire-RACExtensions.git', :tag => '0.0.1' }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'RACAlamofire/*.swift'

end
