//
//  ImageTextView.swift
//  imageTextView
//
//  Created by Vitor Gomes on 03/05/21.
//

import Foundation
import UIKit

enum ImagePositioning {
    case top
    case left
    case right
    case bottom
}

class ImageTextView: UIView {
    
    let label = Label()
    let image = UIImageView()
    let imageOn: ImagePositioning
    let withSpacing: CGFloat
    let imageHeight: CGFloat
    let imageWidth: CGFloat
    
    
    init(frame: CGRect, imageOn: ImagePositioning, withSpacing: CGFloat, imageHeight: CGFloat, imageWidth: CGFloat) {
        self.imageOn = imageOn
        self.withSpacing = withSpacing
        self.imageHeight = imageHeight
        self.imageWidth = imageWidth
        super.init(frame: frame)
        imagePosition(imagePosition: self.imageOn, withSpace: self.withSpacing)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imagePosition(imagePosition: ImagePositioning, withSpace: CGFloat) {
        switch imagePosition {
        case .top:
            setupTopLayout(space: withSpace, height: imageHeight, width: imageWidth)
        case .left:
            setupLeftLayout(space: withSpace, height: imageHeight, width: imageWidth)
        case .bottom:
            setupBottomLayout(space: withSpace, height: imageHeight, width: imageWidth)
        default:
            setupLayout(space: withSpace, height: imageHeight, width: imageWidth)
        }
    }
    
}

extension ImageTextView {
    func setupLayout(space: CGFloat, height: CGFloat, width: CGFloat) {
        self.addSubview(label)
        self.addSubview(image)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -space).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.text = "Label"
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: height).isActive = true
        image.widthAnchor.constraint(equalToConstant: width).isActive = true
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        image.image = UIImage(systemName: "magnifyingglass")
    }
    func setupLeftLayout(space: CGFloat, height: CGFloat, width: CGFloat) {
        self.addSubview(label)
        self.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: height).isActive = true
        image.widthAnchor.constraint(equalToConstant: width).isActive = true
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        image.image = UIImage(systemName: "magnifyingglass")

        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: space).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.text = "Label"
    }
    
    func setupTopLayout(space: CGFloat, height: CGFloat, width: CGFloat) {
        self.addSubview(label)
        self.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: height).isActive = true
        image.widthAnchor.constraint(equalToConstant: width).isActive = true
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        image.image = UIImage(systemName: "magnifyingglass")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: space).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.text = "Label"
    }
    
    func setupBottomLayout(space: CGFloat, height: CGFloat, width: CGFloat) {
        self.addSubview(label)
        self.addSubview(image)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.text = "Label"
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: label.bottomAnchor, constant: space).isActive = true
        image.heightAnchor.constraint(equalToConstant: height).isActive = true
        image.widthAnchor.constraint(equalToConstant: width).isActive = true
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        image.image = UIImage(systemName: "magnifyingglass")

    }
    
}

