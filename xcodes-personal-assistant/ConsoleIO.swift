import Foundation

enum OptionType: String {
    case deleteModuleCache = "1"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "1": self = .deleteModuleCache
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

struct Color {
    static let red = "\u{001B}[0;31m"
    static let white = "\u{001B}[;m"
}

class ConsoleIO {
    func printUsage() {
        write("Please choose one of the options listed below:")
        write("1. Delete Xcodes Module Cache")
        write("q. Quit")
    }
    
    func get(option: String) -> OptionType {
        return OptionType(value: option)
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
    
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
