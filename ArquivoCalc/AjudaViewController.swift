//
//  AjudaViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 20/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit

class AjudaViewController: UIViewController {


    @IBOutlet weak var txtView1: UILabel!
    @IBOutlet weak var txtView2: UILabel!
    @IBOutlet weak var txtAjuda: UILabel!
    @IBOutlet weak var txtContato: UILabel!
    
    var texto = String()
    var idioma = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idioma = UserDefaults.standard.string(forKey: "idioma") ?? ""
        txtView1.text = Traducao(idioma: idioma, mensagem: "Arquivo Calc Calculadora de Arquivos").getTraducao()
        txtView2.text = Traducao(idioma: idioma, mensagem: "Esse app foi desenvolvido por").getTraducao() + " Antonio Abrantes & Paula Cotrim - 2019"
        txtAjuda.text = Traducao(idioma: idioma, mensagem: "Ajuda").getTraducao()
        txtContato.text = Traducao(idioma: idioma, mensagem: "Contato:").getTraducao() + " contatottdd@gmail.com"


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
