platform :ios, '11.0'

target 'MDC-111' do
  use_frameworks!

  # Pods for MDC-Codelab-2018
  if(ENV['TEST_BRANCH'])
    pod 'MaterialComponents', :git => 'https://github.com/material-components/material-components-ios', :branch => ENV['TEST_BRANCH']
  elsif(ENV['TEST_COMMIT'])
    pod 'MaterialComponents', :git => 'https://github.com/material-components/material-components-ios', :commit => ENV['TEST_COMMIT']
  elsif(ENV['TEST_TAG'])
    pod 'MaterialComponents', :git => 'https://github.com/material-components/material-components-ios', :tag => ENV['TEST_TAG']
  elsif(ENV['DEFAULT_BRANCH'])
    pod 'MaterialComponents', :git => 'https://github.com/material-components/material-components-ios', :branch => ENV['DEFAULT_BRANCH']
  else
    pod 'MaterialComponents', :git => 'https://github.com/material-components/material-components-ios', :branch => 'google-io-codelabs-2018'
  end
end
