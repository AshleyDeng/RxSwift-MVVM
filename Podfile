# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'

target 'RxSwift+MVVM' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RxSwift+MVVM
  pod 'Alamofire', '~> 4.5'
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
  
  
  ### Culprits!!!
  # Firstly, umcomment these pods and run `pod install` to trigger the error
#  pod 'AMScrollingNavbar'
#  pod 'Mixpanel-swift'
#  pod 'UPCarouselFlowLayout', :git => 'https://github.com/andre991/UPCarouselFlowLayout.git'

end

### THE FIX!!!
# Secondly, uncomment this script and run `pod install` to fix the issue.
# You might need to delete your workspace file, Pod folder and DerivedData to fix it.

#post_install do |installer|
#  installer.pods_project.targets.each do |target|
#    if target.name != 'AMScrollingNavbar' && target.name != 'Mixpanel-swift' && target.name != 'UPCarouselFlowLayout'
#      target.build_configurations.each do |config|
#        config.build_settings['SWIFT_VERSION'] = '4.0'
#      end
#    else
#      target.build_configurations.each do |config|
#        config.build_settings['SWIFT_VERSION'] = '4.2'
#      end
#    end
#  end
#end
