//
//  ViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 23/12/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblHistoriaMetroLinear: UILabel!
    @IBOutlet weak var lblParametros: UILabel!
    @IBAction func btnParametros(_ sender: Any) {
    }
    
    
    @IBOutlet weak var lblMetroLinear: UILabel!
    @IBAction func btnMetroLinear(_ sender: Any) {
    }
    
    var idioma: String = ""
    var idiomaLocalized: String = ""
    var metro_linear: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  flags from <div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        metro_linear = UserDefaults.standard.object(forKey: "metro_linear") as! Float
 /*
         configurar o AppDelegate.swift
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
 // Override point for customization after application launch.
 if UserDefaults.standard.string(forKey: "idioma") == nil {
 UserDefaults.standard.setValue("br",forKey: "idioma")
 }
 return true
 }
 */
        if idioma == "" {
            idiomaLocalized = NSLocalizedString("lang", comment: "")
            print("Idioma Localized = "+idiomaLocalized)
            UserDefaults.standard.set(idiomaLocalized,forKey: "idioma")
        }

        print("Idioma = "+idioma)

        //UserDefaults.standard.set(["fr"], forKey: "AppleLanguages")
        //UserDefaults.standard.synchronize()
        
        //lblParametros.text = NSLocalizedString("CalcFileParam", comment: "")
        //lblMetroLinear.text = NSLocalizedString("CalcLinearMeter", comment: "")
        
        lblParametros.text = Traducao(idioma: idioma, mensagem: "Calcula parâmetros de arquivo").getTraducao()
        lblMetroLinear.text = Traducao(idioma: idioma, mensagem: "Calcula metro linear").getTraducao()
        lblHistoriaMetroLinear.text = Traducao(idioma: idioma, mensagem: "Últimos cálculos de metro linear").getTraducao()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        idioma = UserDefaults.standard.string(forKey: "idioma") ?? ""
        lblParametros.text = Traducao(idioma: idioma, mensagem: "Calcula parâmetros de arquivo").getTraducao()
        lblMetroLinear.text = Traducao(idioma: idioma, mensagem: "Calcula metro linear").getTraducao()
        lblHistoriaMetroLinear.text = Traducao(idioma: idioma, mensagem: "Últimos cálculos de metro linear").getTraducao()
    }


}

