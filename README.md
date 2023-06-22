# UCAverage

[![Build Status](https://codefirst.iut.uca.fr/api/badges/florent.marques/ucaverage-ios/status.svg?ref=refs/heads/main)](https://codefirst.iut.uca.fr/florent.marques/ucaverage-ios)

# Overview

<img src="Documentation/images/uca_icon.png" width="100" />

This project is a calculator developed with SwiftUI that calculates your average. It allows you to display your notes in each block and each subject. A color code is in place to let you know if you have a good grade or not. You can simulate your notes by adjusting the sliders.

This project uses an MVVM architecture adapted for SwiftUI. You can find some explanations [here](#mvvm-architecture).

You can find the instructions [here](CONSIGNES.md).

# Screenshots
<img src="Documentation/images/home.png" width="300" />
<img src="Documentation/images/unit.png" width="300" />
<img src="Documentation/images/unit_edition.png" width="300" />
<img src="Documentation/images/unit_edition_add_course.png" width="300" />

# Features
- [X] List all blocks
- [X] List all units
- [X] Detail of one unit
- [X] List courses in unit
- [X] `Capsule`
    - [X] Adjust grade of the course
    - [X] Lock `Capsule` to lock the grade
    - [X] Color code
- [X] Edit unit
    - [X] Name
    - [X] Coefficient
    - [X] Add course in unit
    - [X] Edit course in unit
    - [X] Delete course in unit
- [X] Json persistence
- [x] Navigation
- [X] Pages
- [X] Custom Views
- [X] Bindings (State, Binding, StateObject, ObservedObject)
- [X] Notifications with `Hashable`
- [ ] Generic Viewmodel for editing

# MVVM Architecture

In this section, I will explain the concept of MVVM architecture in SwiftUI. All the architecture is explained [here](https://codefirst.iut.uca.fr/documentation/mchSamples_Apple/docusaurus/iOS_MVVM_guide/docs/intro/).

## Model

Apple strongly recommends using **structures** in Swift. So we will follow the guidelines to write our model.

```plantuml
@startuml

protocol Identifiable
protocol Equatable
protocol Codable

note as n1
    All the structures implements the
    protocols Identifiable, Equatable and Codable
end note

n1 .. Identifiable
n1 .. Codable
n1 .. Equatable

struct Block {
    + id: UUID
    + name: String
    + average: Float

    + init(id: UUID, name: String, units: [UCAUnit])
    + init(id: UUID, name: String)
    + init(name: String, units: [UCAUnit])
    + init(name: String)

    + updateUnit(unit: UCAUnit)
}

note left of Block::average
    This field is a computed value
    that calculate the weighted
    average of all units in the block.
end note

struct UCAUnit {
    + id: UUID
    + name: String
    + coef: Int
    + average: Float

    + init(id: UUID, name: String, coef: Int, courses: [Course])
    + init(id: UUID, name: String, coef: Int)
    + init(name: String, coef: Int, courses: [Course])
    + init(name: String, coef: Int)

    + addCourse(name: String, coef: Int, mark: Float)
    + updateCourse(course: Course)
    + removeCourse(id: UUID)

    + same(other: Course): Bool
}

note left of UCAUnit::average
    This field is a computed value
    that calculate the weighted
    average of all the courses in the unit.
end note

struct Course {
    + id: UUID
    + name: String
    + coef: Int
    + mark: Float

    + init(id: UUID, name: String, coef: Int, mark: Float)
    + init(name: String, coef: Int, mark: Float)

    + same(other: Course): Bool
}

protocol DataManagerProtocol {
    load(): [Block]
    save(blocks: [Block])
}

UCAUnit --> "courses *" Course
Block --> "units *" UCAUnit

@enduml
```

## Views

The views will bind to the property wrapped by the viewmodel and will send user actions to the viewmodel to execute logics.

The main view, in this project `HomePage`, will own the top viewmodel `OdinVm` as `@StateObject`. This viewmodel will be passed to other views with `@ObservedObject`.

```plantuml
@startuml

class OdinVm
class BlockVm
class UnitVm
class CourseVm

struct HomePage {
    + @StateObject odinVm: OdinVm
}
struct UEDetailPage
struct BlocksView {
    + @ObservedObject odinVm: OdinVm
}
struct UEListView {
    + @ObservedObject blockVm: BlockVm
}
struct BlockRowView
struct UESummaryView
struct UEEditView
struct MarkSlider
struct CourseView
struct CourseItemView
struct CourseEditView

HomePage -up-> OdinVm
HomePage ..> BlocksView
HomePage ..> UEListView

BlocksView -up-> OdinVm
BlocksView ..> BlockRowView

BlockRowView -up-> BlockVm

UEListView -up-> BlockVm
UEListView ..> UESummaryView
UEListView ..> UEDetailPage

UESummaryView -up-> UnitVm
UESummaryView ..> MarkSlider

UEDetailPage -up-> UnitVm
UEDetailPage ..> CourseView
UEDetailPage ..> UEEditView

CourseView -up-> CourseVm
CourseView ..> CourseItemView
CourseItemView ..> MarkSlider

CourseItemView -up-> CourseVm

UEEditView -up-> UnitVm
UEEditView ..> CourseEditView


@enduml
```

## ViewModels

Viewmodels in Swift is composed of two main points:
- Wrapping
- Editing
- Notifications

Even if structures are heavily used and advised in Swift, viewmodels have to be classes in order to use the observable mechanism.

```plantuml
@startuml

protocol ObservableObject

struct Course
struct UCAUnit
struct Block

class OdinVm {
    + @Published blocks: [BlockVm]
}
class BlockVm
class UnitVm
class CourseVm

OdinVm .up.|> ObservableObject
BlockVm .up.|> ObservableObject
UnitVm .up.|> ObservableObject
CourseVm .up.|> ObservableObject

OdinVm --> "*" BlockVm

BlockVm --> "*" UnitVm
BlockVm --> "1" Block
Block --> "*" UCAUnit

UnitVm --> "*" CourseVm
UnitVm --> "1" UCAUnit
UCAUnit --> "*" Course
CourseVm --> "1" Course

@enduml
```

### Model wrapping

The first goal of the `Viewmodel` is to wrapped the model and all properties of the model in order to separate the `View` from the `Model` and the `Model` from the `View`.

All viewmodels must conform to the `ObservableObject` protocol. This protocol indicates that the object conforming to it, is attached to a publisher that emits nofitications just before the object has changed.

All properties in the `Viewmodel` must be mark `@Published` to benefiting from the notification system.

### Editing

The editing part will provide a copy of the actuel Viewmodel, this copy will be used by the edition view as binding property. The user will entered in edition mode with `onEditing()` method then the `copy` property will be set with a copy of the actuel model wrapped in the viewmodel. At the end of edition, the viewmodel will copy the model of the copy into himself to update its model with the new model.

The viewmodel provide a `isEditing` property to know the state of the edition.

```plantuml
@startuml

class CourseVm {
    + isEditing: Bool

    + copy: CourseVm?

    + onEditing()
    + onEdited(cancel: Bool)
}

@enduml
```

### Notifications

The notification part is to set up the `Observer/Observable` pattern. This pattern allows to send notifications to an unknown object which has subscribed to notifications.

In Swift, we will write this pattern with callbacks.

When the view updates the viewmodel by the properties, the viewmodel changes the property of the wrapped model thanks to the `didSet` of the property. After that, it will fire the `onModelChanged()` to tell to the subscribers that the model has changed.

```plantuml
@startuml

class BaseVm {
    - updatedCallbacks: [(BaseVm) -> ()]

    + addUpdatedCallback(callback: (BaseVm) -> ())
    + onModelChanged()
}

@enduml
```

# Getting Started

## Prerequisites
- iOS 13
- XCode 14.3
- iOS Simulator or iOS Device

## Installation
1. Clone the repo
   ```sh
   git clone https://codefirst.iut.uca.fr/git/florent.marques/ucaverage-ios.git
    ```
2. Open the project with XCode
3. Run the project on iOS Simulator or iOS Device
4. Enjoy your application

# Authors

- Florent Marques
    - [![Florent Marques](https://img.shields.io/badge/-flomSStaar-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/flomSStaar)
    - [![Florent Marques](https://img.shields.io/badge/-Florent%20Marques-0077B5?style=flat-square&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/florent-marques)
