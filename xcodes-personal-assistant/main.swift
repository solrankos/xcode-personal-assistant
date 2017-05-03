import Foundation

let assistant = Assistant()

if CommandLine.argc < 2 {
    assistant.interactiveMode()
} else {
    assistant.staticMode()
}
