//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

protocol Polygon {
    var name: String { get }
    var sides: Int { get }
    func perimeter() -> Float
    func area() -> Float
}

//Protocol in place
class Triangle:Polygon {
    var a: Float
    var b: Float
    var c: Float
    var name: String = "Da Triangle"
    var sides: Int = 3
    //constructor
    init(a: Float, b:Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    func perimeter() -> Float {
        return a+b+c
    }
    
    func area() -> Float {
        //Need da Equation!!
        let sp = (a+b+c)/2
        let area = sqrtf(sp*(sp-a)*(sp-b)*(sp-c)) //Equation from Propane, not sure how it works it just do
        return area
    }
}

class Square:Polygon {
    var a: Float
    var name: String = "Da Square"
    var sides: Int = 4
    init(a: Float) {
        self.a = a
    }
    
    func perimeter() -> Float {
        return a*4
    }
    
    func area() -> Float {
        return a*a
    }
}

class Rectangle:Polygon {
    var a: Float
    var b: Float
    var name: String = "Da Rectangle"
    var sides: Int = 4
    init(a: Float, b: Float) {
        self.a = a
        self.b = b
    }
    
    func perimeter() -> Float {
        return 2*(a+b)
    }
    func area() -> Float {
        return a*b
    }
}

//Create all instances of shapes and sets values
func makeShapes() -> [Polygon]{
    let p1 = Triangle(a:3,b:4,c:5)
    let p2 = Triangle(a:6,b:8,c:10)
    let p3 = Square(a: 15)
    let p4 = Square(a: 25)
    let p5 = Rectangle(a:20,b:13)
    let p6 = Rectangle(a:17,b:50)
    
    return [p1,p2,p3,p4,p5,p6]
}

let shapes = makeShapes()

func draw (shape: Polygon) {
    print("\(shape.name) has \(shape.sides) sides. Perimeter is \(shape.perimeter().description) inches. Area is \(shape.area().description) inches squared.")
}

shapes.forEach { shape in
    draw(shape: shape)
}
