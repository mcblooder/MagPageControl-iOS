Pod::Spec.new do |spec|
  spec.name         = "MagPageControl"
  spec.version      = "1.0.1"
  spec.summary      = "Customizable implementation of UIPageControl"
  spec.homepage     = "https://github.com/mcblooder/MagPageControl-iOS"
  spec.license      = "MIT"
  spec.author       = { "Rodion Kalyuzhin" => "tusur.rodion@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/mcblooder/MagPageControl-iOS.git", :tag => "#{spec.version}" }
  spec.source_files  = 'MagPageControl/**/*.{swift,h,m}'
  spec.swift_version = '5.0'
end
