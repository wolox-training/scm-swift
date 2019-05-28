//
//  LoginView.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 14/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
//Libreria interna con implementaciones propias de Wolox.
import WolmoCore

/*Creo una clase llamada LoginView y luego asocio (En el Identity
 Inspector, en Custom Class) la vista que desee a mi clase para poder interactuar con ella a nivel de codigo.
 */

/*
 UIView es superClass de todos elementos UI.
 */
class LoginView: UIView, NibLoadable {
    
    // MARK: IBOutlet
    @IBOutlet weak var loginButton: UIView! {
        didSet {
            loginButton.layer.cornerRadius = loginButton.layer.frame.height / 2
            loginButton.layer.borderWidth = 1.5
            loginButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var loginFooter: UILabel!
    
    @IBOutlet weak var woloxSymbol: UIView! {
        didSet {
            woloxSymbol.layer.cornerRadius = 25
            woloxSymbol.layer.borderWidth = 1.5
            woloxSymbol.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var logIn: UIButton!
    
    @IBOutlet weak var woloxTitleLabel: UILabel! {
        didSet {
            woloxTitleLabel.setColorToWhite()
        }
    }
    
    // MARK: Action
    @IBAction func logIn(_ sender: UIButton) {
        print("Button pressed")
    }
}
