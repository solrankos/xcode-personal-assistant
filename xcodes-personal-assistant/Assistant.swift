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
            
            if let option = Option(handle: input) {
                
                switch option.type {
                case .openXcode:
                    openXcode()
                case .deleteModuleCache:
                    consoleIO.write("Deleting module cache!")
                case .quit:
                    shouldQuit = true
                }

            } else {
                consoleIO.write("Unknown option \(input)", to: .error)
            }
            
        }
    }
    
    private func openXcode() {
        consoleIO.write("Open xcode")
    }
}
