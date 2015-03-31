Pod::Spec.new do |s|

  s.name         = "SHTimer"
  s.version      = "0.0.3"
  s.summary      = "SHTimer"

  s.homepage     = "https://bitbucket.org/sporthub/shtimer.git"

  s.author       = { "Tom Bates" => "tom.bates@sporthub.io" }

  s.platform     = :ios, "8.0"

  s.license      = { :type => 'Private',:text => <<-LICENSE
    This Pod is only intended to be used for SportHub applications
    LICENSE
  }

  s.source       = { :git => "https://bitbucket.org/sporthub/shtimer.git", :tag => "0.0.3" }

  s.source_files = 'SHTimer/SHTimer/**/*.{swift,h,m}'

  s.requires_arc = true

end
