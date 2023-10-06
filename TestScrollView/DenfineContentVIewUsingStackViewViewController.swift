//
//  DenfineContentVIewUsingStackViewViewController.swift
//  TestScrollView
//
//  Created by 曹家瑋 on 2023/10/6.
//

import UIKit

class DenfineContentVIewUsingStackViewViewController: UIViewController {
    
    @IBOutlet weak var formScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 啟動鍵盤事件的監聽
        registerForKeyboardNotifications()
    }
    
    // 通知註冊：當鍵盤出現與消失時要執行的方法
    func registerForKeyboardNotifications() {
        
        // 當鍵盤出現或消失時，這些監聽器會分別調用`keyboardWasShown(_:)`和`keyboardWillBeHidden(_:)`函數。
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 鍵盤出現時，調整滾動視圖的邊距，避免內容被鍵盤遮擋
    @objc func keyboardWasShown(_ notificiation: NSNotification) {
        
        // 這個函數在鍵盤出現時被呼叫
        guard let info = notificiation.userInfo,
              // 獲取通知的用戶資訊，其中包含了鍵盤的大小資訊。
              let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        
        // 將 NSValue 對象轉換為 CGRect 以獲取鍵盤的大小。
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        // 設定滾動視圖的內容邊距，使其底部留出等於鍵盤高度的空間，防止鍵盤遮擋內容。
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        // 設定contentInset
        formScrollView.contentInset = contentInsets
        // 設定scrollIndicatorInsets
        formScrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    // 鍵盤消失時，還原滾動視圖的邊距
    @objc func keyboardWillBeHidden(_ notificiation: NSNotification) {
        
        // 將滾動視圖的內容邊距和滾動條的邊距重設為0。
        let contentInsets = UIEdgeInsets.zero
        formScrollView.contentInset = contentInsets
        formScrollView.scrollIndicatorInsets = contentInsets
    }
    
}


