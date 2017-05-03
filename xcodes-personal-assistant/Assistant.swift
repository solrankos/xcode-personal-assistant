import Foundation

enum OutputType {
    case error
    case standard
}

class Assistant {
    let consoleIO = ConsoleIO()
    
    func interactiveMode() {
        consoleIO.write("Welcome to Xcodes personal helper")
        
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.printUsage()
            
            let input = consoleIO.getInput()
            let option = consoleIO.get(option: input)
            
            switch option {
            case .deleteModuleCache:
                consoleIO.write("Deleting module cache!")
            case .quit:
                shouldQuit = true
            default:
                consoleIO.write("Unknown option \(input)", to: .error)
            }
        }
    }
}
