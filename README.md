# Framework Oriented Programming
#### *Iteration 0.0.1*

> The concept of Framework Oriented Programming is formulated as a set of principles that has been are and are improved as I iterate over this idea in real scenarios. Some of these principles might change. **Any open question that you might have feel free to propose it via email [pepibumur@gmail.com](mailto://pepibumur@gmail.com)**

The ideas behind this paper are not new. They're based on existing principles and programming paradigms. My goal is to put them together, motivating and introducing Swift/Objective-C developers into something I called "Framework Oriented Programming (FOP)".


1. [Context](#context)
2. [Motivation](#motivation)
3. [Principles](#principles)
4. [Testing](#testing)
5. [Example](#example)
6. [Open questions](#open-questions)
7. [Contribute](#contribute)
8. [References](#references)

# 1 - Context

We've always been told as a developers to follow one basic principle of design, try to make your code *reusable*. Design your classes, your business logic, your projects to be reusable. Project them into the future and imagine how these components could be used on different scenarios and contexts, pay special attention to the dependencies and prefer abstractions over concrections... There are bunch of principles and philosophies that can be applied to create reusable code from a low level perspective. However, when it's about going higher in the stack, we forget about it and we end up having projects tied to the platform and tied to our product use case. **What if we could design our apps in a way that could be easy to reuse and platform independent?**
<br><br>
Nobody predicted a few years ago we were going to have so many platforms to develop for in Swift/Objective-C. Mobile platforms and iOS was the first step for a lot of developers that wanted to give a try to something new, playing with the new features and possibilities that mobile development offered. By that time, the focus *(and also my focus)* was coding for iOS. I didn't think I could need part of all that code in future projects, and thus, I treated my project like big boxes *(not black because I knew about the magic I was placing inside)* that implemented from UI tasks to interactions with the database. The big box was the **main app target**, that one that Xcode creates for you when you start a new project from the scratch. Later on, thanks to [CocoaPods](https://cocoapods.org) we easily connected our big box with other external small boxes, [AFNetworking](https://github.com/afnetworking/afnetworking), [MagicalRecord](),... I'm sure some of them are familiar with you. Our dependecy graph looked like the schema below where each connected framework is an external dependency:

We were taking advantage of reusable components that other developers where offering in open. That saved and saves us a lot of time nowadays. However *(and unconsciously)*, our project was likely tied to the platform and the product use case we were coding for:

- Using UIKit from every single piece of code in our app.
- Designing the API layer to interact with a pre-existing API.
- Reusing models in multiple layers. Sometimes even models that came from *CoreData*, *Realm* or any other persistence solution.

Our box seemed to be also tied to our external dependencies and we could live with it. The problem came up either when from the product perspective the company pushed the software engineers to have a *watchOS*, a *tvOS* or add a new application to the family that was supposed to reuse most of the things were already implemented in the existing app.

> Yes! that moment when someone says: Oh, actually it should be very straightforward since we should be able to reuse most of our code from the main app. *(And your face turned into a poem)*

Our code bases were not ready to these big changes. Then some of us took the **workaround** way, that term so familiar for many developers. Apple was pushing towards using dynamic frameworks for watch apps, why not following what Apple said? I create another target for the watch app, and share some classes between my application and the watch one. Problem solved! This solved part of the problem partially, and worarkonds shouldn't be the way we solve our problems, they are breakable, fragile, and don't scale.

# 2 - Motivation

It was then when I decided to invest some time in figuring out how applications nowadays should be structured and documented it on this paper. The main goal of this architecture proposal is:

- **Easily expand to new platforms:** Creating a new version of your project for another platforms should be as easy as working on the UI layer, reusing all the business logic that comes already implemented in your frameworks.
- **New products with similar core needs:** This is very sweet for startups, since it allows product related iterations. Companies can benefit from this  adding new products to the stack that share the same core logic as other products *(e.g. the new product interacts with the same API, the data model is the same...)*

- **Aim open sourcing:** Have you ever wanted to open source a component in your project and it was hard because it was designed to be used in your product? What if it was designed in the other way around without thinking about where the component would be used? Designing without thinking in the use case leads to more generic implementation that might be handy for other developers and so, open-sourceable from your side.

- **Plug in an out pieces with ease:** Having the business logic separated in small pieces helps when the project needs a replacement for any of these pieces. As the code is very isolated and the public interface abstracted these pieces could be easily replaced just exposing the same interface but replacing the private implementation. The rest of the frameworks / app  depend only on the public interface.


I called it *"Framework Oriented Programming"* and brought the joyfulness of playing with **Legos** to the Swift/Objective-C development.

# 3 - Principles

### 1. Single responsibility

SOLID principles also apply to framework. Frameworks should satisfy the single responsibility framework. They should have only one responsibility. If any of your designed frameworks might have multiple responsibility, think about slicing it in more layers.

> For example, if we have an API interaction layer, and it offers not only the wrapper to the Foundation Networking layer but the requests  factories and models *(tied to your project use case)* think about splitting them into a `Networking` and an `API` frameworks.

Frameworks that apparently had only one responsibility might get more later. It's up to the developer to identify that and take action on it, either separating them into multiple frameworks or extracting the logic that should be in a different one.

Defining the responsibility of a framework is not easy. Think about a Framework as a box, that you give data to, it **does something** with your data, and provides you with some results. Does something is your framework's purpose. Keep that purpose simple and under a defined scope.

### 2. Vertical dependency

Design your frameworks graph as a stack with multiple layers where the application is on the top. Avoid horizontal dependencies between frameworks in the same layer and prefer vertical dependencies down in the stack. If any framework needed to know about other, you might need a layer that *"puts them in touch"*, on top of them. A very simple example would be the data synchronization in your app. We might have a framework for an HTTP interaction with your API, another one for persisting the data and think about getting to know each other to persist the responses from one using the other one. You're unconsciously coupling these two frameworks horizontally. Let's come up with a new framework on top of these responsible of that *synchronization* between local and remote.

### 3. One step dependencies


### 3. Foundation

### 5. Model domains

### 6. Public protocol oriented interface

### 7. Wrapped external dependencies

# 4 - Testing

# 5 - Example

There's an example project in this repository that includes:
- External dependencies resolved using CocoaPods.
- Local dependencies added manually to the same workspace.
- External dependencies for local frameworks using Carthage.

To setup the project locally:

1. Git clone the repository `git@github.com:pepibumur/framework-oriented-programming.git`
2. Install bundle dependencies `bundle install`
3. Install carthage if you didn't have it installed `brew install carthage`
4. Execute `bundle exec pod install` to resolve CocoaPods dependencies and create the workspace with them.
5. Execute `carthage update` to resolve Carthage dependencies.
6. Open the project using `Example.xcworkspace`.

# 6 - Open questions

### Dependency managers

It's possible. Both dependencies managers support either local or remote dependencies. Let's see the advantages/disadvantages of each approach:

#### Manual
When you setup everything manually, you have more control over it and it's harder to get the setup broken with Xcode updates. You have to invest some time to setup everything properly but once done you don't have to change it anymore unless you introduce new frameworks in the stack. Not exactly a disadvantage, but the manual process requires more context about *build settings*. Something you save with dependency managers like CocoaPods where the setup is abstracted in a specification file `.podspec` *(where you specify how your framework will be integrated with the application project)*.

#### CocoaPods
Using CocoaPods saves setup time since once you create the frameworks using the command line script, the only thing the developer has to do is adding the dependencies between them in the `.podspec` files. As a disadvantage of this approach is that the control of the framework configuration is more on the CocoaPods side and it might get broken easily with Xcode updates. Moreover if you use any Swift dependency in your project, you're force to use `dynamic libraries` with all your dependencies, including your local ones. What if you want one of them to be static?. It's also hard to connect local dependencies since you cannot specify a `path` for your dependencies in the `.podspec`. There are workaround to that problem though, either you help CocoaPods discovering these dependencies in the Podfile, or just move them into different repositories and having a private CocoaPods repository.

#### Carthage
Using Carthage for setting up your local dependencies doesn't make sense at all. However, if you need any external dependency, you can use the dependency resolution component of Carthage to checkout these projects in a `Carthage/Checkouts` folder and add them to the same workspace where all the frameworks projects are. If ask Carthage to build these dependencies into `.framework`s and use them instead, keep in mind that these frameworks are compiled with an *Xcode* and either if you update Xcode or checkout the project from the scratch, you will be forced to recompile them.

### Git project/s

Another question that arises in regards frameworks is where should these frameworks be? Should they be in the same repository? Should they be in multiple repositories?

You can choose what's best for you, the same principles explained above apply. However, if you don't want to make your development slower I'd recommend you to keep them in the same repository. **Why?** When you have the frameworks in multiples repositories every change involves a new commit, that has to be validates, reviewed and pushed to the remote repository, and then an update in the

### Versioning
Frameworks support versioning. Versioning is also supported by dependency managers. In case of CocoaPods, it's specified in the framework `.podspec` file and in Carthage using *Git releases*.
//TODO

### Static or dynamic
//TODO

### External dependencies
Ideally external dependencies should be simplified because otherwise your dependencies tree complexity increases and you tie all your frameworks to these external sources. Try to avoid *wrappers* around system provided frameworks like `CoreData` or `Foundation`. If it's not possible to remove an external dependency from a local framework then find the best approach for integrating that dependency into your workspace:

- If you used **CocoaPods** for managing all your project dependencies then the best approach is using the same dependency manager. Specify these external dependencies in the respective `.podspec` files and that's all.
- If you preferred the manual manner, then you have to add these dependencies to your workspace. They can be either:
  - Resolved and checkout using **Carthage**.
  - Checkout using **Git Submodules**.


# 7 - Contribute
If you want to contribute with the paper, you can:

- **Create a PR:** With your proposal. Make sure to include an explicit description about what you're trying to merge into the source project.
- **Open an Issue:** With any error or incoherence you might have found.


# 8 - References

- **Library Oriented Programming** *(Justin Spahr-Summers)* - [Link](https://realm.io/news/justin-spahr-summers-library-oriented-programming/)
- **Building Modern Frameworks** *(Apple)* - [Link](https://developer.apple.com/videos/play/wwdc2014/416/)
- **Creating your first iOS Framework** *(Thoughtbot)* - [Link](https://robots.thoughtbot.com/creating-your-first-ios-framework)
