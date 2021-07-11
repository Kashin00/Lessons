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
    func pizzaInfo()
}

class PepperoniPizza: Pizza {
    func pizzaInfo() {
        print("Pizza with pepperoni")
    }
}

class CheesePizza: Pizza {
    func pizzaInfo() {
        print("Pizza with cheese")
    }
}

class Factory {
        
    static func createPizza(with ingrediend: TypeOfPizza) -> Pizza {
        
        switch ingrediend {
        case .cheese:
            return CheesePizza()
        case .pepperoni:
            return PepperoniPizza()
        }
    }
}
    
let visitir = Factory.createPizza(with: .cheese)
/*:
---
#### Задание 2
- Предположим, твой модуль связан с продажей средств передвижения.  От типа (велосипед, автомобиль,  электоро - самокат, скутер, мотоцикл) конкретного средства зависит его отображение. Помимо этого,  все средства передвижения различаются состоянием (новое и б/y), типом потребляемого топлива (не потребляет, бензин, электричество) и максимальным количеством людей, которые могут перевести. Напиши код, который будет создавать объекты средств передвижения  с учетом его характеристик.
 - Note: 👆 _Используй абстрактую фабрику_
*/

// Добавь код сюда:

protocol Vehicle {
    
    var condition: String {get}
    var fuel: String {get}
    var maxPeople: Int {get}
    func printDescription()
}

class Bycicle: Vehicle {
    var condition: String = "new"
    
    var fuel: String = "no one"
    
    var maxPeople: Int = 1
    
    func printDescription() {
        print("condition:", condition, "\n", "fuel:", fuel, "\n", "maxPeople:", maxPeople)
    }
}

class Car: Vehicle {
    var condition: String = "new"
    
    var fuel: String = "petrol"
    
    var maxPeople: Int = 5
    
    func printDescription() {
        print("condition:", condition, "\n", "fuel:", fuel, "\n", "maxPeople:", maxPeople)
    }
}
class Scooter: Vehicle {
    var condition: String = "new"
    
    var fuel: String = "petrol"
    
    var maxPeople: Int = 2
    
    func printDescription() {
        print("condition:", condition, "\n", "fuel:", fuel, "\n", "maxPeople:", maxPeople)
    }
}

class ElectricScooter: Vehicle {
    var condition: String = "new"
    
    var fuel: String = "electricity"
    
    var maxPeople: Int = 2
    
    func printDescription() {
        print("condition:", condition, "\n", "fuel:", fuel, "\n", "maxPeople:", maxPeople)
    }
}

class Bike: Vehicle {
    var condition: String = "new"
    
    var fuel: String = "petrol"
    
    var maxPeople: Int = 2
    
    func printDescription() {
        print("condition:", condition, "\n", "fuel:", fuel, "\n", "maxPeople:", maxPeople)
    }
}

class UsedBike: Bike {
    
    override init() {
        super.init()
        self.condition = "used"
    }
}
class UsedCar: Car {
    override init() {
        super.init()
        self.condition = "used"
    }
}
class UsedScooter: Scooter {
    override init() {
        super.init()
        self.condition = "used"
    }
}
class UsedElectricScooter: ElectricScooter {
    override init() {
        super.init()
        self.condition = "used"
    }
}

class UsedBycicle: Bycicle {
    override init() {
        super.init()
        self.condition = "used"
    }
}


protocol AbstractFactory {
    
    func createBycicle() -> Vehicle
    func createBike() -> Vehicle
    func createCar() -> Vehicle
    func createScooter() -> Vehicle
    func createElectricScooter() -> Vehicle
}

class NewVehicle: AbstractFactory {
    func createBycicle() -> Vehicle {
        return Bycicle()
    }
    
    func createBike() -> Vehicle {
        return Bike()
    }
    
    func createCar() -> Vehicle {
        return Car()
    }
    
    func createScooter() -> Vehicle {
        return Scooter()
    }
    
    func createElectricScooter() -> Vehicle {
        return ElectricScooter()
    }
}

class UsedVehicle: AbstractFactory {
    func createBycicle() -> Vehicle {
        return UsedBycicle()
    }
    
    func createBike() -> Vehicle {
        return UsedBike()
    }
    
    func createCar() -> Vehicle {
        return UsedCar()
    }
    
