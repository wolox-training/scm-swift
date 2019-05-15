//
//  ViewController.swift
//  WBooks
//
//  Created by Guido Marucci Blas on 4/3/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit
//Libreria interna con implementaciones propias de Wolox.
import WolmoCore

final class ViewController: UIViewController {
    
    //Carga el .xib asociado a la calse LoginView.
    private var _view: LoginView = LoginView.loadFromNib()!
    
    //Ajuro hay que definir una initializacion.
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // A la vista del ViewControler, has referencia (NO copia) la vista "_view" de LoginView.
        view = _view
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _view.loginButton.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
