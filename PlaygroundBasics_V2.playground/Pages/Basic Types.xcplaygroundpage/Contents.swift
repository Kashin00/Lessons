import Foundation
/*:
# Типы данных

В этом разделе ты узнаешь:
- что такое константы и переменные
- для чего нужны базовые оператор
- почему Swift считается строготипизированным языком программирования
- разберешься чем типы для целых чисел отчиличаются от типов для чисел с плавающей точкой
- что такое логический тип и как он представлен в Swift
- какие бывают строковые типы
- как делать преобразование типов
- что такое опциональны типы

Внимательно изучи:
- [Константы и переменные](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Простые типы данных](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Базовые операторы](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Строки и символы](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html)
 - 

Закрепи пройденный материал:

#### Задание 1:
 - Объяви две целочисленные однотипные переменные, при этом тип данных первой должен быть задан неявно, а второй — явно. Обеим переменным должны быть присвоены значения.
 - Поменяй значения переменных местами.
 - Выведи получившиеся значения в консоль. При этом в каждом варианте выводимых данных текстом напиши, какую переменную ты выводишь.
*/

// Добавь код сюда:
var firstVariable = 1
var secondVariable: Int = 2

swap(&firstVariable, &secondVariable)

print("first variable = \(firstVariable)")
print("second variable = \(secondVariable)")

/*:
---
### Задание 2:
 - Объяви три параметра. Первый из них должен быть константой типа `Float` с произвольным числовым значением, второй — пустой константой типа `Float`, третий — пустой переменной типа `Double`.
 - Установи новое произвольное значение всем параметрам, для которых эта операция возможна.
*/
// Добавь код сюда:
let firstConst = 3.14159
let secondConst: Float
var firstDoubleVariable: Double
secondConst = 3.14
firstDoubleVariable = 1.1

/*:
---
#### Задание 3:
 - Объяви три пустые константы: одну типа `Int`, одну типа `Float` и одну типа `Double`.
 - Проинициализируй их следующими значениями: для `Int` значение 18, для `Float` — 16.4,  для `Double` — 5.7.
 - Найди сумму всех трех констант и запишите ее в переменную типа `Float`. Результат выведи в консоль.
*/
// Добавь код сюда:
let firstIntConst: Int
let secondFloatConst: Float
let thirdDoubleConst: Double
firstIntConst = 18
secondFloatConst = 16.4
thirdDoubleConst = 5.7

var rezultOfSum = Float(firstIntConst) + secondFloatConst + Float(thirdDoubleConst)
print(rezultOfSum)

/*:
- Найди произведение всех трех констант и запиши его в переменную типа `Int`. Результат выведи в консоль.
 - Note: 👆 _Помни, что тебе необходимо получить результат с минимальной погрешностью._
*/
// Добавь код сюда:
var composition = firstIntConst * Int(secondFloatConst) + Int(thirdDoubleConst)
print(composition)
/*:
- Найди остаток от деления константы типа `Float` на константу типа `Double` и запиши ее в переменную типа `Double`. Результат выведи в консоль.
*/
// Добавь код сюда:
var dividing: Double = Double(secondFloatConst).truncatingRemainder(dividingBy: thirdDoubleConst)
print(dividing)
/*:
---
#### Задание 4:
 - Объяви переменную типа `String` и запиши в нее произвольный строковый литерал.
 - Объяви две переменные типа `Int` и запиши в них произвольные значения.
 - Одним выражением объедини в строковый литерал переменную типа `String` и сумму переменных типа `Int`, а результат запиши в новую константу.
 - Выведи в консоль результат.
 */
// Добавь код сюда:
var someString = "Hello"
var someIntValue = 1
var oneMoreIntValue = 2
let sumConst = someString + " \(someIntValue + oneMoreIntValue)"
print(sumConst)
/*:
---
#### Задание 5:
 - Объяви две логические переменные. Значение первой должно быть равно _true_, второй — _false_.
 - Запиши в две константы результат использования их в качестве операндов для операторов логического `И` или `ИЛИ`.
 - Выведи на консоль значения обеих получившихся констант.

 */
// Добавь код сюда:
var firstBool = true
var secondBool = false
let andCont = firstBool && secondBool
let orCont = firstBool || secondBool

print(andCont)
print(orCont)
/*:
---
#### Задание 6:
 - Напиши при помощи строк свое имя, фамилию и дату рождения.
 - Собери эти строки в одну и выведи в консоль получившееся значение.
 - Выведи на консоль значения обеих получившихся констант.

 */
// Добавь код сюда:
let name = "Matvey Kashin"
let birthday = "16.03.2003"
let myInfo = name + " " + birthday
print(myInfo)
print(name, myInfo)
/*:
---
## Продвинутый уровень:

#### Задание 7:
 - Создай 5 строк с названием стран.
 - Если в названии страны встречается буква А, выведи ее нзавание в консоль.
*/
// Добавь код сюда:
let ukraine = "Ukraine"
let armenia = "Armenia"
let argentina = "Argentina"
let africa = "Africa"
let poland = "Poland"

let countyArray = [ukraine, armenia, argentina, africa, poland]
countyArray.forEach{
    
if $0.contains("A") || $0.contains("a") {
        print($0)
    }
}
/*:
---
#### Задание 8:
 - Создай строку — набор букв кириллицей. Буквы абсолютно любые, но строчные.
 - Замени их, создав отдельную переменную, на заглавные. А потом на строчные латинские.
 - Посчитай индекс,  под которым находится каждая отдельно взятая буква.
 - Выведи его консоль.
*/
// Добавь код сюда:
var someLitters = "авбгд"
var uppercasedLitters = someLitters.uppercased()


for (index, value) in someLitters.enumerated() {
    
    print("index = \(index), litter = \(value)")
}

/*:
---
#### Задание 9:
 - Создай строку — набор букв кириллицей. Буквы абсолютно любые, но строчные.
 - Замени их, создав отдельную переменную, на заглавные. А потом на строчные латинские.
 - Посчитай индекс,  под которым находится каждая отдельно взятая буква.
 - Выведи его консоль.
*/
// Добавь код сюда:

//: [Назад: Playground](@previous)  |  Страница 3  |  [Вперед: Коллекции. Массивы и множества](@next)
