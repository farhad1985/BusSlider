//
//  Connectable.swift
//  BusSlider
//
//  Created by Farhad Faramarzi on 4/29/20.
//  Copyright © 2020 Farhad. All rights reserved.
//

import UIKit

protocol Connectable {}

extension Connectable where Self: UIView {
    func commit() {
        let bundle = Bundle(for: Self.self)

        let nib = UINib(nibName: String(describing: Self.self), bundle: bundle)
        let views = nib.instantiate(withOwner: self, options: nil)
        guard let view = views.first as? UIView else {return}
        view.frame = bounds
        addSubview(view)
    }
    
    func getBundle() -> Bundle {
        return Bundle(for: Self.self)
    }
}
