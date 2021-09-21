To push a new pod version a.b.c 

step-1:
Set version in BlitzBi.podspec a.b.c

step-2:
Set version in BlitzBi BlitzBi.xcodeproj/project.pbxproj (Select BlitzBi Project> Target BlitzBi> General Identity> Version). Ensure it same as in step-1 a.b.c

step-3:
push changes to master

step-4:
Create a tag with version a.b.c

step-5:
push to pod trunk
`pod spec lint BlitzBi.podspec --allow-warnings --verbose`
 `pod trunk push BlitzBi.podspec --allow-warnings --verbose`
