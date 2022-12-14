import Foundation

/// 1. Исследуйте код ниже и напишите, какие цифры должны вывестись в консоль, обьясните своими словами, почему именно такая последовательность по шагам.

func testQueue(){
    print("1")
    DispatchQueue.main.async {
        print("2")
        DispatchQueue.global(qos: .background).sync { /// #1
            print("3")
            DispatchQueue.main.sync { /// #2
                print("4")
                DispatchQueue.global(qos: .background).async { /// #2a
                    print("5")
                }
                print("6")
            }
            print("7")
        }
        print("8")
    }
    print("9")
}

print("task 1 output")
testQueue()

//output:
// 1
// 9
// 2
// 3

/// Запускаем функцию testQueue() в главном потоке - выводится 1. Затем у главной очереди запускается асинхронный блок. Асинхронно относительно главного потока будет он выполнен только после того, как завершатся вызовы в очереди - print("9")

/// Асинхронный блок

//DispatchQueue.main.async {
//    print("2")
//    DispatchQueue.global(qos: .background).sync {
//        print("3")
//        DispatchQueue.main.sync {
//            print("4")
//            DispatchQueue.global(qos: .background).async {
//                print("5")
//            }
//            print("6")
//        }
//        print("7")
//    }
//    print("8")
//}

/// После вызова асинхронного блока выполнится print("2") в начале. Далее запускается блок, выполняемый синхронно - внутри него вызывается print("3").Затем в главной очереди вызываем функцию синхронно - происходит дедлок.

//        DispatchQueue.main.sync {
//            print("4")
//            DispatchQueue.global(qos: .background).async {
//                print("5")
//            }
//            print("6")
//        }
//        print("7")
//    }
//    print("8")
//}


/// 2. Создайте свою серийную очередь и замените в примере ей DispatchQueue.main, создайте свою конкурентную очередь и заменить ей DispatchQueue.global(qos: .background). Какой будет результат? Всегда ли будет одинаковым? И почему?

let serialQueue = DispatchQueue(label: "serialQueue")
let concurrentQueue = DispatchQueue(label: "concurrentQueue", qos: .userInteractive, attributes: .concurrent)

func testQueue2(){
    print("1")
    serialQueue.async {
        print("2")
        DispatchQueue.global(qos: .background).sync {
//        concurrentQueue.sync {
            print("3")
            serialQueue.async {
                print("4")
                DispatchQueue.global(qos: .background).async {
//                concurrentQueue.async {
                    print("5")
                }
                print("6")
            }
            print("7")
        }
        print("8")
    }
    print("9")
}

print("task 2 output")
testQueue2()

/// заменить DispatchQueue.main на серийную очередь - 1 2 3 9
/// Асинхронно к главному потоку ставим задачу в другую серийную очередь, таким образом быстрее сработает тот вывод, поток для которого будет быстрее.

/// заменить DispatchQueue.global(qos: .background) на конкурентную очередь - 1 9 2 3
/// Вывод всегда будет в одинаковой последовательноси, так как кокуреная очередь отличается только приоритетом.


/// 3. Какой по номеру надо поменять sync/sync чтобы не возникало дедлока в обоих случаях
/// Необходимо помеять местами 1 и 2a ИЛИ 2 и 2a

/// 4. Как можно сделать в примере, чтобы очередь превратилась из конкурентной в серийную, подправте пример не исправляя создания самой очереди

let semaphore = DispatchSemaphore(value: 0)

func testQueue4(){
    print("1")
    DispatchQueue.main.async {
        print("2")
        semaphore.signal()
        DispatchQueue.global(qos: .background).sync {
            print("3")
            DispatchQueue.main.sync {
                print("4")
                DispatchQueue.global(qos: .background).async {
                    print("5")
                }
                print("6")
            }
            print("7")
        }
        print("8")
        semaphore.wait()
    }
    print("9")
}

print("task 4 output")
testQueue4()

/// semaphore ограничивает количество потоков, которые обращаются к очереди.
