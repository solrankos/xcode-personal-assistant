import Foundation

enum OutputType {
    case error
    case standard
}

class Assistant {
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        //1
        let argCount = CommandLine.argc
        
        //2
        let argument = CommandLine.arguments[1]
        
        //3
        let (option, value) = consoleIO.getOption(
                option: argument.substring(
                    from: argument.characters.index(
                        argument.startIndex, offsetBy: 1
                    )
                )
            )
        
        //4
        switch option {
        case .anagram:
            if argCount != 4 {
                if argCount > 4 {
                    consoleIO.write("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.write("too few arguments for option \(option.rawValue)", to: .error)
                }
                ConsoleIO.printUsage()
            } else {
                let first = CommandLine.arguments[2]
                let second = CommandLine.arguments[3]
                
                if first.isAnagram(of: second) {
                    consoleIO.write("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.write("\(second) is not an anagram of \(first)")
                }
            }
        case .palindrome:
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.write("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.write("too few arguments for option \(option.rawValue)", to: .error)
                }
            } else {
                let s = CommandLine.arguments[2]
                let isPalindrome = s.isPalindrome()
                consoleIO.write("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        case .help:
            ConsoleIO.printUsage()
        case .unknown:
            consoleIO.write("Unkonwn option \(value)", to: .error)
            ConsoleIO.printUsage()
        }
    }
}
