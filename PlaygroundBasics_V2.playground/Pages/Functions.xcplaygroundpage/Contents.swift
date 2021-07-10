import Foundation
/*:
# Функции

В этом разделе ты узнаешь:
- что такое функции
- как их обьявлять и вызывать
- что такое параметры функции и возвращаемые значения
- что такое ярылки аргументов

Внимательно изучи:
- [Функции](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#)

Закрепи пройденный материал:

#### Задание 1
 
 - Реализуй функцию _calculateMin_, которая принимает в качестве параметров  два значения типа `Int` и возвращает наименьшее из них.
 - Example: 😉\
 _Function Call:_\
 calculateMin(1,2)\
 _Output:_\
 Min: 1
 */
// Добавь код сюда:
func calculateMin(_ firstValue: Int, _ secondValue: Int) -> Int {
    if firstValue > secondValue {
        return secondValue
    } else {
        return firstValue
    }
}

/*:
---
#### Задание 2
 
 - Реализуй функцию _countDown_, которая принимает параметр `n` типа `Int`.
 - Функция должна вывести в консоль  числа от _n_ до 1 с интервалом в 1 секунду, а затем вывести в консоль слово _GO!_
 - Note: 👆 _Для задержки используй стандартную функцию sleep(1)_
 */
/*:
 - Example: 😉\
 _Function Call:_\
 coutdown(3)\
 _Output:_\
 3\
 2\
 1\
 GO!
 */

// Добавь код сюда:
func countDown(_ n: Int) {
     var counter = n
        
     while counter >= 1{
        
        sleep(1)
        print(counter)
        
        if counter == 1 {
            print("GO!")
        }
        counter -= 1
    }
        
}

/*:
---
#### Задание 3
 - Реализуй функцию _repeatPrint_, которая принимает в качестве параметров строку _s_ и целое число _n_. Функция должна напечатать строку, переданную в качестве параметра, _n_ раз.
 - Example: 😉\
 _Function Call:_\
 repeatPrint(s: "Hi, NIX", n:2)\
 _Output:_\
 Hi, NIX\
 Hi, NIX
 */
// Добавь код сюда:
func repeatPrint(_ s: String, _ n: Int) {
    var counter = n
    
    while counter > 0 {
        print(s)
        counter -= 1
    }
}
/*:
---
#### Задание 4
 - Реализуй функцию _reverse_, которая в качестве параметра принимает массив с целыми числами. Результатом работы функции должен быть массив с числами в обратном порядке.
 - Полученный массив выведи в консоль.
 - Example: 😉\
 _Function Call:_\
 reverse([1, 2, 3])\
 _Output:_\
 [3, 2, 1]
 */
// Добавь код сюда:
func reverse(array: [Int]) {
    let reversedArray = Array(array.reversed())
    print(reversedArray)
}

/*:
---
#### Задание 5
 - Реализуй функцию _factorial_, которая принимает  качестве параметра целое число _n_ и возвращает его факториал.
 - Полученный результат выведи в консоль.
 - Note: 👆 _Факториал натурального числа n - это произведение всех натуральных чисел от 1 до n включительно\
 1! = 1\
 2! = 1 * 2 = 2\
 3! = 1 * 2 * 3 = 6\
 ...\
 7! = 1 * 2 ... * 7 = 5040_
 */
/*:
 
 - Note: 👆 _Для реализации факториала используй рекурсию_
*/
/*:
 - Example: 😉\
 _Function Call:_\
 factorial(5)\
 _Output:_\
 5! = 120
 */
// Добавь код сюда:
func factorial(n: Int) -> Int {
    
    if n == 0 {
        return 1
    }
    return n * factorial(n: n - 1)
}

/*:
---
#### Задание 6
 - Напиши функцию, которая на вход принимает масссив, элементами которого являются целые, положительные числа.
 - Результатом работы функции будет массив, состоящий только  из элементов исходного массива, для которых равна количеству символов, переданных в качестве параметра.
 - Результат выведи в консоль
*/
/*:
 - Example: 😉\
 _Function Call:_\
 filterDigitLength([88, 232, 4, 9721, 555], 3)\
 _Output:_\
[232, 555]
 */
/*:
 - Example: 😉\
 _Function Call:_\
 filterDigitLength([32, 88, 74, 91, 300, 4050], 1)\
 _Output:_\
[]
 */
// Добавь код сюда:
func filterDigitLength(array: [UInt], n: Int) {
    var resultArray = [Int]()
    let mappedArray = array.map{String($0)}
    mappedArray.forEach{
        
        if $0.count == n {
            guard let value = Int($0) else { return }
            resultArray.append(value)
        }
    }
    print(resultArray)
}

/*:
---
#### Задание 7
 - Напиши функцию, которая на вход принимает массив строк, представляющий собой названия файлов, а результатом работы функции будет массив, представляющий собой список типов файлов из исходного массива.
 - Результат выведи в консоль
*/
/*:
 - Example: 😉\
 _Function Call:_\
 getExtension(["code.html", "code.css"])\
 _Output:_\
["html", "css"]
*/
/*:
 - Example: 😉\
 _Function Call:_\
 getExtension(["project1.jpg", "project1.pdf", "project1.mp3", "project2.pdf"])\
 _Output:_\
["jpg", "pdf", "mp3"]
 */
