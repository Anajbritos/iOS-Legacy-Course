import UIKit

func megaSenaGenerator(number: Int) -> Set<Int>{
    var numbers = 0
    var result: Set<Int> = []

    while(numbers < number) {
        let generate = Int.random(in: 1...60)
        let res = result.insert(generate)
        numbers += 1
        
    }
    return result
}

megaSenaGenerator(number: 2)
megaSenaGenerator(number: 4)
megaSenaGenerator(number: 6)





