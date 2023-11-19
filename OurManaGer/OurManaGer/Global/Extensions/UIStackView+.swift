//
//  UIStackView+.swift
//  OurManaGer
//
//  Created by 방민지 on 11/19/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}

