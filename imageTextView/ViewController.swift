//
//  ViewController.swift
//  imageTextView
//
//  Created by Vitor Gomes on 03/05/21.
//

import UIKit

class ViewController: UIViewController {

    let imageObj = Image(image: "house", height: 48, width: 48, spacing: 40, padding: 10)
    let removeTopButtom = UIButton()
    let addTopButton = UIButton()
    let removeLeftButton = UIButton()
    let addLeftButton = UIButton()
    let removeRightButton = UIButton()
    let addRightButton = UIButton()
    let removeBottomButton = UIButton()
    let addBottomButton = UIButton()
    var label: ImageLabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupLayout()

    }
    
    @objc func removeTop() {
        label.removeImage(inPosition: .top)
        print("tap funciona")
    }
    
    @objc func removeLeft() {
        label.removeImage(inPosition: .left)
        print("tap funciona")
    }
    
    @objc func addTop() {
        label.addImage(inPosition: .top)
        print("tap funciona")
    }
    
    @objc func addLeft() {
        label.addImage(inPosition: .left)
        print("tap funciona")
    }
    
    @objc func removeRight() {
        label.removeImage(inPosition: .right)
        print("tap funciona")
    }
    
    @objc func addRight() {
        label.addImage(inPosition: .right)
        print("tap funciona")
    }
    
    @objc func removeBottom() {
        label.removeImage(inPosition: .bottom)
        print("tap funciona")
    }
    
    @objc func addBottom() {
        label.addImage(inPosition: .bottom)
        print("tap funciona")
    }



}

extension ViewController {
    func setupLayout() {
        label = ImageLabel(rightImage: imageObj, leftImage: imageObj, topImage: imageObj, bottomImage: imageObj)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                                        label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                        label.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        //remove top
        view.addSubview(removeTopButtom)
        removeTopButtom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        removeTopButtom.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                                        removeTopButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        removeTopButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        removeTopButtom.setTitle("Remover Imagem Topo", for: .normal)
        removeTopButtom.backgroundColor = .blue
        removeTopButtom.addTarget(self, action: #selector(removeTop), for: .touchUpInside)
        //add top
        view.addSubview(addTopButton)
        addTopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        addTopButton.topAnchor.constraint(equalTo: removeTopButtom.bottomAnchor),
                                        addTopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        addTopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        addTopButton.setTitle("Add Imagem Topo", for: .normal)
        addTopButton.backgroundColor = .green
        addTopButton.addTarget(self, action: #selector(addTop), for: .touchUpInside)
        // remove left
        view.addSubview(removeLeftButton)
        removeLeftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        removeLeftButton.topAnchor.constraint(equalTo: addTopButton.bottomAnchor, constant: 20),
                                        removeLeftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        removeLeftButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        removeLeftButton.setTitle("Remover Imagem Esquerda", for: .normal)
        removeLeftButton.backgroundColor = .red
        removeLeftButton.addTarget(self, action: #selector(removeLeft), for: .touchUpInside)
        
        // add left
        
        view.addSubview(addLeftButton)
        addLeftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        addLeftButton.topAnchor.constraint(equalTo: removeLeftButton.bottomAnchor),
                                        addLeftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        addLeftButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        addLeftButton.setTitle("Add Imagem Esquerda", for: .normal)
        addLeftButton.backgroundColor = .yellow
        addLeftButton.addTarget(self, action: #selector(addLeft), for: .touchUpInside)
        // remove right
        
        view.addSubview(removeRightButton)
        removeRightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        removeRightButton.topAnchor.constraint(equalTo: addLeftButton.bottomAnchor, constant: 20),
                                        removeRightButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        removeRightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        removeRightButton.setTitle("Remove Imagem Direita", for: .normal)
        removeRightButton.backgroundColor = .orange
        removeRightButton.addTarget(self, action: #selector(removeRight), for: .touchUpInside)
        
        //add right
        
        view.addSubview(addRightButton)
        addRightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        addRightButton.topAnchor.constraint(equalTo: removeRightButton.bottomAnchor),
                                        addRightButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        addRightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        addRightButton.setTitle("Add Imagem Esquerda", for: .normal)
        addRightButton.backgroundColor = .yellow
        addRightButton.addTarget(self, action: #selector(addRight), for: .touchUpInside)
    
    
    // remove bottom
    
    view.addSubview(removeBottomButton)
        removeBottomButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
                                    removeBottomButton.topAnchor.constraint(equalTo: addRightButton.bottomAnchor, constant: 20),
                                    removeBottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                    removeBottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    
        removeBottomButton.setTitle("Remove Imagem baixo", for: .normal)
        removeBottomButton.backgroundColor = .orange
        removeBottomButton.addTarget(self, action: #selector(removeBottom), for: .touchUpInside)
    
        //add bottom
        
        view.addSubview(addBottomButton)
        addBottomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        addBottomButton.topAnchor.constraint(equalTo: removeBottomButton.bottomAnchor),
                                        addBottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        addBottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        addBottomButton.setTitle("Add Imagem baixo", for: .normal)
        addBottomButton.backgroundColor = .yellow
        addBottomButton.addTarget(self, action: #selector(addBottom), for: .touchUpInside)

    
    }
         
}

