Pod::Spec.new do |spec|

  spec.name         = "AutoLayout-Helper"
  spec.version      = "1.1.0"
  spec.summary      = "Helper Methods for programmatically written AutoLayout code"
  spec.description  = <<-DESC
  Helper Methods for programmatically written AutoLayout code.
  Easily define a priority, identifier or assign a constraint to a variable without leaving the activate array.
                   DESC

  spec.homepage     = "https://snabble.io"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }

  spec.author             = {'snabble GmbH' => 'info@snabble.io' }
  spec.social_media_url   = "https://twitter.com/snabble_io"

  spec.platform     = :ios
  spec.ios.deployment_target = "12.0"
  spec.swift_versions = [ '5.5' ]

  spec.source       = { :git => "https://github.com/snabble/AutoLayout-Helper.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/AutoLayout-Helper/**/*.swift"

end
