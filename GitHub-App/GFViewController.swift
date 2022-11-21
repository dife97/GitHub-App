//
//  GFViewController.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

class GFViewController: UIViewController {
    
    //MARK: - DismissKeyboard
    var dismissibleKeyboard: Bool = true
    
    var afterHideKeyboard: (() -> Void)?
    
    var afterShowKeyboard: ((_ heightKeyboard: CGFloat) -> Void)?
    
    private lazy var tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(self.hideKeyboard)
        )
        
        return tap
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if dismissibleKeyboard == true {
            viewDismissKeyboard()
        }
    }
    
    //MARK: - DismissKeyboard
    
    
    func viewDismissKeyboard() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: nil) { [weak self] notification in
            
            guard let self = self else { return }
            
            guard let keyboardHeight = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            
            self.view.addGestureRecognizer(self.tap)
            
            self.afterShowKeyboard?(keyboardHeight.cgRectValue.height)
        }
    }
    
    @objc
    private func hideKeyboard() {
        
        view.removeGestureRecognizer(tap)
        
        view.endEditing(true)
        
        afterHideKeyboard?()
    }
}
