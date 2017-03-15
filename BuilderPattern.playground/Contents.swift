//
//  BuilderPattern

//  Created by Deep Parekh on 3/14/17.
//


struct User {
    let userName: String
    let userIdentifier: String
    let phoneNumber :String?
    let city :String?
    let country :String?
    
    fileprivate init(builder: UserBuilder) {
        self.userName = builder.userName
        self.userIdentifier = builder.userIdentifier
        self.phoneNumber = builder.phoneNumber
        self.city = builder.city
        self.country = builder.country
    }
    
    private init() {
        fatalError("Cannot access this constructor")
    }
}

// MARK: builder
extension User {
    
    fileprivate class UserBuilder {
        fileprivate let userName: String
        fileprivate let userIdentifier: String
        fileprivate var phoneNumber :String?
        fileprivate var city :String?
        fileprivate var country :String?
        
        init(userName: String, userIdentifier: String) {
            self.userName = userName
            self.userIdentifier = userIdentifier
        }
        
        func with(phoneNumber: String) -> UserBuilder {
            self.phoneNumber = phoneNumber
            return self
        }
        
        func with(city: String) -> UserBuilder {
            self.city = city
            return self
        }
        
        func with(country: String) -> UserBuilder {
            self.country = country
            return self
        }
        
        func build() -> User {
            return User(builder: self)
        }
    }
}



// Building instance with all properties
let user1 = User.UserBuilder(userName: "zeusdeep", userIdentifier: "007")
                .with(city: "NYC")
                .with(country: "USA")
                .with(phoneNumber: "(000)-000-0000")
                .build()

user1.userName // zeusdeep

// Building instance with partial properties being set
let user2 = User.UserBuilder(userName: "user 2", userIdentifier: "002")
    .with(city: "NYC")
    .build()

user2.userName // user 2


