import Foundation

// define a struct that handles the conversion during initialization
public struct MorseCoder {
    
    public var standard: String // alphanumeric
    public var code: String     // morse code
    var morseDict = readMorseFile()
    var reverseDict = reverseMorseFile()
    
    // takes in alphanumeric input and converts to morse code
    public init(standard: String) {
        var outputString = ""
        for char in standard.uppercased().characters {
            outputString = outputString + morseDict[char]! + " "
        }
        self.standard = standard
        self.code = outputString
    }
    
    // takes in code input and converts to alphanumeric
    public init(code: String) {
        var outputString = ""
        let list = code.components(separatedBy: " ")
        
        for item in list {
            if item != "" {
                outputString = outputString + String(describing: reverseDict[String(item)]!)
            }
        }
        self.standard = outputString.lowercased()
        self.code = code
    }
}

// this function creates what I call morseDict, which is a dictionary that has alphanumeric keys and morse values
func readMorseFile()-> [Character: String]{
    do {
        let morseFile = try String(contentsOfFile: "morse_code.txt",encoding: String.Encoding.utf8)
        
        var morseDict:[Character: String] = [:]
        let morseEntries = morseFile.components(separatedBy:"\n")
        for entry in morseEntries {
            if entry != "" {
                let key = entry[entry.startIndex]
                var val = ""
                var flag = 0
                
                // an ad hoc way to do substring slicing
                // for some unknown reason I find String operations in Swift highly unintuitive
                // basically here I am trying to get the morse code, which is always preceded by ": "
                for c in entry.characters {
                    if c == ":" {
                        flag = flag + 1
                    }
                    if flag == 1 && c == " " {
                        flag = flag + 1
                    }
                    if flag == 2 && c != ","  && c != " "{
                        val = val + String(c)
                    }
                }
                morseDict[key] = val
                
            }
        }
        return morseDict
    } catch {
        print("Error")
        return [:]
    }
    
}



// this function creates what I call reverseDict, which is a dictionary that has morse keys and alphanumeric values
func reverseMorseFile()-> [String: Character]{
    do {
        let morseFile = try String(contentsOfFile: "morse_code.txt",encoding: String.Encoding.utf8)
        
        var reverseDict:[String: Character] = [:]
        let morseEntries = morseFile.components(separatedBy:"\n")
        for entry in morseEntries {
            if entry != "" {
                let val = entry[entry.startIndex]
                var key = ""
                var flag = 0
                
                // an ad hoc way to do substring slicing
                // for some unknown reason I find String operations in Swift highly unintuitive
                // basically here I am trying to get the morse code, which is always preceded by ": "
                for c in entry.characters {
                    if c == ":" {
                        flag = flag + 1
                    }
                    if flag == 1 && c == " " {
                        flag = flag + 1
                    }
                    if flag == 2 && c != ","  && c != " "{
                        key = key + String(c)
                    }
                }
                reverseDict[key] = val
            }
        }
        return reverseDict
    } catch {
        print("Error")
        return [:]
    }
    
}

