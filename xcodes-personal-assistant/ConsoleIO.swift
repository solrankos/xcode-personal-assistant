import Foundation

enum OptionType: String {
    case openXcode
    case deleteModuleCache
    case quit
}

struct Option {
    let handle: String
    let type: OptionType
    let description: String
    
    init?(handle: String) {
        let options = Option.available
        
        if let i = options.index(where: { $0.handle == handle}) {
            let option = options[i]
            self.handle = option.handle
            self.type = option.type
            self.description = option.description
        } else {
            return nil
        }
    }
    
    init(handle: String, type: OptionType, description: String) {
        self.handle = handle
        self.type = type
        self.description = description
    }
    
    static let available = [
        Option(
            handle: "1",
            type: .openXcode,
            description: "Open Xcode"
        ),
        Option(
            handle: "2",
            type: .deleteModuleCache,
            description: "Delete Xcodes Module Cache"
        ),
        Option(
            handle: "q",
            type: .quit,
            description: "Quit"
        )
    ]
}

struct Color {
    static let red = "\u{001B}[0;31m"
    static let white = "\u{001B}[;m"
}

class ConsoleIO {
    func printUsage() {
        write("Please choose one of the options listed below:")
        
        for option in Option.available {
            write("\(option.handle). \(option.description)")
        }
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
