//
//  ViewController.swift
//  TestScrollView
//
//  Created by 曹家瑋 on 2023/10/6.
//

import UIKit

class ViewController: UIViewController {
    
    // 創建一個 UIScrollView 的實例，並設置約束自動轉換為 false
    let movieScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // 創建一個 UIImageView 的實例，並設置圖片和內容模式
    let movieImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "哈比人")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 將 scroll view 和 image view 加入到當前的 view hierarchy
        view.addSubview(movieScrollView)
        movieScrollView.addSubview(movieImageView)

        // 設定 scroll view 的 content size 為 image 的大小
        if let image = movieImageView.image {
            // 設置 scrollView 的可滾動區域
            movieScrollView.contentSize = image.size
        } else {
            print("圖片加載失敗。")
        }

        // 設置約束
        setupConstraints()
    }
    
    /// 約束設置
    func setupConstraints() {
        
        // 使用 NSLayoutConstraint 啟動約束，來定義視圖的佈局
        NSLayoutConstraint.activate([
            
            // 約束 image view 與 scroll view 的四個邊緣保持一致
            movieImageView.topAnchor.constraint(equalTo: movieScrollView.topAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: movieScrollView.bottomAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: movieScrollView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: movieScrollView.trailingAnchor),
            
            // 確保 image view 的 width 和 height 和 scroll view 的 content size 一致
            movieImageView.widthAnchor.constraint(equalToConstant: movieScrollView.contentSize.width),
            movieImageView.heightAnchor.constraint(equalToConstant: movieScrollView.contentSize.height),
            
            // 約束 scroll view 與 safe area 的四個邊緣保持一致
            movieScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            movieScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

