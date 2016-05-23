# Framework Oriented _Programming_
#### **Pedro Piñera @pepibumur**
# :watch::iphone::computer::tv:

---

# __Hello__
## _It's me_
### _(From ~~the other side~~ London)_
![](images/adele.gif)

---

## About Me
- **iOS Developer at SoundCloud**
- Email: [pepibumur@gmail.com](mailto://pepibumur@gmail.com)
- GitHub: [github.com/pepibumur](https://github.com/pepibumur)
- Twitter: [twitter.com/pepibumur](https://twitter.com/pepibumur)
<br>
- Open Source Project: [**SugarRecord**](https://github.com/pepibumur/sugarrecord)
<br>
>  Mention me with your cool :camera:

![right](images/me.jpg)

---

# __Framework__ Oriented Programming
- Started with [**GitDo**](https://gitdo.io)
- Applying principles to [**SoundClound**](https://soundcloud.com)
- Ideas/Principles together **(Reference)**
- **Feedback** is welcome :grinning:

---

# Index

- Context
- Principles
- Advantages
- How to?
- Open Questions
- Conclusions

---

# Index

- **Context**
- Principles
- Advantages
- How to?
- Open Questions
- Conclusions

---

# Context

#### **Before 2008**
## OSX == **1 Bundle***
#### *_Xcode project target_

---

# Context

#### **2008**
## Apple launches iPhone OSX Software Development Kit :iphone:
#### _(Developers move to iOS. New platform, frameworks,... New exciting area)_

---

# Context
#### **After 2008**
## iOS == **1 Bundle***
## OSX == **1 Bundle***
#### *_Xcode project target_

---

## 2011

![gif](images/stoke.gif)

---

# Context
#### **2011**
## CocoaPods released
#### *Dependency Resolving + Integration + Community :tada:*

---

# Context
#### **After 2011**
## iOS == **1 Bundle***
## OSX == **1 Bundle***
## X Bundles (External Dependencies)
#### *_Xcode project target_

---

# Context
#### **2015**

# :watch: :tv:

---

# OMG
#### **That's awesome**

![fill](images/The-Hills.gif)

---

### **When your manager said**
## _"We have plans to launch the company app for these platforms"_

![fill](images/dnc.gif)

---
## Trying to __reuse__
### your code base
# :cold_sweat:

![fill](images/tmhnks.gif)

---

# Context
#### **2015**
## iOS == **1 Bundle***
## OSX == **1 Bundle***
## tvOS == **1 Bundle***
## watchOS == **1 Bundle***

---

# How to reuse code?
### _(across platforms)_

## **Frameworks**

---

# Swift :heart:
## **Dynamic Frameworks**
#### (OSX, iOS, watchOS, tvOS)

- Allow embedded resources *(images, fonts, ...)*
- Dynamically linked *(No duplicated symbols)*
- Swift & Objective-C code

---

# Framework Oriented Programming
### **Coding your apps organizing your code base in reusable & multiplatform code bundles**

Best Practices, Principles, Advices..

[github.com/pepibumur/framework-oriented-programming](https://github.com/pepibumur/framework-oriented-programming)

---

# Index

- Context
- **Principles**
- Advantages
- How to?
- Open Questions
- Conclusions

---

# Frameworks Stack

![inline](images/stack.png)

---

# Principles
## __Let's dive into the theory__
### _(if you have better names, :bell: me)_

---

# 1. Single Responsibility
## __SOLID inspired__
![inline](images/stack-single-networking.png)

---

# 1. Single Responsibility
## __SOLID inspired__
![inline](images/stack-single-persistence.png)

---

# Responsibility?
### __CoreData access layer?__


![fill](images/responsibility-gif.gif)

---

# Responsibility?
### __CoreData access layer?__
### __Storage access layer?__

![fill](images/responsibility-gif.gif)

---

# Responsibility?
### __CoreData access layer?__
### __Storage access layer?__
### __Keychain access layer?__

![fill](images/responsibility-gif.gif)

---

# Responsibility?
### __CoreData access layer?__
### __Storage access layer?__
### __Keychain access layer?__

![fill](images/responsibility-gif.gif)

---

# Responsibility?
### __CoreData access layer?__
### __Storage access layer?__
### __Keychain access layer?__
### __Models?__

![fill](images/responsibility-gif.gif)

---

# Responsibility?
### __CoreData access layer?__
### __Storage access layer?__
### __Keychain access layer?__
### __Models?__
# 😩

![fill](images/responsibility-gif.gif)

---

# 1. Single Responsibility
## __Start from a high level__
![inline](images/stack-single-persistence.png)

---

# 1. Single Responsibility
## __Slice them progressively__
![inline](images/stack-single-slice-1.png)

---

# 1. Single Responsibility
## __Slice them progressively__
![inline](images/stack-single-slice-2.png)

---

# 2. Vertical dependencies
## __(Over Horizontal)__
![inline](images/stack-vertical.png)

^ We want to have more cohesion between layers avoiding coupling between elements in the same layer.

---

# 3. __Lower__ in the stack
## __Fewer__ external dependencies

![inline](images/stack-lower.png)

^Dependencies of lower frameworks and are also dependencies of upper frameworks

---

# 4. __One Step__ Dependencies
![inline](images/stack-one-1.png)

^ Frameworks should depend only on the frameworks below them.

---

# 4. __One Step__ Dependencies
![inline](images/stack-one-2.png)

^ This would make replacement easier and the frameworks less coupled.
^ Restrict the elements that are publicly exposed to other frameworks.
^ Define the scope of your framework and expose only that scope.

---

# 5. __Internal__ by default
![inline](images/stack-internal.png)

^Swift makes it easier since internal is the default visibility.

---

# 6. Final
## __SOLID inspired (open/closed)__

![inline](images/stack-final.png)

^ It's based in the open/closed principle of SOLID.
^ Allow extension (open) but without modifying the implementation.

---

# 6. Final
## __SOLID inspired (open/closed)__

![inline](images/stack-final-1.png)

---

# 6. Final
## __SOLID inspired (open/closed)__

![inline](images/stack-final-2.png)

---

# 6. Final
## __SOLID inspired (open/closed)__

```swift
final class Person {
  let name: String
}

class Alien: Person { // Compiler complains
}
```

---

# 7. Framework __models__
### __Don't share lower frameworks models upwards__

![inline](images/stack-models-1.png)

---


# 7. Framework __models__
### __Don't share lower frameworks models upwards__

![inline](images/stack-models-2.png)

---

# 7. Framework __models__
### __Don't share lower frameworks models upwards__

```swift
// Persistence
class Author: NSManagedObjectModel {
  let name: String
}
class Track: NSManagedObjectModel {
  let author: Author
}

// ListenersKit
struct StreamTrackEntity {
  let name: String
  let authorName: String
}
```

---

# 7. Framework __models__
### __Don't share lower frameworks models upwards__

```swift
struct StreamTrackEntityAdapter {
  func adapt(track: Track) -> StreamTrackEntity {
    return StreamTrackEntity(name: track.name, authorName: track.author.name)
  }
}
```

---

# 8. Platform __Abstraction__
![inline](images/stack-platform-1.png)

---

# __But...__
### _There's platform specific logic_
__Examples__
<br>
- No `NSFetchedResultsController` in macOS
- `NSIndexPath` is slightly different for watchOS.

![](images/dsori.gif)

---

# 8. Platform __Abstraction__
## __Macros!__

```swift
#if os(OSX)
  // OSX logic
#else
  // Other platforms logic
#endif
```

---

# 9. __Protocol__ Oriented Interfaces
![inline](images/stack-protocols-1.png)

---

# 9. __Protocol__ Oriented Interfaces
![inline](images/stack-protocols-2.png)

---

# 9. __Protocol__ Oriented Interfaces
![inline](images/stack-protocols-3.png)

---

# 9. __Protocol__ Oriented Interfaces
![inline](images/stack-protocols-4.png)

---

# 9. __Protocol__ Oriented Interfaces
![inline](images/stack-protocols-5.png)

---

# 10. Core/Testing
### __(aka your project Foundation frameworks)__

![inline](images/stack-foundation.png)

---

# 10. Core/Testing
### __Accessible from all the Frameworks__

- Extensions
- Logging
- Analytics
- Architectural components (e.g. Reactive)

---

# Index

- Context
- Principles
- **Advantages** 😋
- How to?
- Open Questions
- Conclusions

---

# Multiplatform apps
## **Only working on the UI**
## :watch::iphone::tv::computer:

![inline](images/stack-multiplatform-1.png)

---

# Experimentation
## **`import MyAppKit`**

- Prototyping.
- Playgrounds.

```swift
// Playground
import SoundCloudKit

SoundCloud.search(term: "acdc").subscribeNext { tracks in
  print(track.name)
}
```

---

# Multiplatform apps
## **Only working on the UI**
## :watch::iphone::tv::computer:

![inline](images/stack-multiplatform-2.png)


---

# New products
## **With similar core needs**
### *Because you want to reuse code, right?*

![inline](images/stack-products-1.png)

---

# New products
## **With similar core needs**
### *Because you want to reuse code, right?*

![inline](images/stack-products-2.png)

---

# Open Source
## **And benefit from the community**
### *Build pieces of code that you'd be proud of open sourcing*

![inline](images/stack-opensource.png)

---

# Specialized teams
## **From UI lovers to Core Data experts**
### _(clearly defined team boundaries)_

![inline](images/stack-teams-1.png)

---

# Specialized teams
## **From UI lovers to Core Data experts**
### _(clearly defined team boundaries)_

![inline](images/stack-teams-2.png)

---


# Index

- Context
- Principles
- Advantages
- **How to?**
- Open Questions
- Conclusions

---

# How to?
### **There are multiple options**
#### _(I'll show you some)_

---

# How to?
### **CocoaPods**
![inline](images/stack-how-cocoapods.png)

---

# How to?
### **CocoaPods**

- ✅ Easy setup (each Framework `.podspec`)
- ✅ You don't have to worry about Xcode Frameworks configuration
- ✅ Same setup for local/external dependencies
- ❌ `.podspec` cannot point to another local `.podspec`s

---

# How to?
### **Local CocoaPods Dependencies**

```ruby
# Networking ~> Core dependency not found
pod 'Networking'
pod 'Core'
pod 'AppKit'
```

---

# How to?
### **Local CocoaPods Dependencies**

```ruby
pod 'Core'
pod 'Networking' # Core has already been resolved
pod 'AppKit'
```

---

# How to?
### **Manual**

- ✅ More control over the workspace.
- ✅ External dependencies can be checked out with Carthage/Git Submodules.
- ❌ It requires some knowledge about Xcode projects.

---

# How to?
### **Hybrid**

![inline](images/stack-how-3.png)

---

# How to?
### **Hybrid**

- ✅ More control over the workspace setup for your stack.
- ✅ Automatic CocoaPods integration for the top layer.

---

# Index

- Context
- Principles
- Advantages
- How to?
- **Open Questions**
- Conclusions

---

# Open Questions
## **External Dependencies?**
**RECOMMENDATION :warning:**

- __If CocoaPods for local__: Use it also for external.
- __If manual setup__ Use Carthage for checking out external dependencies `carthage update`
  - With the binary.
  - Adding the project to the workspace: `--no-build`

---

# Open Questions
## **Versioning? Git repo per framework?**

**RECOMMENDATION :warning:**
- Keep it in the same repository *(fast iterations)*
- Move it once it consolidates. *(sporadic changes)*
- Then version it! *(snapshots in time)*

---

# Open Questions
## **Static or Dynamic?**

**RECOMMENDATION :warning:**
- `Objective-C` & not shared ~> **Static**
- `Objective-C` && shared ~> **Dynamic**
- `Swift` && `.*` ~> **Dynamic**

> The more dynamic the worse load time

---

# Open Questions
## **Migrate existing project**

**RECOMMENDATION :warning:**
- Start with `Core/Testing`
- Move `Foundation` components down.
- Continue building layers progressively.

*You'll figure out how couple your code is 😂*

---

# Index

- Context
- Principles
- Advantages
- How to?
- Open Questions
- **Conclusions**

---

# __Conclusions__
## **Very useful** for multi-platform projects

---

# __Conclusions__
##  Contributes with **less coupled** code
### *(defined boundaries)*

---

# __Conclusions__
## Setup requires some **Xcode Build Settings knowledge**
### *Unless you use CocoaPods*

---

# __Conclusions__
## **Swift & Dynamic frameworks** make things easier

- Visibility.
- Type safety.
- Resources in Frameworks.

---

# __Conclusions__
## **Minimise** external dependencies (KISS)
### _(avoid more than 2 levels)_

---

# __Conclusions__
## Use your **commonsense**
### _When deciding the Frameworks you need_
### _(don't get inspired from Javascript)_

---

# __Conclussion__
## **Configuration** depends on your project
- New project?
- Existing project to migrate?
- Many external dependencies?
- Not that many?
- Already using CocoaPods?

---

# __References__

- [**Library Oriented Programming**: Justin Spahr-Summers](https://realm.io/news/justin-spahr-summers-library-oriented-programming/)
- [**The Unofficial Guide to xcconfig files**](https://pewpewthespells.com/blog/xcconfig_guide.html)
- [**CocoaPods**](https://cocoapods.org)
- [**Carthage**](https://github.com/carthage)
- [**pepibumur/framework-oriented-programming**](https://github.com/pepibumur/framework-oriented-programming)
- [**Static & Dynamic libraries**](https://pewpewthespells.com/blog/static_and_dynamic_libraries.html)
- [**Creating your first iOS Framework**](https://github.com/pepibumur/framework-oriented-programming)

---

![gif](images/thanks.gif)

----

# Questions? :grinning:

[SpeakerDeck Slides: http://bit.ly/22m4lwi](http://bit.ly/22m4lwi)
