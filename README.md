# Framework Oriented Programming
#### *Iteration 0.0.1*

> The concept of Framework Oriented Programming is formulated as a set of principles that has been are and are improved as I iterate over this idea in real scenarios. Some of these principles might change. **Any open question that you might have feel free to propose it via email [pepibumur@gmail.com](mailto://pepibumur@gmail.com)**

The ideas behind this post/page are not new. They're based on existing principles and programming paradigms. My goal is to put them together, motivating and introducing Swift/Objective-C developers into something I called "Framework Oriented Programming".


1. [Context](#context)
2. [Motivation](#motivation)
3. [Principles](#principles)
4. [Example](#example)
5. [Open questions](#open-questions)
6. [References](#references)

# 1 - Context

We've always been told as a developers to follow one basic principle of design, try to make your code *reusable*. Design your classes, your business logic, your projects to be reusable. Project them into the future and imagine how these components could be used on different scenarios and contexts, pay special attention to the dependencies and prefer abstractions over concrections... There are bunch of principles and philosophies that can be applied to create reusable code from a low level perspective. However, when it's about going higher in the stack, we forget about it and we end up having projects tied to the platform and tied to our product use case. **What if we could design our apps in a way that could be easy to reuse and platform independent?**
<br><br>
Nobody predicted a few years ago we were going to have so many platforms to develop for in Swift/Objective-C. Mobile platforms and iOS was the first step for a lot of developers that wanted to give a try to something new, playing with the new features and possibilities that mobile development offered. By that time, the focus *(and also my focus)* was coding for iOS. I didn't think I could need part of all that code in future projects, and thus, I treated my project like big boxes *(not black because I knew about the magic I was placing inside)* that implemented from UI tasks to interactions with the database. The big box was the **main app target**, that one that Xcode creates for you when you start a new project from the scratch. Later on, thanks to [CocoaPods](https://cocoapods.org) we easily connected our big box with other external small boxes, [AFNetworking](https://github.com/afnetworking/afnetworking), [MagicalRecord](),... I'm sure some of them are familiar with you. Our dependecy graph looked like the schema below where each connected framework is an external dependency:

![Schema that represents an application target connected to multiple external dependencies]({{site.url}}/images/posts/framework_oriented_1.png)

We were taking advantage of reusable components that other developers where offering in open. That saved and saves us a lot of time nowadays. However *(and unconsciously)*, our project was likely tied to the platform and the product use case we were coding for:

- Using UIKit from every single piece of code in our app.
- Designing the API layer to interact with a pre-existing API.
- Reusing models in multiple layers. Sometimes even models that came from *CoreData*, *Realm* or any other persistence solution.

Our box seemed to be also tied to our external dependencies and we could live with it. The problem came up either when from the product perspective the company pushed the software engineers to have a *watchOS*, a *tvOS* or add a new application to the family that was supposed to reuse most of the things were already implemented in the existing app.

> Yes! that moment when someone says: Oh, actually it should be very straightforward since we should be able to reuse most of our code from the main app. *(And your face turned into a poem)*

Our code bases were not ready to these big changes. Then some of us took the **workaround** way, that term so familiar for many developers. Apple was pushing towards using dynamic frameworks for watch apps, why not following what Apple said? I create another target for the watch app, and share some classes between my application and the watch one. Problem solved! This solved part of the problem partially, and worarkonds shouldn't be the way we solve our problems, they are breakable, fragile, and don't scale.

# 2 - Motivation

It was then when I decided to invest some time in figuring out how applications nowadays should be structured and documented it under in this paper. The main goal of this architecture would be:


- Easily expand to new platforms.
- Plug in and out pieces without big problems.
- Allow new products to be built on top of your existing stack.

I called it *"Framework Oriented Programming"* and brought the joyfulness of playing with **Legos** to the Swift/Objective-C development.

> I did part of this research working for my spare time project [GitDo](http://gitdo.io) and now I'm trying to apply the same principles to [SoundCloud](https://soundcloud.com) and aiming and helping developers to consider a similar direction for theirs.


# 3 - Principles

### 1. Single purpose pieces

### 2. Vertical dependency

### 3. Foundation

### 4. One step dependency

### 5. Model domains

### 6. Public protocol oriented interface

### 7. Wrapped external dependencies

# 4 - Example

# 5 - Open questions

### Is it possible to setup this architecture with CocoaPods/Carthage?

It's possible. Both dependencies managers support either local or remote dependencies. Let's see the advantages/disadvantages of each approach:

#### Manual
When you setup everything manually, you have more control over it and it's harder to get the setup broken with Xcode updates. You have to invest some time to setup everything properly but once done you don't have to change it anymore unless you introduce new frameworks in the stack. Not exactly a disadvantage, but the manual process requires more context about *build settings*. Something you save with dependency managers like CocoaPods where the setup is abstracted in a specification file `.podspec` *(where you specify how your framework will be integrated with the application project)*.

#### CocoaPods
Using CocoaPods saves setup time since once you create the frameworks using the command line script, the only thing the developer has to do is adding the dependencies between them in the `.podspec` files. As a disadvantage of this approach is that the control of the framework configuration is more on the CocoaPods side and it might get broken easily with Xcode updates. Moreover if you use any Swift dependency in your project, you're force to use `dynamic libraries` with all your dependencies, including your local ones. What if you want one of them to be static?. It's also hard to connect local dependencies since you cannot specify a `path` for your dependencies in the `.podspec`. There are workaround to that problem though, either you help CocoaPods discovering these dependencies in the Podfile, or just move them into different repositories and having a private CocoaPods repository.

#### Carthage
Using Carthage for setting up your local dependencies doesn't make sense at all. However, if you need any external dependency, you can use the dependency resolution component of Carthage to checkout these projects in a `Carthage/Checkouts` folder and add them to the same workspace where all the frameworks projects are. If ask Carthage to build these dependencies into `.framework`s and use them instead, keep in mind that these frameworks are compiled with an *Xcode* and either if you update Xcode or checkout the project from the scratch, you will be forced to recompile them.

### Keep them in the same project?

Another question that arises in regards frameworks is where should these frameworks be? Should they be in the same repository? Should they be in multiple repositories?

You can choose what's best for you, the same principles explained above apply. However, if you don't want to make your development slower I'd recommend you to keep them in the same repository. **Why?** When you have the frameworks in multiples repositories every change involves a new commit, that has to be validates, reviewed and pushed to the remote repository, and then an update in the

### Versioning?

### Static or dynamic?


### How to manage external dependencies?
Ideally external dependencies should be simplified because otherwise your dependencies tree complexity increases and you tie all your frameworks to these external sources. Try to avoid *wrappers* around system provided frameworks like `CoreData` or `Foundation`. If it's not possible to remove an external dependency from a local framework then find the best approach for integrating that dependency into your workspace:

- If you used **CocoaPods** for managing all your project dependencies then the best approach is using the same dependency manager. Specify these external dependencies in the respective `.podspec` files and that's all.
- If you preferred the manual manner, then you have to add these dependencies to your workspace. They can be either:
  - Resolved and checkout using **Carthage**.
  - Checkout using **Git Submodules**.


# 6 - References
//TODO
