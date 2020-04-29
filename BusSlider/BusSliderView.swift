//
//  BusSliderView.swift
//  Daroo
//
//  Created by Farhad Faramarzi on 4/28/20.
//  Copyright © 2020 Farhad. All rights reserved.
//

import UIKit

@IBDesignable
public class BusSliderView: UIView, Connectable {
    public typealias ONChanger = (Int) ->()
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var vwSlider: UIView!
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    public var onChange: ONChanger?
    
    @IBInspectable
    public var toggleColor: UIColor = .orange {
        didSet {
            slider.thumbTintColor = toggleColor
        }
    }
    
    @IBInspectable
    public var sliderColor: UIColor = .lightGray {
        didSet {
            vwMain.backgroundColor = sliderColor
        }
    }
    
    @IBInspectable
    public var bulletColor: UIColor = .orange {
        didSet {
            vwSlider.backgroundColor = bulletColor.withAlphaComponent(0.5)
        }
    }
    
    @IBInspectable
    public var maxValue: Int = 5 {
        didSet {
            DispatchQueue.main.async {
                self.setup()
            }
        }
    }
    
    public var value: Int {
        get {
            return Int(slider?.value ?? 0)
        }
        
        set {
            var v = newValue
            if newValue > maxValue {
                v = maxValue
            }
            slider.value = Float(v)
            onChange?(v)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commit()
    }
    
    @IBAction
    func changeSlider(_ sender: Any) {
        let index = Int(slider.value)
        slider.value = Float(index)
        layoutSubviews()
        
        onChange?(index)
    }
    
    func setup() {
        clearStackSubViews()
        
        vwMain.layer.cornerRadius = 5
        vwMain.layer.masksToBounds = true
        
        setupSlider()
        
        createBullets()
        
        layoutSubviews()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        DispatchQueue.main.async { [weak self] in
            for i in self?.stack.subviews ?? [] {
                i.translatesAutoresizingMaskIntoConstraints = false
                i.widthAnchor.constraint(equalToConstant: 10).isActive = true
                i.heightAnchor.constraint(equalToConstant: 10).isActive = true
            }
            
            self?.vwSlider.translatesAutoresizingMaskIntoConstraints = false
            
            self?.widthConstraint.constant = self?.getWidthCurrentSlider() ?? 0
        }
    }
    
    func getWidthCurrentSlider() -> CGFloat {
        let currentSlider = Int(self.slider.value)
        
        var max = self.maxValue - 1
        
        if self.maxValue < 0 {
            max = 0
        }
        
        return CGFloat(Int(self.frame.width) * currentSlider / max)
    }
    
    func clearStackSubViews() {
        stack.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func setupSlider() {
        slider.minimumTrackTintColor = .clear
        slider.maximumTrackTintColor = .clear
        
        var max = maxValue - 1
        
        if maxValue < 0 {
            max = 0
        }
        slider.maximumValue = Float(max)
    }
    
    func createBullets() {
        for _ in 0..<maxValue {
            let v = UIView(frame: .zero)
            v.layer.cornerRadius = 5
            v.layer.masksToBounds = true
            v.backgroundColor = bulletColor
            stack.addArrangedSubview(v)
        }
    }
    
}
