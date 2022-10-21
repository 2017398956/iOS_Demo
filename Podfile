# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'iOS_Demo.xcworkspace'

target 'AppBase' do
  project 'AppBase/AppBase.xcodeproj'
  use_frameworks!
#  pod 'AFNetworking'
end

target 'iOS_Demo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  pod 'AFNetworking'

  # Pods for iOS_Demo
#  pod 'irtc-sdk-pod', :git => "git@bitbucket.org:zealcomm/irtc-sdk-pod.git", :tag => '4.4.1'

  target 'iOS_DemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'iOS_DemoUITests' do
    # Pods for testing
  end

end
