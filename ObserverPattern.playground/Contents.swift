

protocol Observable {
    func register(observer: Observer)
    func notify()
}


protocol Observer {
    func update(value: Int)
}


class Publisher: Observable {
    
    
    static let sharedInstance = Publisher(value: 0)
    
    var observers = [Observer]()
    
    var value: Int {
        didSet {
            notify()
        }
    }
    
    init(value: Int) {
        self.value = value
    }
    
    func register(observer: Observer) {
        observers.append(observer)
    }
    
    func notify() {
        observers.map { $0.update(value: value) }
    }
}

class Consumer: Observer {
    
    init() {
        Publisher.sharedInstance.register(observer: self)
    }
    
    func update(value: Int) {
        print("Updated value is \(value)")
    }
    
}



let consumer = Consumer()

Publisher.sharedInstance.value = 0 // Updated value is 0
Publisher.sharedInstance.value = 10 // Updated value is 10
