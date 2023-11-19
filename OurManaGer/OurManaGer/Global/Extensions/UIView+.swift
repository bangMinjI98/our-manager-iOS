//
//  UIView+.swift
//  OurManaGer
//
//  Created by 방민지 on 11/19/23.
//

import UIKit

extension UIView {
        func addSubViews(_ views: UIView...) {
                views.forEach {
                        self.addSubview($0)
                }
        }
}

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
