Pod::Spec.new do |s|
  s.name        = "SwapiiOS"
  s.version     = "0.0.1"
  s.summary     = "Star Wars API swift lib"
  s.homepage    = "https://github.com/lholmquist/swapi-ios"
  s.license     = { :type => "MIT" }
  s.authors     = { "lholmquist" => "lucas.holmquist@gmail.com" }
  s.platform     = :ios, 8.0
  s.source   = { :git => "https://github.com/lholmquist/swapi-ios.git", :branch => "master"}
  s.source_files = "SwapiiOS/*.swift"
  s.dependency "SwiftyJSON", "2.1.3"
end
