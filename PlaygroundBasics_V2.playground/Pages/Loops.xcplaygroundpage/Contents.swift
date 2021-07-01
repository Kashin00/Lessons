import Foundation

/*:
# Управление потоком

В этом разределе ты узнаешь:
- что такое управление потоком
- для чего нужны циклы

  `while` _condition_ {\
    _statements_\
   }

  `repeat` {\
    _statements_\
    } _while_ condition


  `for` _value_ `in` _range_ {\
    _statements_\
    }

- что такое условные инструкции
- какие бывают операторы передачи управления
- как проверить доступность API

 Внимательно изучи:
- [Управление потоком](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Цикл For in](https://www.avanderlee.com/swift/loops-swift/)
- [Циклы for, while, repeat](https://www.avanderlee.com/swift/loops-swift/)
- [For each](https://developer.apple.com/documentation/swift/array/1689783-foreach)
- [Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html)
- [Conditional Statements](https://learnappmaking.com/swift-conditionals-if-statement-how-to/)
- [Доступность API](https://www.hackingwithswift.com/example-code/language/how-to-use-available-to-check-for-api-availability)

Закрепи пройденный материал:

#### Задание 1
 - Обьяви переменную `n` и проинициализируй ее  любым целочисленными значением.
*/
// Добавь код сюда:
var n = 5
/*:
 - Напиши код, который выведет в консоль фразу _I like Swift!_ `n` раз.
 
 - Note: 👆 _Для решения используй циклы_ `for` _или_ `while`
*/
/*:
 
 - Example: 😉
_Input:_\
var n = 3\
_Output:_\
 I like Swift!\
 I like Swift!\
 I like Swift!
 */

// Добавь код сюда:
for _ in 1...n {
    print("I like Swift!")
}
/*:
---
#### Задание 2
 
 - Выведи в консоль первые `n` квадратов чисел (_квадрат - произведение числа на себя, например 4 = 2 * 2_).
 
 - Example: 😉
_Input:_\
n = 5\
 _Output_:\
 1\
 4\
 9\
 16\
 25
*/
// Добавь код сюда:
for i in 1...n {
    print(i * i)
}
/*:
 - Выведи в консоль степени числа `2`, которые меньше или равны `n`.
 
 - Example: 😉
 _Input:_\
n = 100\
 _Output:_\
 2\
 4\
 8\
 16\
 32\
 64
 */
 // Добавь код сюда:
var power = 0
while power <= n {
    print(pow(2,power))
    power += 1
}


/*:
 - Нарисуй в консоли квадрат из `n` на `n` звездочек (⭐)
 - Example: 😉
 _Input:_\
n = 4\
 _Output:_\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐
 
 */
// Добавь код сюда:
var index = 0
var arrayOfString = [String]()
var someStr = ""

repeat {
    for _ in 0...n {
        someStr.append("*")
    }
    arrayOfString.append(someStr)
    someStr = ""
    index += 1
} while index < n

arrayOfString.forEach { print($0) }

/*:
 - Нарисуй в консоли треугольник из `n` звездочек (⭐)
 - Example: 😉
 _Input:_\
n = 4\
 _Output:_\
 ⭐\
 ⭐⭐\
 ⭐⭐⭐\
 ⭐⭐⭐⭐
 */
// Добавь код сюда:

var iterator = 0
var ar = [String]()
var str = ""

repeat {
    str.append("*")
    ar.append(str)
    iterator += 1
} while iterator < n

ar.forEach { print($0) }

/*:
---
#### Задание 3:
 - Создай массив из 20-30 значений любого типа.
 - Сделай линейную сортировку (linear sort).
 - Сделайте сортировку пузырьком (bubble sort).
 - Сделайте быструю сортировку  (quick sort).
*/
// Добавь код сюда:
var array = [1,2,4,5,8,6,45,23,432,23,6,34,12,21,65,42,97,67,3,7,9]

//пузырьковая

func bubbleSort(_ arr: [Int]) -> [Int] {
    
    var array = arr
    
    for _ in 0..<array.count - 1 {
        
        for j in 0..<array.count - 1 {
            
            if array[j] > array[j + 1] {
                
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
            
        }
        
    }
    return array
}


//быстрая

func quicksortNaive(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
      return array
    }
    let pivot = array[array.count / 2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    return quicksortNaive(less) + equal + quicksortNaive(greater)
  }

// линейная
for index in 1..<array.count {
    var jIndex = index - 1
    let value = array[index]

    while jIndex >= 0 && value < array[jIndex] {
        array[jIndex + 1] = array[jIndex]
        jIndex -= 1
    }
    array[jIndex + 1] = value
}
print(array)
/*:
---
### Продвинутый уровень:

#### Задание 4:
 - Создай 10 строковых переменных с названиями стран. Объяви массив, элементами которого будут строки.
 - Проверь строки: если в строке более 5 символов — добавь её в массив. Но если строка содержит букву А - замени эту букву на другую и добавь изменённую строку в массив.
 - Выведи в консоль полученный массив.
*/
// Добавь код сюда:
var countryArray = [String]()

func checkString(_ string: String) {
    
    var string = string
    
    if string.count > 5 && !string.contains("A") {
        countryArray.append(string)
    }else if string.contains("A") {
        for (index, item) in string.enumerated() {
             
            if item == "A" {
                
                string.remove(at: string.index(string.startIndex, offsetBy: index))
                string.insert("B", at: string.index(string.startIndex, offsetBy: index))
                countryArray.append(string)
            }
        }
    }
}

var ukraine = "Ukraine"
var albania = "lbAnia"
var poland = "Poland"
var argentina = "Argentina"
var czech = "Czech"
var slovakia = "Slovakia"
var austria = "Austria"
var germany = "Germany"
var greenland = "greenland"
var canada = "Canada"

checkString(ukraine)
checkString(albania)
checkString(poland)
checkString(argentina)
checkString(czech)
checkString(slovakia)
checkString(austria)
checkString(germany)
checkString(greenland)
checkString(canada)


print(countryArray)
/*:
---
#### Задание 5:
 - Создай строковую константу word и проинициализируй ее любым словом.
 - Выведи в консоль True, если строка является изограммой и false, если нет
*/
/*:
- Note: 👆 _Изограмма - это слово или фраза, в которой нет повторяющихся букв_\
*/
/*:
- Example: 😉\
_Input:_\
let word ="Password"\
_Output:_\
false
*/
/*:
- Example: 😉\
_Input:_\
let word ="Algorism"\
_Output:_\
 True
*/
// Добавь код сюда:
let word = "constant"

/*:
---
#### Задание 5:
 - Создай строковую константу word и проинициализируй ее любым значением.
 - Повтори в новой строке каждую букву исходной по 3 раза.
 - Полученный результат выведи в консоль.
 */
/*:
- Example: 😉\
_Input:_\
let word ="Hello"\
_Output:_\
 "hhheeellllllooo"
*/

// Добавь код сюда:
let wordd = "hello"
var newWordd = ""

wordd.forEach {
    for _ in 1...3 {
        newWordd += String($0)
    }
}
print(newWordd)

/*:
---
#### Задание 6:
 - Обьяви массив, состояющий из строк и целых чисел.
 - Удали из массива все строки.
 - Полученный результат выведи в консоль.
 */
/*:
- Example: 😉\
_Input:_\
let array =[1, 2, "a", "b"] \
_Output:_\
 [1, 2]
*/
// Добавь код сюда:


//: [Назад: Коллекции. Массивы и множества](@previous)  |  Страница 5  |  [Вперед:  Функции](@next)