// Добавь код сюда:
func getExtension(arrayStrings: [String]) -> [String] {
    let resultArray: [String] = arrayStrings.map {
        var valueArray = $0.components(separatedBy: ".")
        valueArray.removeFirst()
        return valueArray.first ?? "...."
    }
    return resultArray
}
print(getExtension(arrayStrings: ["project1.dock", "project", "project1.mp3", "project2.pdf"]))
/*:
---
### Продвинутый уровень:
#### Задание 8:
 - Напиши функцию, которая в качестве параметра принимает массив целых положительных чисел, а возвращает сумму пропущенных чисел в переданном диапазоне.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Минимальное и максимальное значение массива - это границы числового диапазона, которые нужно использовать при поиске отсутсвующих чисел_
*/
/*:
- Example: 😉\
_Function Call:_\
sumOfMissingNumbers([1, 3, 5, 7, 10])\
_Output:_\
Sum of missing numbers = 29
*/

// Добавь код сюда:
func sumOfMissingNumbersFunc(array: [UInt]) -> UInt {

    guard var min = array.min() else { return 0 }
    guard let max = array.max() else {return 0}
    var rez: UInt = 0
    let array = array

    while max > min {

        if !array.contains(min) {
            rez += min
        }

        min += 1
    }

    return rez
}
var sumOfMissingNumbers = sumOfMissingNumbersFunc(array: [1, 3, 5, 7, 10])
print(sumOfMissingNumbers)
/*:
---
#### Задание 9:
 - Напиши функцию, которая в качестве параметра строку, а результатом работы функции будет новкя строка, представляющая собой увеличение каждого симолова на  +1.
 - Каждый набор символов отдели каким-то знаком.
 - Каждый набор символов должен начинаться с большой буквы.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Используй только буквы латинского алфавита (a-z, A-Z)_
*/
/*:
- Example: 😉\
_Function Call:_\
compoutingLetters("abcd")\
_Output:_\
"A-Bb-Cccc=Dddd"
*/
// Добавь код сюда:
func addLittersAndPrintTheResult(string: String) {
    
    var newString = ""
    let elementsArray = ["-", "=", "+"]
    
    string.forEach {
        let randomElement = arc4random_uniform(UInt32(elementsArray.count))
        newString.append($0.uppercased())
        $0.uppercased()
        newString.append($0)
        newString.append(elementsArray[Int(randomElement)])
    }
    
    newString.removeLast()
    print(newString)
}
addLittersAndPrintTheResult(string: "abcd")
/*:
---
#### Задание 10:
 - Напиши функцию, которая в качестве параметра принимает строку, а результатом работы функции будет  строка, каждое слово которой начинается с заглавной буквы.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Используй функции высшего порядка_
*/
/*:
- Example: 😉\
_Function Call:_\
makeTitile("This is a title")\
_Output:_\
This Is A Title
*/

// Добавь код сюда:
func makeUppearcasedAndPrint(_ string: String) {
    let result = string.split(separator: " ").map { $0.capitalized }.joined(separator: " ")
    print(result)
    
}

makeUppearcasedAndPrint("This is array")

/*:
---
#### Задание 11:
 - Напиши функцию, которая в качестве параметра принимает массив символов и символ для поиска.
 - Функция должна возвращать сколько раз символ встречается в массиве
 - Выведи в консоль результат работы функции.
*/
/*:
- Example: 😉\
_Function Call:_\
letterCount(["D", "E", "Y", "H", "A", "D"])\
_Output:_\
D shows 2 times
*/

// Добавь код сюда:
func charInArray(array: [String], char: String) {
    var counter = 0
    
    array.forEach{ if $0 == char { counter += 1}}
    print("\(char) shows \(counter) times")
}
/*:
---
## Задание 12:
 - Напиши функция, которая будет возвращать true, если все подмножества в массиве, принадоежат множеству, переданному в качестве параметров, а false  - в противном случае.
 - Выведи в консоль результат работы функции.
*/
/*:
- Example: 😉\
_Function Call:_\
validateSubsets([[1, 2], [2, 3], [1, 3]], [1, 2, 3])\
_Output:_\
True
*/
/*:
- Example: 😉\
_Function Call:_\
validateSubsets([[1, 2, 3, 4]], [1, 2, 3])\
_Output:_\
False
*/

// Добавь код сюда:
func validateSubsets(superset: Set<Int>, of: [Set<Int>]) -> Bool {
    
    for item in of {
        if !item.isSubset(of: superset) {
            return false
        }
    }
    return true
}

let set: [Set<Int>] = [[1, 2], [2, 3], [1, 3], [1, 2, 3]]
let superset: Set<Int> = [4,5,6]

print(validateSubsets(superset: superset, of: set))
//: [Назад: Управление потоком](@previous)  |  Страница 6  |  [Вперед: Замыкания](@next)



