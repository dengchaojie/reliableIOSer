import UIKit

struct Person {
    let firstname: String
    let lastname: String
}

protocol GreetingViewModelProtocol: class {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)? { get set }
    init(person: Person)
    func showGreeting()
}


class GreetingViewModel: GreetingViewModelProtocol {
    let person: Person
    required init(person: Person) {
        self.person = person
    }
    
    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)?
    
    func showGreeting() {
        self.greeting = "Hello, " + "\(self.person.lastname) " + "\(self.person.firstname). "
    }
    
    
    
    
}

class GreetingViewController: UIViewController {
    
    var viewModel: GreetingViewModel! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLable.text = viewModel.greeting
            }
        }
    }
    let greetingLable = UILabel()
    let greetingButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingButton.addTarget(self, action: #selector(touchGreetingButton), for: .touchUpInside)
    }
    
    
    @objc func touchGreetingButton() {
        self.viewModel.showGreeting()
    }
}
let per = Person(firstname: "chao jie", lastname: "deng")
let viewModel = GreetingViewModel(person: per)
let vc = GreetingViewController()
vc.viewModel = viewModel// 这里的vc，也可以当成view
