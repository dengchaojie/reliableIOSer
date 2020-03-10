import UIKit

struct Person {
    let firstname: String
    let lastname: String
}



protocol GreetingView: class {
    func setGreeting(string: String)
}

protocol GreetingViewPresenter {
    init(view: GreetingView, person: Person)
    func showGreeting()
}

class GreetingPresenter: GreetingViewPresenter {
    unowned let view: GreetingView
    let person: Person
    
    required init(view: GreetingView, person: Person) {
        self.view = view
        self.person = person
    }

    func showGreeting() {
        let str = "Hello, " + "\(self.person.lastname) " + "\(self.person.firstname). "
        self.view.setGreeting(string: str)
    }
}

class GreetingViewController: UIViewController, GreetingView {
    func setGreeting(string: String) {
        self.greetingLable.text = string
    }
    
    var presenter: GreetingPresenter!
    let greetingLable = UILabel()
    let greetingButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingButton.addTarget(self, action: #selector(touchGreetingButton), for: .touchUpInside)
    }
    
    
    @objc func touchGreetingButton() {
        self.presenter.showGreeting()
    }
}

let per = Person(firstname: "chao jie", lastname: "deng")

let view = GreetingViewController()// vc相当于view
let presenter = GreetingPresenter(view: view, person: per)
view.presenter = presenter