    func createScooter() -> Vehicle {
        return UsedScooter()
    }
    
    func createElectricScooter() -> Vehicle {
        return UsedElectricScooter()
    }
}
/*:
---
#### Задание 3
- Предположим, твой модуль связан с созданием автомобиля. Автомобиль - это очень сложный обьект, так как машины  могут отличаться типом двигателя, количеством сидений, могут иметь или не иметь GPS и системы навигаций, кроме того автомобили могут быть городскими, спортивными и внедорожниками. Реализуй систему, которая будет  поэтапно конструировать  автомобиль (устанавливать  сидения,  двигатель, красить кузов  и так далее).
 - Note: 👆 _Используй паттерн строитель_
*/

// Добавь код сюда:


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
    
     func tellDate()  {
        print("25 يناير")
    }
}

class Adaptee {
    
    func converDate() {
        print("25 января")
    }
}

class DateAdapter: Date {
    
    let adaptee: Adaptee
    
    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    override func tellDate() {
        adaptee.converDate()
    }
    
}

 var date = Date()
date.tellDate()
var dataAdapter = DateAdapter(adaptee: Adaptee())
dataAdapter.tellDate()
/*:
---
#### Задание 6
- Предположим, твой модуль представляет собой некий конвеер, который обрабатывает  различные предметы, которые на него попадают. На данный момент есть возможность переработать следующие типы предметов: пищевые отходы, электронику, бумагу и стекло. Для каждого типа предмета в системе должен быть предусмотрен свой обработчик, который принимает на вход предмет, сканирует его и определяет возможность переработки. Если этот предмет того типа, который он "умеет" обрабатывать, то он выполняет обработку, если нет, то передает следующему обработчику. Если же никто из обработчиков не смог переработать предмет, то предмет должен в конечном итоге попасть "в руки"  обьекту "Склад", который дальше уже не передает предмет, а ставит на нем специальный маркер.
 - Note: 👆 _Используй паттерн цепочка обязанностей_
*/
// Добавь код сюда:

protocol HandlerProtocol: class {
    
    var nextHandler: HandlerProtocol? { get set }
    func setNext(handler: HandlerProtocol) -> HandlerProtocol
    func handle(request: String) -> String?
}

extension HandlerProtocol {
    
    func setNext(handler: HandlerProtocol) -> HandlerProtocol {
        nextHandler = handler
        return handler
    }
}
class FoodHandler: HandlerProtocol {
    var nextHandler: HandlerProtocol?
    

    
    func handle(request: String) -> String? {
        if request == "food waste" {
            
            return "Food handler handeled \(request)"
        } else {
            
            return nextHandler?.handle(request: request)
        }
    }
}

class PaperHandler: HandlerProtocol {
    var nextHandler: HandlerProtocol?
    
    func handle(request: String) -> String? {
        if request == "paper" {
            
            return "Paper handler handeled \(request)"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class GlassHandler: HandlerProtocol {
    var nextHandler: HandlerProtocol?
    
    func handle(request: String) -> String? {
        if request == "glass" {
            
            return "Glass handler handeled \(request)"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class ElectricHandler: HandlerProtocol {
    var nextHandler: HandlerProtocol?
    
    func handle(request: String) -> String? {
        if request == "electric" {
            
            return "Electric handler handeled \(request)"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}
var wareHouse = [String]()

class Recycle {
    
    static func handle(with handler: HandlerProtocol) {
        
        let request = ["paper", "glass"]
        
        request.forEach {
            
            guard let result = handler.handle(request: $0) else {
                wareHouse.append($0)
                return
            }
            
            print(result)
        }
    }
}

let foodHandler = FoodHandler()
let glassHandler = GlassHandler()
let paperHandler = PaperHandler()
let electricHandler = ElectricHandler()

foodHandler.setNext(handler: glassHandler).setNext(handler: paperHandler).setNext(handler: electricHandler)

Recycle.handle(with: foodHandler)


/*:
---
#### Задание 7
 - Предположим, твой модуль представляет системное меню. Разработай систему, которая обрабатывает нажатия на пункты меню с учетом версии ПО.
 - Note: 👆 _Используй паттерн команда_
*/

// Добавь код сюда:
    

//: [Назад:  Универсальные шаблоны](@previous)  |  Страница 14] 



