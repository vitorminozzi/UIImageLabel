//
//  ImageLabel.swift
//  imageTextView
//
//  Created by Vitor Gomes on 04/05/21.
//

import Foundation
import UIKit


enum ImagePosition {
    case top
    case left
    case right
    case bottom
}

class ImageLabel: Label {
    
    let image = UIImageView()
    let leftImage = UIImageView()
    let topImage = UIImageView()
    let bottomImage = UIImageView()
    var objRImage: Image?
    var objLImage: Image?
    var objTImage: Image?
    var objBImage: Image?
    
    init(rightImage: Image? = nil, leftImage: Image? = nil, topImage: Image? = nil, bottomImage: Image? = nil) {
        self.objRImage = rightImage
        self.objLImage = leftImage
        self.objTImage = topImage
        self.objBImage = bottomImage
        super.init(frame: .zero)
        
        setupLayout()
        self.backgroundColor = .green
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func removeImage(inPosition: ImagePosition) {
        switch inPosition {
        case .top:
            topImage.isHidden = true
            self.topTextInset = objTImage?.padding ?? 0
        case .left:
            leftImage.isHidden = true
            self.leftTextInset = objLImage?.padding ?? 0
        case.right:
            image.isHidden = true
            self.rightTextInset = objRImage?.padding ?? 0
        default:
            bottomImage.isHidden = true
            self.bottomTextInset = objBImage?.padding ?? 0
        }
    }
    
    func addImage(inPosition: ImagePosition) {
        switch inPosition {
        case .top:
            topImage.isHidden = false
            let topSpacing = objTImage?.spacing ?? 0
            let topPadding = objTImage?.padding ?? 0
            let topHeight = objTImage?.height ?? 0
            self.topTextInset = topSpacing + topPadding + topHeight
            
            if objRImage == nil && objLImage == nil {
                
                self.leftTextInset = (objTImage?.width ?? 0) / 5
                self.rightTextInset = (objTImage?.width ?? 0) / 5
            }
            
        case .left:
            leftImage.isHidden = false
            let leftSpacing = objLImage?.spacing ?? 0
            let leftPadding = objLImage?.padding ?? 0
            let leftWidth = objLImage?.width ?? 0
            self.leftTextInset = leftSpacing + leftPadding + leftWidth
            
            if objTImage == nil && objBImage == nil {
                
                self.topTextInset = (objRImage?.height ?? 0) / 4
                self.bottomTextInset = (objRImage?.height ?? 0) / 4
            }
            
        case.right:
            image.isHidden = false
            let rightSpacing = objRImage?.spacing ?? 0
            let rightPadding = objRImage?.padding ?? 0
            let rightWidth = objRImage?.width ?? 0
            self.rightTextInset = rightSpacing + rightPadding + rightWidth
            
            if objTImage == nil && objBImage == nil {
                
                self.topTextInset = (objRImage?.height ?? 0) / 4
                self.bottomTextInset = (objRImage?.height ?? 0) / 4
            }
            
        default:
            bottomImage.isHidden = false
            let bottomSpacing = objBImage?.spacing ?? 0
            let bottomPadding = objBImage?.padding ?? 0
            let bottomHeight = objBImage?.height ?? 0
            self.bottomTextInset = bottomSpacing + bottomPadding + bottomHeight
            
            if objRImage == nil && objLImage == nil {
                
                self.leftTextInset = (objTImage?.width ?? 0) / 5
                self.rightTextInset = (objTImage?.width ?? 0) / 5
            }
        }
    }
    
}

extension ImageLabel {
    func setupLayout() {
        
        self.text = "Label"
        
        if objRImage != nil {
            self.addSubview(image)
            
            let rightSpacing = objRImage?.spacing ?? 0
            let rightPadding = objRImage?.padding ?? 0
            let rightWidth = objRImage?.width ?? 0
            
            self.rightTextInset = rightSpacing + rightPadding + rightWidth
            
            if objTImage == nil && objBImage == nil {
                
                self.topTextInset = (objRImage?.height ?? 0) / 4
                self.bottomTextInset = (objRImage?.height ?? 0) / 4
            }
            
            image.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                                            image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(objRImage?.padding ?? 0)),
                                            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                            image.heightAnchor.constraint(equalToConstant: (objRImage?.height ?? image.image?.size.height) ?? 0),
                                            image.widthAnchor.constraint(equalToConstant: (objRImage?.width ?? image.image?.size.width) ?? 0)])
            
            image.image = UIImage(systemName: objRImage?.image ?? "")
            
        }
        
        if objLImage != nil {
            self.addSubview(leftImage)
            let leftSpacing = objLImage?.spacing ?? 0
            let leftPadding = objLImage?.padding ?? 0
            let leftWidth = objLImage?.width ?? 0
            
            self.leftTextInset = leftSpacing + leftPadding + leftWidth
            
            if objTImage == nil && objBImage == nil {
                
                self.topTextInset = (objRImage?.height ?? 0) / 4
                self.bottomTextInset = (objRImage?.height ?? 0) / 4
            }
            
            leftImage.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                                            leftImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leftPadding),
                                            leftImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                            leftImage.heightAnchor.constraint(equalToConstant: objLImage?.height ?? 0),
                                            leftImage.widthAnchor.constraint(equalToConstant: leftWidth)])
            
            leftImage.image = UIImage(systemName: objLImage?.image ?? "")
        }
        
        if objTImage != nil {
            self.addSubview(topImage)
            let topSpacing = objTImage?.spacing ?? 0
            let topPadding = objTImage?.padding ?? 0
            let topHeight = objTImage?.height ?? 0
            
            self.topTextInset = topSpacing + topPadding + topHeight
            
            if objRImage == nil && objLImage == nil {
                
                self.leftTextInset = (objTImage?.width ?? 0) / 5
                self.rightTextInset = (objTImage?.width ?? 0) / 5
            }
            
            
            topImage.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                                            topImage.topAnchor.constraint(equalTo: self.topAnchor, constant: topPadding),
                                            topImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                            topImage.heightAnchor.constraint(equalToConstant: topHeight),
                                            topImage.widthAnchor.constraint(equalToConstant: objTImage?.width ?? 0)])
            
            topImage.image = UIImage(systemName: objTImage?.image ?? "")
        }
        
        if objBImage != nil {
            self.addSubview(bottomImage)
            let bottomSpacing = objBImage?.spacing ?? 0
            let bottomPadding = objBImage?.padding ?? 0
            let bottomHeight = objBImage?.height ?? 0
            
            self.bottomTextInset = bottomSpacing + bottomPadding + bottomHeight
            
            if objRImage == nil && objLImage == nil {
                
                self.leftTextInset = (objTImage?.width ?? 0) / 5
                self.rightTextInset = (objTImage?.width ?? 0) / 5
            }
            
            bottomImage.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                                            bottomImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(bottomPadding)),
                                            bottomImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                            bottomImage.heightAnchor.constraint(equalToConstant: bottomHeight),
                                            bottomImage.widthAnchor.constraint(equalToConstant: objBImage?.width ?? 0)])
            
            bottomImage.image = UIImage(systemName: objBImage?.image ?? "")
        }
    }
    
}
