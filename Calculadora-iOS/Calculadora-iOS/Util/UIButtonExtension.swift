//
//  UIButtonExtension.swift
//  Calculadora-iOS
//
//  Created by Benjamín on 04-10-23.
//

import UIKit

extension UIButton {
    
    // Border redondeados
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    // Brillo del boton
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
}
