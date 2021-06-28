//
//  LangViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 24/12/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import UIKit

class LangViewController: UIViewController {
    
    /*
    var titulo : [String: String] =
        ["en": "Language",
         "fr": "Langue",
         "de": "Sprache",
         "es": "Idioma",
         "it": "Lingua",
         "pt": "Idioma",
         "cn": "語言"
         ]
    
    var mensagem : [String: String] =
        ["en": "Set to English",
         "fr": "Ajusté au français",
         "de": "Angepasst and deutsch",
         "es": "Ajustado al español",
         "it": "Adattato all'italiano",
         "pt": "Ajustado para o português",
         "cn": "設為中文"
         ]
     */
    var titulo: String = "Idioma"
    var mensagem: String = "Ajustado para o português"

    @IBAction func btnEnglish(_ sender: UIButton) {
        UserDefaults.standard.set("en",forKey: "idioma")
        let alerta=Alerta(titulo: titulo, mensagem: mensagem)
        self.present(alerta.getAlerta(),animated:true,completion:nil)
    }
    
    
    @IBAction func btnFrench(_ sender: UIButton) {
        UserDefaults.standard.set("fr",forKey: "idioma")
        let alerta=Alerta(titulo: titulo, mensagem: mensagem)
        self.present(alerta.getAlerta(),animated:true,completion:nil)

    }
    
    @IBAction func btnDeutsch(_ sender: UIButton) {
        UserDefaults.standard.set("de",forKey: "idioma")
        let alerta=Alerta(titulo: titulo, mensagem: mensagem)
        self.present(alerta.getAlerta(),animated:true,completion:nil)

    }
    
    @IBAction func btnEspanol(_ sender: UIButton) {
        UserDefaults.standard.set("es",forKey: "idioma")
        let alerta=Alerta(titulo: titulo, mensagem: mensagem)
        self.present(alerta.getAlerta(),animated:true,completion:nil)

    }
    
    @IBAction func btnChina(_ sender: Any) {
        UserDefaults.standard.set("cn",forKey: "idioma")
        let alerta=Alerta(titulo: titulo, mensagem: mensagem)
        self.present(alerta.getAlerta(),animated:true,completion:nil)

    }
    
    @IBAction func btnItalian(_ sender: UIButton) {
        UserDefaults.standard.set("it",forKey: "idioma")
        let alerta=Alerta(titulo: titulo, mensagem: mensagem)
        self.present(alerta.getAlerta(),animated:true,completion:nil)

    }
    
    
    @IBAction func btnPortugues(_ sender: UIButton) {
        UserDefaults.standard.set("pt",forKey: "idioma")
        let alerta=Alerta(titulo: titulo, mensagem: mensagem)
        self.present(alerta.getAlerta(),animated:true,completion:nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
