import Foundation


//Implement a generic class for a Stack, Deque or Queue data structure.
//The class must contain generic methods according to the selected data structure type.
//In the Playground main space, write an example using the created class


struct Stack<Element> {
  var elements = [Element]()
  
  mutating func push(_ element: Element){
   elements.append(element)
  }
  mutating func pop()->Element?{
   if elements.count == 0{
     return nil
   }
    return elements.remove(at: elements.count-1)
  }
    
    
  func peek()->Element?{
   if elements.count == 0 {
     return nil
   }
    return elements[elements.count-1]
  }
    
    
  func isEmpty()->Bool{
    return elements.count == 0
  }
    
    
  func printElements(){
    print(elements)
 }
}



var myStack = Stack<Int>()

myStack.peek()
myStack.isEmpty()

myStack.push(111)
myStack.push(22)
myStack.push(3)

myStack.pop()

myStack.peek()

myStack.printElements()

