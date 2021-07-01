import Foundation
/*:
# Кортежи, перечисления и псевдонимы типов

В этом разделе ты узнаешь:
- что такое перечисления (`enum`)
- как производить итерацию по кейсам перечисления
- что такое ассоциативные значения
- что такое кортежи  (`tuple`)
- что такое пвсевдонимы типа (`typealias`)

Внимательно изучи:
- [Перечисления](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Кортежи](https://medium.com/swift-programming/swift-tuple-328aecff50e7)
- [Псевдонимы типов](https://www.avanderlee.com/swift/typealias-usage-swift/)

Закрепи пройденный материал:

#### Задание 1
 
 - Создай кортеж с тремя параметрами: твой любимый фильм, любимый  город и любимое блюдо. Все элементы кортежа должны быть именованы.
 - Выведи в консоль твой любимый город (данные возьми из кортежа).
 */
// Добавь код сюда:
let (film, city, dish) = ("Inglourious Basterds", "Kharkov", "Pasta")
print(city)
/*:
---
#### Задание 2

- Напиши функцию _minMax_, которая принимает в качестве параметра массив целых чисел и возвращает минимальное и максимальное из них в виде кортежа.
- Результат работы функции выведи в консоль.
 - Example: 😉\
 _Function Call:_\
 minmax([2, 3, 10, 1])\
 _Output:_\
 (1, 10)
*/

// Добавь код сюда:
func minMax(array: [Int]) -> (min: Int, max: Int) {
    
    guard array.count > 1 else {
        return (min: 0, max: 0)
    }
    let sortedArray = array.sorted(by: <)
    guard let min = sortedArray.first else {return (min: 0, max: 0)}
    guard let max = sortedArray.last else {return (min: 0, max: 0)}
    
    return (min, max)
}
let result = minMax(array: [1,2,3,4])
print(result)
/*:
---
#### Задание 3
 
 - Обьяви перечисление (`enum`) _Season_, описывающее времена года и состояющее из следующих строковых значений: _winter_, _spring_, _summer_, _autumn_.

 - Напиши функцию, которая выводит в консоль все элементы из этого перечисления.
 - Example: 😉\
 _Output:_\
 Seasons:\
 winter\
 spring\
 summer\
 autumn
 */

// Добавь код сюда:
enum Season: CaseIterable {
    
    case winter
    case spring
    case summer
    case autumn
}

func seasonsToConsole() {
    let arrayOfSeasons = Season.allCases
    arrayOfSeasons.forEach{ print($0) }
}
/*:
---
#### Задание 4
 
 - Обьяви перечисление (`enum`) _CoinType_, описывающее различные стоимости монет.
 - Note: 👆 _В качестве примера возьми следующие значения:\
 penny = 1\
 nickle = 5\
 dime = 10\
 quarter = 25_
 */
/*:
 - Обьяви массив _money_, элементами которого являются кортежи _(amount, type)_. Проинициализируй массив любыми соответствующими его типу значениями.
*/
// Добавь код сюда:
enum CoinType: Int {
    case penny = 1
    case nickle = 5
    case dime = 10
    case quarter = 25
}

var money: [(amount: Int, type: CoinType)] = [(25, .quarter), (10, .dime), (5, .nickle), (1, .penny)]
/*:
 - Выведи в консоль общую стоимость монет.
 - Example: 😉\
 _Input:_\
 var moneyArray : [(Int,CoinType)] = [(10, .penny),(15,.nickle),(3,.quarter),(20,.penny),(3,.dime),(7,.quarter)]\
 _Output:_\
 All: 385
*/
// Добавь код сюда:
print(money.reduce(0, {$0 + $1.0 }))
/*:
---
#### Задание 5
 
 - Объяви псевдоним (`typealias`) типа `String` с именем _Text_.
 */
// Добавь код сюда:
typealias Text = String
/*:
 - Объяви три константы типа `Text`. Значения двух констант должны состоять только из цифр, третьей — из цифр и букв.
 */
// Добавь код сюда:
let first: Text = "321"
let second: Text = "111"
let third: Text = "766avc"

/*:
 - Из всех трех констант найди те, которые состоят только из цифр, и выведи их в консоль.
*/
// Добавь код сюда:
let textArray = [first, second, third]
let onlyNumbersArray = textArray.compactMap { Int($0) }
print(onlyNumbersArray)
/*:
 - Создай псевдоним для типа `(numberOne: Text?, numberTwo: Text?)?` с именем _TupleType_.
  - Note: 👆 _Обрати внмиание, что данный тип является опциональным и также содержит в себе опциональные значения_
 */
// Добавь код сюда:
typealias TurpleType = (numberOne: Text?, numberTwo: Text?)?
/*:
 - Создай три переменные типа `TupleType`, содержащие следующие значения: _(“190”, “67”)_, _(“100”, nil)_, _(“-65”, “70”)_.
 - Выведите значения элементов тех кортежей, в которых ни один из элементов не инициализирован как `nil`.
 */
// Добавь код сюда:
let firstTurple: TurpleType = ("190", "67")
let secondTurple: TurpleType = ("100", nil)
let thirdTurple: TurpleType = ("-65", "70")
//: [Назад: Замыкания](@previous)  |  Страница 8  |  [Вперед: Коллекции. Словари](@next)
