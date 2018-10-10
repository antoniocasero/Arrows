Pod::Spec.new do |s|
  s.name         = "Arrows"
  s.version      = "1.0.0"
  s.summary      = "Arrow indicator view for sliding panels"
  s.description  = <<-DESC
    Indicator view of an animated arrow to show when the sliding panel need to be open/close.
    Using CoreGraphics so you don't have to worry about screen resolution.
  DESC
  s.homepage     = "https://github.com/antoniocasero/Arrows"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Antonio Casero Palmero" => "anto.casero@gmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "11.0"
  s.tvos.deployment_target = "11.0"
  s.source       = { :git => "https://github.com/antoniocasero/Arrows.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "UIKit"
end
