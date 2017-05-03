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
        case .unknown, .quit:
            consoleIO.write("Unkonwn option \(value)", to: .error)
            ConsoleIO.printUsage()
        }
    }
    
    func interactiveMode() {
        //1
        consoleIO.write("Welcome to Panagram. This program checks if an input string is an anagram or palindrome.")
        //2
        var shouldQuit = false
        while !shouldQuit {
            //3
            consoleIO.write("Type 'a' to check for anagrams or 'p' for palindromes type 'q' to quit.")
            let (option, value) = consoleIO.getOption(option: consoleIO.getInput())
            
            switch option {
            case .anagram:
                //4
                consoleIO.write("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.write("Type the second string:")
                let second = consoleIO.getInput()
                
                //5
                if first.isAnagram(of: second) {
                    consoleIO.write("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.write("\(second) is not an anagram of \(first)")
                }
            case .palindrome:
                consoleIO.write("Type a word or sentence:")
                let s = consoleIO.getInput()
                let isPalindrome = s.isPalindrome()
                consoleIO.write("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            case .quit:
                shouldQuit = true
            default:
                //6
                consoleIO.write("Unknown option \(value)", to: .error)
            }
        }
    }
}
