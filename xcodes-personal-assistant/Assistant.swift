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
                case .quitXcode:
                    quitXcode()
                case .quit:
                    shouldQuit = true
                }

            } else {
                consoleIO.write("Unknown option \(input)", to: .error)
            }
        }
    }
    
    private func openXcode() {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["open", "-a", "Xcode"]
        task.launch()
        task.waitUntilExit()
    }
    
    private func quitXcode() {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["killall", "Xcode"]
        task.launch()
        task.waitUntilExit()
    }
}
