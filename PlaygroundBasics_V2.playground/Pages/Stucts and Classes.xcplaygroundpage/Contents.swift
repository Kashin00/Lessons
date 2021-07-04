import Foundation
/*:
# Структуры и классы

В этом разделе ты узнаешь:
- что такое структуры и классы, чем они отличаются
- что такое свойства и методы
- что такое наследование классов и расширение классов и структур
- что такое инициализация и деинициализация

Внимательно изучи:
- [Структуры и классы](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#)
- [Свойства](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [Методы](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
- [Наследование](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Инициализация](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
- [Деинициализация](https://docs.swift.org/swift-book/LanguageGuide/Deinitialization.html)
- [Расширения](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)

Закрепи пройденный материал:
#### Задание 1
 - Объяви структуру _Point_, которая будет содержать два  свойства _x_ и _y_ типа `Double`.
 */

// Добавь код сюда:
struct Point {
    
    var x: Double
    var y: Double
}
/*:
 - Создай экземпляр структуры `Point` c именем _point_ (значения  для _x_ и _y_ задай на свое усмотрение).
 */
// Добавь код сюда:
var point = Point(x: 1, y: 1)
/*:
 - Выведи в консоль значения для _x_ и _y_.
 */
// Добавь код сюда:
print(point.x)
print(point.y)
/*:
 - Измени значения _x_ и _y_. Выведи новые значение в консоль.
 */
// Добавь код сюда:
point.x = 0
point.y = 0
print(point.x)
print(point.y)
/*:
---
#### Задание 2
- Объяви структуру _Line_, которая будет иметь два  свойства _p1_ и _p2_ типа `Point`.
 - Добавь метод _length_ в структуру, который будет возвращать длину отрезка типа `Double`.
 - Note: 👆 _Для вычисления длины используй следующую формулу:_\
  ![Length](Playground.Length.png)
 */
// Добавь код сюда:

struct Line {
    
    var p1: Point
    var p2: Point
    
    func length() -> Double{
        let firstPoint = p2.x - p1.x
        let firstPointPow = pow(firstPoint, 2)

        let secondStep = p2.y - p1.y
        let secondStepPow = pow(secondStep, 2)
        
        let sum = firstPointPow + secondStepPow
        
        let result = sqrt(sum)
        print(result)
        return result

       
    }
}


/*:
 - Создай экземпляр структуры  `Line` c именем _line_ (значения  для _p1_ и _p2_ задай на свое усмотрение).
 - Выведи в консоль длину линии _line_.
 */
// Добавь код сюда:
var pointA = Point(x: 2.0, y: 3.0)
var pointB = Point(x: 5.0, y: 6.0)
var line = Line(p1: pointA, p2: pointB)
line.length()

/*:
---
#### Задание 3
 - Объяви класс _Weather_, который будет иметь два свойства _windSpeed_ и _chanceOfRain_ типа `Int`.
 */

/*:
 - У класса должен быть обязательный инициализатор, который принимает значения скорости ветра (_windSpeed_) и шанс дождя (_chanceOfRain_)
 */
// Добавь код сюда:
class Weather {
    var windSpeed: Int
    var chanceOfRain: Int
    
    required init(windSpeed: Int, chanceOfRain: Int) {
        
        self.chanceOfRain = chanceOfRain
        self.windSpeed = windSpeed
    }
}
/*:
 - Добавь в класс функцию _isDayForWalk_. Если скорость ветра (_windSpeed_) меньше 5 метров и шанс дождя (_chanceOfRain_) меньше 30 процентов, то функция должна вернуть _true_,  иначе  - _false_.
 */
// Добавь код сюда:
extension Weather {
    
    func isDayForWalk() -> Bool {
        
        if windSpeed < 5 && chanceOfRain < 30 {
            
            return true
        } else {
            
            return false
        }
    }
}
/*:
 - Создай экземпляр класса и выведи в консоль удачный ли сегодня день для прогулок 😉.
 */
// Добавь код сюда:
let checkWeather = Weather(windSpeed: 2, chanceOfRain: 20)

if checkWeather.isDayForWalk() {
    
    print("Good weather for a walk")
}else {
    
    print("It is better to stay at home")
}
/*:
---
#### Задание 4
 - Объяви класс _Point2D_, который будет иметь два свойства _x_ и _y_ типа `Double`. Свойства должны быть инициализированными 0 по умолчанию.
 */
// Добавь код сюда:
class Point2D {
    
    var x: Double = 0.0
    var y: Double = 0.0

/*:
 - Добавь в класс `Point2D`, метод  _reset_, который будет устанавливать координаты _x_ и _y_ в 0.
*/
// Добавь код сюда:
    
    func reset() {
        x = 0
        y = 0
    }


/*:
 - Добавь инициализатор в класс `Point2D`, который в качестве параметров будет принимать значения для координат _x_ и _y_.
 */
// Добавь код сюда:


    
     init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}
/*:
- Объяви класс _Point3D_, который будет дочерним классом по отношению к классу `Point2D`. Добавь в него свойство _z_, которое будет проинициализировано по умолчанию нулем.
 */
// Добавь код сюда:
class Point3D: Point2D {
    
    var z: Double = 0

/*:
 - Добавь инициализатор, который будет в качестве параметров принимать значения для координат _x_, _y_ и _z_.
 - Note: 👆 _Используй механизм переопределения методов._
 */
// Добавь код сюда:
    
       init(x: Double, y: Double, z: Double) {
        super.init(x: x, y: y)
        self.z = z
    }
    
    override func reset() {
        super.reset()
        z = 0
    }
}
/*:
 - Создай экземпляр класса `Point3D` с именем _point3D_.
 */
// Добавь код сюда:
var point3D = Point3D(x: 1, y: 2, z: 2)
/*:
 - Сделай так, чтобы при вызове метода _reset_, также сбрасывалась в ноль и координата _z_.
 - Note: 👆 _Используй механизм переопределения методов._
 */

// Добавь код сюда:



/*:
---
#### Задание 5
 - Реализуй иерархию классов, представленной на рисунке:

 ![Telephone inheritance](Playground.TelephoneInheritance.png)
 */
// Добавь код сюда:
class Telephone {
    func makeCall() { }
    func hangUp() { }
}

class Landline: Telephone { }
class Rotary: Landline {
    func rotaryInput() { }
}
class PushButton: Landline {
    func buttonInput() { }
}

class Cellular: Telephone {
    func sendSMS() { }
}

class Smart: Cellular {
    func touchInput() { }
    func accessInternet() { }
}

class NonSmart: Cellular {
    func buttonInput() { }
}

class iPhone: Smart {
    func ios() { }
}

class Android: Smart {
    func androidIOS() { }
}

class Windows: Smart {
    func windowsOS() { }
}

/*:
---
#### Задание 6
 - Приведи пример структуры, имеющей одно приватное свойства, которое инициализируется при помощи замыкания.
*/
// Добавь код сюда:
struct SomeStruct {
    
    private var value: Int = {
        
        return 10
    }()
}

var z = SomeStruct()
//: [Назад: Коллекции. Словари](@previous)  |  Страница 10  |  [Вперед: Протоколы](@next)
