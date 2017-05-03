import Foundation

enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case unknown
    
    init(value: String) {
        switch value {
        case "a": self = .anagram
        case "p": self = .palindrome
        case "h": self = .help
        default: self = .unknown
        }
    }
}

struct Color {
    static let red = "\u{001B}[0;31m"
    static let white = "\u{001B}[;m"
}

class ConsoleIO {
    class func printUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        print("usage:")
        print("\(executableName) -a string1 string2")
        print("or")
        print("\(executableName) -p string")
        print("or")
        print("\(executableName) -h to show usage information")
        print("Type \(executableName) without an option to enter interactive mode.")
    }
    
    func getOption(option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func write(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print(Color.white + message)
        case .error:
            fputs("\(Color.red)\(message)\n", stderr)
            
            // Reset color
            fputs(Color.white, stderr)
        }
    }
}
