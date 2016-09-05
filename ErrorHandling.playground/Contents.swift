//Error Handling

struct Friend {
    let name: String
    let age: String
    let address: String?
}

enum FriendError: ErrorType {
    case InvalidData(String)
}

func createFriendFromJSON(dict: [String: String]) throws -> Friend {
    guard let name = dict["name"] else {
        throw FriendError.InvalidData("Name key fails")
    }
    
    guard let age = dict["age"] else {
        throw FriendError.InvalidData("Age key fails")
    }
    
    let address = dict["address"]
    
    return Friend(name: name, age: age, address: address)
}

func sendMessageToFriend(friend: Friend, message: String) {
    
}

let response = ["name": "Zulwiyoza Putra",
                "age": "21",
                "address": "411 O'Farrell"]

do {
    let friend = try createFriendFromJSON(response)
    sendMessageToFriend(friend, message: "")
} catch FriendError.InvalidData(let key) {
    print(key)
}

//CHALLENGE

//Challenge No.1

enum NetworkError: ErrorType {
    case InvalidURL
}

//Challenge No. 2

enum BookError: ErrorType {
    case IncorrectTitle
}

func lend() throws {
    throw BookError.IncorrectTitle
}

//Challenge No. 3

enum ParserError: ErrorType {
    case EmptyDictionary(String)
    case InvalidKey(String)
}

struct Parser {
    var data: [String : String?]?
    
    func parse() throws {
        guard data != nil else {
            throw ParserError.EmptyDictionary("Dictionary is empty")
        }
        
        guard data?["someKey"] != nil else {
            throw ParserError.InvalidKey("Key is invalid")
        }
        
    }
}

let data: [String : String?]? = ["someKey": nil]
let parser = Parser(data: data)

do {
    try parser.parse()
} catch ParserError.EmptyDictionary(let key) {
    print(key)
} catch ParserError.InvalidKey(let key) {
    print(key)
}


