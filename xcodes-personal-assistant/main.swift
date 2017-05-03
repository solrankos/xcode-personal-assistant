import Foundation

let assistant = Assistant()

if CommandLine.argc < 2 {
    //Handle interactive mode
} else {
    assistant.staticMode()
}
