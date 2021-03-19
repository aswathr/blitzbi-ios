#
#  Be sure to run `pod spec lint BlitzBi.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

spec.name                 = "BlitzBi"
spec.version              = "1.6.9"
spec.summary              = "Blitz Bi Module."
spec.description          = "Blitz Bi Module: Used for integration blitz-bi services"
spec.homepage             = "https://gitlab.useblitz.com/blitz/blitzbi-ios.git"
spec.license              = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
LICENSE
}
spec.author               = "Akash Chetty"
spec.platform             = :ios, "9.0"
spec.source               = { :git => "https://gitlab.useblitz.com/blitz/blitzbi-ios.git", :tag => "#{spec.version.to_s}" }
spec.swift_version        = "4.2"
spec.source_files         = "**/**/*.{h,m,swift}"
spec.public_header_files  = "Public/*.h"
spec.exclude_files        = "BlitzBi/BlitzBi/*.plist"
end
