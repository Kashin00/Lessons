import Foundation
/*:
# Паттерны проектирования

В этом разделе ты узнаешь:
- что такое паттерны, какие проблемы они решают
- какие бывают их виды и как их реализовать на языке Swift

Паттерн проектирования — это часто встречающееся решение определённой проблемы при проектировании архитектуры программ.
В отличие от готовых функций или библиотек, паттерн нельзя просто взять и скопировать в программу. Паттерн представляет собой не какой-то конкретный код, а общую концепцию решения той или иной проблемы, которую нужно будет ещё подстроить под нужды каждой программы.

Паттерны отличаются по уровню сложности, детализации и охвата проектируемой системы.

Самые низкоуровневые и простые паттерны — идиомы. Они не универсальны, поскольку применимы только в рамках одного языка программирования. Самые универсальные — архитектурные паттерны, которые можно реализовать практически на любом языке. Они нужны для проектирования всей программы, а не отдельных её элементов.
Кроме того, паттерны отличаются и предназначением.  Можно выделить три основные группы:
- порождающие (фабричный метод, абстрактная фабрика, строитель, прототип, одиночка) - беспокоятся о гибком создании объектов без внесения в программу лишних зависимостей
- стуктурные (адаптер, мост, компоновщик, декоратор, фасад, легковес, заместитель) - показывают различные способы построения связей между объектами
- поведенческие (цепочка обязанностей, команда, итератор, посредник, снимок, наблюдатель, состояние, стратегия, шаблонный метод, посетитель) - заботятся об эффективной коммуникации между объектами.

 Внимательно изучи некоторые виды паттернов:
- [Фабричный метод](https://refactoring.guru/ru/design-patterns/factory-method)
- [Абстрактная фабрика](https://refactoring.guru/ru/design-patterns/abstract-factory)
- [Строитель](https://refactoring.guru/ru/design-patterns/builder)
- [Прототип](https://refactoring.guru/ru/design-patterns/prototype)
- [Декоратор](https://refactoring.guru/ru/design-patterns/decorator)
- [Адаптер](https://refactoring.guru/ru/design-patterns/adapter)
- [Мост](https://refactoring.guru/ru/design-patterns/bridge)
- [Цепочка обязанностей](https://refactoring.guru/ru/design-patterns/chain-of-responsibility)
- [Команда](https://refactoring.guru/ru/design-patterns/command)

Закрепи пройденный материал:
#### Задание 1
- Предположим, твой модуль отвечает за производство пиццы. Напиши код, который будет реализовывать обьект создания пиццы во время выполнения программы. Например, если пользователь хочет пиццу с сыром, то твой модуль создаст обьект CheesePizza,  а если пользователь хочет пиццу с пепперони - обьект PepperoniPizza
 - Note: 👆 _Используй фабричный метод_
*/

// Добавь код сюда:
enum TypeOfPizza {

    case cheese
    case pepperoni
}

protocol Pizza {
    static func createPizza(with ingredient: TypeOfPizza)
}

class PepperoniPizza: Pizza {
    static func createPizza(with ingredient: TypeOfPizza) {
        print("Create pizza with \(ingredient)")
    }
}

class CheesePizza: Pizza {
    static func createPizza(with ingredient: TypeOfPizza) {
        print("Create pizza with \(ingredient)")
    }
}


class Visitor {
    
    let ingredient: TypeOfPizza
    
    init(ingredient: TypeOfPizza) {
        self.ingredient = ingredient
    }
}

let visitor = Visitor(ingredient: .cheese)

if visitor.ingredient == .cheese {
    let pizza = CheesePizza.createPizza(with: .cheese)
}
    else {
        let pizza = PepperoniPizza.createPizza(with: .pepperoni)
    }

/*:
---
#### Задание 2
- Предположим, твой модуль связан с продажей средств передвижения.  От типа (велосипед, автомобиль,  электоро - самокат, скутер, мотоцикл) конкретного средства зависит его отображение. Помимо этого,  все средства передвижения различаются состоянием (новое и б/y), типом потребляемого топлива (не потребляет, бензин, электричество) и максимальным количеством людей, которые могут перевести. Напиши код, который будет создавать объекты средств передвижения  с учетом его характеристик.
 - Note: 👆 _Используй абстрактую фабрику_
*/

// Добавь код сюда:
enum TypeOfTransport {
    case bicycle
    case car
    case electricScooter
    case bike
}

enum Condition {
    case new
    case secondHand
}

enum Fuel {
    case petrol
    case electricity
    case notUseOil
}

protocol Transport {
    
    var typeOfTransport: TypeOfTransport { get }
    var condition: Condition { get }
    var fuel: Fuel { get }
    var maxNumOfPeople: Int { get }
}

class TransportCreator: Transport {
    
