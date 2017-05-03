Pod::Spec.new do |s|

  s.name         = "App2WebHandoff"
  s.version      = "1.0.3"
  s.summary      = "Resume in-app web browsing in the default web-browser of the continuing platform adopting handoff."
  s.description  = <<-DESC
  # Native App to Web Browser Handoff
  Resume in-app web browsing in the default web-browser of the continuing platform adopting handoff.
                   DESC

  s.homepage     = "https://github.com/intelygenz/App2WebHandoff"
  s.screenshots  = "https://raw.githubusercontent.com/intelygenz/App2WebHandoff/master/screenshot.gif", "https://raw.githubusercontent.com/intelygenz/App2WebHandoff/master/screenshot_2.jpg", "https://raw.githubusercontent.com/intelygenz/App2WebHandoff/master/screenshot_1.jpg"
  s.license      = "MIT"

  s.authors            = { "Alex Rupérez" => "alejandro.ruperez@intelygenz.com" }
  s.social_media_url   = "http://twitter.com/intelygenz"

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/intelygenz/App2WebHandoff.git", :tag => "#{s.version}" }

  s.subspec 'UIKit' do |ss|
    ss.source_files = "App2WebHandoff/UI*.swift"
    ss.frameworks = "UIKit"
  end

  s.subspec 'WebKit' do |ss|
    ss.source_files = "App2WebHandoff/WK*.swift"
    ss.frameworks = "WebKit"
  end

  s.subspec 'SafariServices' do |ss|
    ss.source_files = "App2WebHandoff/SF*.swift"
    ss.frameworks = "SafariServices"
  end

end
