# UCAverage

[![Build Status](https://codefirst.iut.uca.fr/api/badges/florent.marques/ucaverage-ios/status.svg?ref=refs/heads/main)](https://codefirst.iut.uca.fr/florent.marques/ucaverage-ios)

# Overview

<img src="Documentation/images/uca_icon.png" width="100" />

This project is a calculator developed with SwiftUI that calculates your average. It allows you to display your notes in each block and each subject. A color code is in place to let you know if you have a good grade or not. You can simulate your notes by adjusting the sliders.

This project uses an MVVM architecture adapted for SwiftUI. You can find some explanation [here](#mvvm-architecture).

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

## ViewModels

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
