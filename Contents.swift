import Cocoa

//enum TextAlignment {
//    case left
//    case right
//    case center
//    case justify
//}

// Raw value
//enum TextAlignment: Int {
//    case left
//    case right
//    case center
//    case justify
//}

enum TextAlignment: Int {
    case left = 10
    case right = 20
    case center = 30
    case justify = 40
}

//var alignment: TextAlignment = TextAlignment.left
//var alignment = TextAlignment.left
var alignment: TextAlignment = .left
alignment = .right

//if alignment == .right {
//    print("We should right-align the text!")
//}

switch alignment {
case .right:
    print("right aligned")
case .left:
    print("left aligned")
case .center:
    print("center aligned")
case .justify:
    print("justified")
}

TextAlignment.left.rawValue
TextAlignment.right.rawValue
TextAlignment.center.rawValue
TextAlignment.justify.rawValue

alignment.rawValue

let myRawValue = 20
let myAlignment = TextAlignment(rawValue: myRawValue)

if let myAlignment {
    print("Successfully created \(myAlignment) from \(myRawValue)")
} else {
    print("\(myRawValue) has no corresponding TextAlignment case")
}

//enum ProgrammingLanguage: String {
//    case swift = "swift"
//    case objectiveC = "objective-c"
//    case c = "c"
//    case cpp = "cpp"
//    case java = "java"
//    case ruby = "ruby"
//    case python = "python"
//}

enum ProgrammingLanguage: String, CaseIterable {
    case swift
    case objectiveC = "objective-c"
    case c
    case cpp = "c++"
    case java
    case ruby
    case python
}

let programmingLanguages = ProgrammingLanguage.allCases.map(\.rawValue)
print(programmingLanguages)

let myFavoriteLanguage: ProgrammingLanguage = .swift
print("My favorite programming language is \(myFavoriteLanguage)") // My favorite programming language is swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)") // My favorite programming language is swift

let myGoodOldFriend: ProgrammingLanguage = .objectiveC
print("My good old friend programming language is \(myGoodOldFriend)") // My good old friend programming language is objectiveC
print("My good old friend programming language is \(myGoodOldFriend.rawValue)") // My good old friend programming language is objective-c

enum LightBulb {
    case on, off
    
//    func surfaceTemperature(forAmbientTemperature ambient: Double, self: Self) -> Double {
//        switch self {
//        case .on:
//            return ambient + 150.0
//        case .off:
//            return ambient
//        }
//    }
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double { // self argument is added by the compiler
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var bulb = LightBulb.on
let ambientTemperature = 77.0

//var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature, self: bulb) // if called with explicit self
var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("The bulb's temperature is \(bulbTemperature)")

bulb.toggle()

bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("The bulb's temperature is \(bulbTemperature)")

enum ShapeDimensions {
    case point
    case square(side: Double)
    case rectangle(width: Double, height: Double)
}

extension ShapeDimensions {
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * 4
        case let .rectangle(width: w, height: h):
            return (w * 2) + (h * 2)
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape: ShapeDimensions = .rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.point

print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")

print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's perimeter = \(rectShape.perimeter())")
print("point's perimeter = \(pointShape.perimeter())")

// indirect uses pointers under the hood to avoid recursiveness
//indirect enum FamilyTree {
//    case noKnownParents
//    case oneKnownParents(name: String, ancestors: FamilyTree)
//    case twoKnownParents(fatherName: String,
//                         paternalAncestors: FamilyTree,
//                         motherName: String,
//                         maternalAncestors: FamilyTree)
//}

enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParents(name: String, ancestors: FamilyTree)
    indirect case twoKnownParents(fatherName: String,
                         paternalAncestors: FamilyTree,
                         motherName: String,
                         maternalAncestors: FamilyTree)
}
