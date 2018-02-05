//
//  Extensions.swift
//  LoginScreen
//
//  Created by apple on 2/2/18.
//  Copyright © 2018 jaffar. All rights reserved.
//

import UIKit


extension UIView {
    
    func anchors(top: NSLayoutYAxisAnchor?, topPadding: CGFloat, bottom: NSLayoutYAxisAnchor?, botPadding: CGFloat,left: NSLayoutXAxisAnchor?, leftPadding: CGFloat, right: NSLayoutXAxisAnchor?, rightPadding: CGFloat, height: CFloat, width: CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints = false
    
    
      if let top = top {
        self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
       }
       if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -botPadding).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        if height > 0 {
            self.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        }
        if width > 0 {self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    
  }
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}




