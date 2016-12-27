//: Playground - noun: a place where people can play

import UIKit
import RxSwift

var str = "Hello, playground"

let disposebag = DisposeBag()
Observable<Int>.empty().subscribe{
        event in
        print(event)
    }.addDisposableTo(disposebag)


Observable.of("Dog","Cat").subscribe(
    onNext:{print("element:",$0)},
    onError:{print("error",$0)},
    onCompleted:{print("completed")},
    onDisposed:{print("Disposed")}

)

//create

let myJust = {(element:String) ->Observable<String> in
  
    return Observable.create { observer in
        observer.on(.next(element))
        observer.on(.completed)
        return Disposables.create()
    }
}

myJust("Sunjianfeng").subscribe{ print($0)}.addDisposableTo(disposebag)

// Observable 发送sequences
Observable.just(21).subscribe { event in
     print(event)
    
}.dispose()

let sts = BehaviorSubject(value: "hello")
sts.subscribe {
    print($0)
    /*
     next(hello)
     next(world)
     */
}.addDisposableTo(disposebag)

sts.on(Event.next("world"))
sts.onNext("!!!")

// 使用Variable  当Variable被释放的时候，它会向监听者发送onCompleted

let number = Variable(1)
number.asObservable().subscribe {
   print($0)
}.addDisposableTo(disposebag)
number.value = 12
number.value = 22233;
/*
 next(1)
 next(12)
 next(22233)
 */

// 需要理解
struct Person {
    var name:Variable<String>
}

let scott = Person(name: Variable("Scott"))

let lori = Person(name: Variable("Lori"))
let person = Variable(scott)
// 使用debug 功能
person.asObservable().debug("person").flatMapLatest {
    
    $0.name.asObservable()
    }.subscribe {
        print($0)
}.addDisposableTo(disposebag)
person.value = lori
scott.name.value = "Sun" // 被忽略
/*
 2016-12-23 10:24:06.843: person -> subscribed
 2016-12-23 10:24:06.845: person -> Event next(Person(name: RxSwift.Variable<Swift.String>))
 next(Scott)
 2016-12-23 10:24:06.846: person -> Event next(Person(name: RxSwift.Variable<Swift.String>))
 next(Lori)

 
 */

typealias Distance = Double
struct Position {
    var x: Double
    var y: Double
}
extension Position {
    func minus(p: Position) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }
    var length: Double {
        return sqrt(x * x + y * y)
    }
}
struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}
struct Region {
    let lookup: (Position) -> Bool
}


extension Region {
    func invert() -> Region {
        return Region(lookup: { point in
                    !self.lookup(point)
                })
    }
            
    func intersection(region: Region) -> Region {
        return Region(lookup: { point in self.lookup(point) && region.lookup(point) })
        }
            
    func union(region: Region) -> Region {
        return Region(lookup: { point in self.lookup(point) || region.lookup(point) })
    }
            
}


let psubject = PublishSubject<String>()
psubject.onNext("dd")
psubject .subscribe {
    print("1-->psubject -->\($0)")
}.addDisposableTo(disposebag)

psubject.onNext("d333")// 输出d333 dd没有输出



psubject.asObserver().subscribe {
    print("2-->psubject -->\($0)")
}.addDisposableTo(disposebag)



psubject .subscribe {
    print("3-->psubject -->\($0)")
   
}.addDisposableTo(disposebag)

psubject.onNext("ff")




// zip

let stringSubject = PublishSubject<String>()
let intSubject = PublishSubject<Int>()

Observable.zip(stringSubject, intSubject) { stringElement, intElement in
    "\(stringElement) \(intElement)"
    }
    .subscribe(onNext: { print($0) })
    .addDisposableTo(disposebag)

stringSubject.onNext("🅰️")
stringSubject.onNext("🅱️")

intSubject.onNext(1)
intSubject.onNext(2)



enum MyOption<T1,T2,T3,T4> {
    case left(T1)
    case middle(T2)
    case right(T3)
    case up(T4)
}
let colors = ["periwinkle", "rose", "moss"]

let op = MyOption<Int,Float,String,Any>.up(colors)

private extension MyOption {
    var name:String {
        return "x"
    }
}


let P:String? = nil
switch P {
case _?:
    print("___")
case nil:
    print("nil")
    
}

// 逃逸闭包和非逃逸闭包 
// 3.0 默认闭包是非逃逸的

func transform(_ n:Int,with f:(Int)-> Int = { $0}) -> Int{
    return f(n)
}

struct JFHelper {
    
    var factor:CGFloat {
        get{
            return 1.0 * 0.8;
        }
        set(newValue){
            self.factor = newValue
        }
    }
    let  screenWidth :CGFloat = UIScreen.main.bounds.size.width
    let  ratio :CGFloat = 0.8
    let kGridCount = 15
    let kChessSpace = 20.0
}

let helper = JFHelper()
print(helper.factor)







