import Foundation

extension String {
    func isAnagram(of string: String) -> Bool {
        //1
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerOther = string.lowercased().replacingOccurrences(of: " ", with: "")
        //2
        return lowerSelf.characters.sorted() == lowerOther.characters.sorted()
    }
    
    func isPalindrome() -> Bool {
        //1
        let f = self.lowercased().replacingOccurrences(of: " ", with: "")
        //2
        let s = String(f.characters.reversed())
        //3
        return  f == s
    }
}
