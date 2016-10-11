Pod::Spec.new do |s|

  s.name         = 'SHTimer'
  s.version      = '0.1.6'
  s.summary      = 'SHTimer'

  s.homepage     = 'https://bitbucket.org/sporthub/shtimer.git'

  s.author       = { 'Tom Bates' => 'tom.bates@sporthub.io' }

  s.platform     = :ios, '8.0'

  s.license      = { :type => 'Private',:text => <<-LICENSE
    This Pod is only intended to be used for SportHub applications
    LICENSE
  }

  s.source       = { :git => 'git@bitbucket.org:sporthub/shtimer.git', :tag => s.version.to_s }

  s.source_files = 'SHTimer/SHTimer/**/*.{swift}'

  s.requires_arc = true

end
