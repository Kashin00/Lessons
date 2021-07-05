import Foundation
/*:
 # Делегаты

 Делегирование - это шаблон, который позволяет классу или структуре передавать (или делегировать) некоторую ответственность экземпляру другого типа. Этот шаблон реализуется определением протокола, который инкапсулирует делегируемые полномочия, таким образом, что соответствующий протоколу тип (делегат) гарантировано получит функциональность, которая была ему делегирована. Делегирование может быть использовано для ответа на конкретное действие или для получения данных из внешнего источника без необходимости знания типа источника.
 */
/*:
 Более подробно ты можешь прочитать [тут.](https://docs.google.com/document/d/1ZRHiPgmIqsOQIihG8Ad0WPgyajWR2zKux-EKt0pYQwQ/edit?usp=sharing)
 */

/*:
 ---
 ## Задание 1
 
 Ты завел будильник и после того как он зазвонит, тебе надо его выключить. Напиши программный код. Схематически это выглядит так:\
  ![Delegate.Task1](Playground.Delegate.Task1.png)
 */

// Добавь код сюда:
class User {
    
    func wakeUp() {
        
        let alarm = AlarmClock()
        alarm.delegate = self
        alarm.turnOn()
    }
}

protocol AlarmDelegate: AnyObject {
    
    func getUp()
}

extension User: AlarmDelegate {
    
    func getUp() {
        print("User: So, I have to get up")
    }
}

class AlarmClock {
    
    weak var delegate: AlarmDelegate?
    
    func turnOn() {
        
        print("Alarm Clock: The alarm is on")
        delegate?.getUp()
    }
}

let user = User()
user.wakeUp()
/*:
---
## Задание 2

Ты решил сделать ремонт у себя в комнате и  нанял строителя. После того как строитель выполнит подготовительные работы, он должен позвонить тебе с определенным вопросом. Получив от тебя ответ на вопрос, строитель продолжит свою работу. Через некоторое время он позвонит тебе еще раз и сообщит, что закончил ремонт. Опиши эту ситуацию программно. Схематически это выглядит так:\
![Delegate.Task2](Playground.Delegate.Task2.png)
*/
// Добавь код сюда:
class Me {
    
    func repairs() {
        
        let builder = Builder()
        builder.delegate = self
        builder.createPreparationWork()
        builder.choiceColor()
        builder.painting()
        builder.end()
    }
}


protocol Builderable: AnyObject {
    
    var color: String { get }
    
    func preparationWork()
    func colorSelection()
    func painting()
    func end()
    
}

extension Me: Builderable {
    var color: String {
     
        return "white"
    }
    
    func preparationWork() {}
    
    func colorSelection() {
        
        print("User: I prefer \(color) color")
    }
    
    func painting() {}
    
    func end() {}
}

class Builder {
    
    weak var delegate: Builderable?
    
    func createPreparationWork() {
        
        print("Builder: Creating preparation work")
        delegate?.preparationWork()
    }
    
    func choiceColor() {
        
        print("Builder: What color do you prefer?")
        delegate?.colorSelection()
    }
    
    func painting() {
        
        print("Builder: Painting....")
        delegate?.painting()
    }
    
    func end() {
        
        print("Builder: Renovation completed!")
        delegate?.end()
    }
}

let me = Me()
me.repairs()
//: [Назад: Протоколы](@previous)  |  Страница 12]  [Вперед:  Универсальные шаблоны](@next)
