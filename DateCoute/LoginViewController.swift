
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private var email : String? = nil
    private var password : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextFiled.becomeFirstResponder()
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.passwordTextFiled.becomeFirstResponder()
    }
    
    
    @objc func loginAction(){
        if let inputEmail = emailTextFiled.text?.description, let inputPassword = passwordTextFiled.text?.description{
            Auth.auth().signIn(withEmail: inputEmail, password: inputPassword){ authResult, error in
                if authResult != nil {
                    print("로그인 성공")
                } else {
                    print("로그인 실패")
                    print(error.debugDescription)
                }
            }
        }
    }
    
}
