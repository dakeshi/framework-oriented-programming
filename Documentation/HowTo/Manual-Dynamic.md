# Tutorial (Dynamic Frameworks)

### 1. Workspace
The first thing you need is a workspace where all the projects will be. If you already got the one from CocoaPods you can use that one. If not, from Xcode you can easily create it. From `File` select `Save as Workspace...`. Voila! :tada:, workspace created. Your workspace includes your application project.

### 2. Adding your first framework
Let's our persistency framework. With `File > New Project` create a Framework *(it can be either iOS/OSX)* we'll make it universal later on using a configuration file. In the creation dialog, select the option for adding the project to the Workspace that you have opened. The project will be automatically added to the same workspace.

### 3. Making it universal
You might have notice that frameworks have different settings depending on the platform. If you create an iOS Framework and a MacOS framework and diff the project build settings you'll notice that some parameters differ. Fortunately, configuration files allow conditional variable assignment *(you can read more about it [here](https://pewpewthespells.com/blog/xcconfig_guide.html))*. It allows specifying the configuration depending on other variables like the SDK. In this project you'll find an [universal config file](https://github.com/pepibumur/framework-oriented-programming/blob/master/Config/Base.xcconfig) that takes advantage of that to haven an universal configuration. Once you set that `.xcconfig` file as the configuration for your Framework it could be used from a `iOS/tvOS/macOS/watchOS` application. Here's a short example of how the configuration file looks like:

```bash
SUPPORTED_PLATFORMS        = iphoneos iphonesimulator appletvsimulator appletvos macosx watchsimulator watchos
VALID_ARCHS[sdk=iphone*]                = arm64 armv7 armv7s
VALID_ARCHS[sdk=macosx*]                = x86_64
```

Get this configuration file, add it to your framework project, and set it as your framework project configuration as show in the screenshot below:

![Persistency Framework with the universal configuration](../../Assets/Configuration.png)

> Note: Make sure the keys defined in the configuration file are not overriden by your project or your target `Build Settings`. In case they are, just select the overriden key row in `Build Settings` and delete it.

With this you'd have your first Framework created. Build it for a generic device, e.g. iOS.

### 4. Linking Frameworks

Once you've learnt how to create universal Frameworks implementing the `Persistency` framework let's create one responsible of your application business logic, `Core`. Repeat the same steps above.

Once you have the `Core` framework created open the `Core` target `General` tab and add the `Persistency` framework in the `Linked Libraries and Frameworks` section. Xcode will add the `Persistency` framework in your project group *(move it to a Frameworks group, if you don't have it, create it)*.


![Core Framework linking against the Persistency one](../../Assets/Linking.png)

Select the `Persistency.framework` from the inspector and in the right menu change the Location to `Relative to Build Products`. The previous step is very important to make sure we're using paths relative to the `Build Products` directory.


![Core Framework linking against the Persistency one](../../Assets/Framework-Location.png)

> Note: You should see as Location `Persistency.framework`. If you got a different location it's because you didn't build the `Persistency` framework before and Xcode is unable to ind the Framework `Build Products` directory.

### 5. Linking your app

Once you have designed your stack of Frameworks it is time to link all of them with your application. Your application should link against all these Frameworks. Open your application target and add all the frameworks to the `Embedded Binaries` section.

As happened when we linked with Frameworks Xcode will add these Frameworks to your project group directory. Move them into a `Frameworks` folder and update their Location to `Relative to Build Products`.

If you build the app it should work! :tada:. Import your Frameworks and use them:

```swift
import Core
```
