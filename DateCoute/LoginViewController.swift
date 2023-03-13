import UIKit
import FirebaseAuth

class LoginViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate  {

    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private var email : String? = nil
    private var password : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setKeyboardObserver()
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        self.passwordTextFiled.becomeFirstResponder()
    }
    
    //화면 터치시 키보드 숨김
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
//    // UI키보드 enter 누를시, 다음textfield로 이동,
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        emailTextFiled.resignFirstResponder()
//        return true
//    }
    
    
    @objc func loginAction(){
//        if let inputEmail = emailTextFiled.text?.description, let inputPassword = passwordTextFiled.text?.description{
//            Auth.auth().signIn(withEmail: inputEmail, password: inputPassword){ authResult, error in
//                if authResult != nil {
//                    print("로그인 성공")
//                } else {
//                    print("로그인 실패")
//                    print(error.debugDescription)
//                }
//            }
//        }
    }
}


//extension
//말그대로 확장이라는 뜻으로, 기존 부모클래스(프로토콜..?)에 새로운 함수를 추가하는느낌인듯.
extension UIViewController {
    
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                  let keyboardRectangle = keyboardFrame.cgRectValue
                  let keyboardHeight = keyboardRectangle.height
              UIView.animate(withDuration: 1) {
                  self.view.window?.frame.origin.y -= keyboardHeight
              }
          }
      }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.window?.frame.origin.y != 0 {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                    let keyboardRectangle = keyboardFrame.cgRectValue
                    let keyboardHeight = keyboardRectangle.height
                UIView.animate(withDuration: 1) {
                    self.view.window?.frame.origin.y += keyboardHeight
                }
            }
        }
    }
}
