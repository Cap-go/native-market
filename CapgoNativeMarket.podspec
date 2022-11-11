
  Pod::Spec.new do |s|
    s.name = 'CapgoNativeMarket'
    s.version = '0.0.1'
    s.summary = 'A native market plugin for linking to google play / Apple store.'
    s.license = 'MIT'
    s.homepage = 'https://github.com/Cap-go/native-market'
    s.author = 'Priyank Patel <priyank.patel@stackspace.ca>'
    s.source = { :git => 'https://github.com/Cap-go/native-market', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '13.0'
    s.dependency 'Capacitor'
  end