    var typeOfTransport: TypeOfTransport
    var condition: Condition
    var fuel: Fuel
    var maxNumOfPeople: Int
    
    init(typeOfTransport: TypeOfTransport, condition: Condition, fuel: Fuel, maxNumOfPeople: Int) {
        
        self.typeOfTransport = typeOfTransport
        self.condition = condition
        self.fuel = fuel
        self.maxNumOfPeople = maxNumOfPeople
    }
}

var car = TransportCreator(typeOfTransport: .car, condition: .new, fuel: .petrol, maxNumOfPeople: 5)
/*:
---
#### Задание 3
- Предположим, твой модуль связан с созданием автомобиля. Автомобиль - это очень сложный обьект, так как машины  могут отличаться типом двигателя, количеством сидений, могут иметь или не иметь GPS и системы навигаций, кроме того автомобили могут быть городскими, спортивными и внедорожниками. Реализуй систему, которая будет  поэтапно конструировать  автомобиль (устанавливать  сидения,  двигатель, красить кузов  и так далее).
 - Note: 👆 _Используй паттерн строитель_
*/

// Добавь код сюда:
//enum Seats {
//    case sport
//    case comfort
//}
//
//enum Engine {
//    case sport
//    case city
//    case offroad
//}
//
//enum Color {
//    case white
//    case black
//    case red
//    case blue
//}
//
//enum GPS {
//    case yes
//    case no
//}
//
//protocol Builder {
//
//    var seat: Seats { get }
//    var engine: Engine { get }
//    var color: Color { get }
//    var gps: GPS { get }
//
//    func getResult()
//
//}

/*:
---
#### Задание 4
- Предположим, твой модуль связан с  работой кофейни. При добавлении нового инредиента к кофе, например, взбитые сливки, необходимо рассчитать новую стоимость продукта и получить новое описание состава напитка. Представь это в виде кода.
 - Note: 👆 _Используй паттерн декоратор_
*/

// Добавь код сюда:
protocol CoffeProtocol {
    
    func getPrice() -> Int
    func getDescription() -> String
}

class Coffe: CoffeProtocol {

    func getPrice() -> Int {
        return 60
    }
    
    func getDescription() -> String {
        return "Coffe with milk"
    }
}

class CoffeDecorator: CoffeProtocol {
 
    private var decoratorType: CoffeProtocol

    required init(decorator: CoffeProtocol) {
        self.decoratorType = decorator
    }
    
    func getPrice() -> Int {
        return decoratorType.getPrice()
    }
    
    func getDescription() -> String {
        return decoratorType.getDescription()
    }
}

class CoffeWithCoconutMilk: CoffeDecorator {
    
    override func getPrice() -> Int {
        return super.getPrice() + 50
    }
    
    override func getDescription() -> String {
        return "Coffe with coconut milk"
    }
}

var coffe = Coffe()
var withCoconut = CoffeWithCoconutMilk(decorator: coffe)
/*:
---
#### Задание 5
- Предположим, у тебя есть некий сервис, который выводит в консоль текущую дату, но, например, на арабском  языке, который не понимает твой клиент. Сделай так, чтобы твой клиент мог использовать сервис вывода даты в консоль на понятном ему языке.
 - Note: 👆 _Используй паттерн адаптер_
*/

// Добавь код сюда:
class Date {
    
     func tellDate() {
        print("25 يناير")
    }
}

class DateAdapter: Date {
    
    override  func tellDate() {
        print("25 января")
    }
}

 var date = Date()
date.tellDate()
var dataAdapter = DateAdapter()
dataAdapter.tellDate()
/*:
---
#### Задание 6
- Предположим, твой модуль представляет собой некий конвеер, который обрабатывает  различные предметы, которые на него попадают. На данный момент есть возможность переработать следующие типы предметов: пищевые отходы, электронику, бумагу и стекло. Для каждого типа предмета в системе должен быть предусмотрен свой обработчик, который принимает на вход предмет, сканирует его и определяет возможность переработки. Если этот предмет того типа, который он "умеет" обрабатывать, то он выполняет обработку, если нет, то передает следующему обработчику. Если же никто из обработчиков не смог переработать предмет, то предмет должен в конечном итоге попасть "в руки"  обьекту "Склад", который дальше уже не передает предмет, а ставит на нем специальный маркер.
 - Note: 👆 _Используй паттерн цепочка обязанностей_
*/

// Добавь код сюда:


/*:
---
#### Задание 7
 - Предположим, твой модуль представляет системное меню. Разработай систему, которая обрабатывает нажатия на пункты меню с учетом версии ПО.
 - Note: 👆 _Используй паттерн команда_
*/

// Добавь код сюда:


//: [Назад:  Универсальные шаблоны](@previous)  |  Страница 14] 



