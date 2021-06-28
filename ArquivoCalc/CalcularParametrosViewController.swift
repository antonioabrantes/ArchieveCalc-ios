//
//  CalcularParametrosViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 18/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit

class CalcularParametrosViewController: UIViewController {

    @IBOutlet weak var textView01: UILabel!
    @IBOutlet weak var textView0201: UILabel!
    @IBOutlet weak var textView0301: UILabel!
    @IBOutlet weak var textView0401: UILabel!
    @IBOutlet weak var textView0501: UILabel!
    @IBOutlet weak var textView0601: UILabel!
    @IBOutlet weak var textView0701: UILabel!
    
    @IBOutlet weak var txtViewMetroLinear: UILabel!
    @IBOutlet weak var txtViewPeso: UILabel!
    @IBOutlet weak var txtViewVolume: UILabel!
    @IBOutlet weak var txtViewCaixa: UILabel!
    @IBOutlet weak var txtViewEstante: UILabel!
    @IBOutlet weak var txtViewArea: UILabel!
    
    
    @IBAction func btnCopiarParamOnClick(_ sender: Any) {
        UIPasteboard.general.string = texto_parametros
        let alerta=Alerta(titulo: "Aviso", mensagem: "Parâmetros copiados para área de transferência")
        self.present(alerta.getAlerta(),animated:true,completion:nil)
    }
    
    var texto_parametros: String = ""
    
    var id = Int()
    var volumeMetroLinear = Float()
    var pesoMetroLinear = Int()
    var caixasEstante = Int()
    var areaEstante = Float()
    var caixasMetroLinear = Float()
    var parametro = String()
    var selecionado = Int()
    var texto = String()
    
    var fcaixa = Float()
    var fmetro = Float()
    var fpeso = Float()
    var fvolume = Float()
    var festante = Float()
    var farea = Float()
    
    var metro = String()
    var peso = String()
    var volume = String()
    var estante = String()
    var area = String()
    var caixa = String()
    var idioma: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        textView01.text = Traducao(idioma: idioma, mensagem: "Parâmetros").getTraducao()
        textView0201.text = Traducao(idioma: idioma, mensagem: "Metro Linear Total").getTraducao() + ":"
        textView0301.text = Traducao(idioma: idioma, mensagem: "Peso (kg) Documental").getTraducao() + ":"
        textView0401.text = Traducao(idioma: idioma, mensagem: "Volume (m3) Documental").getTraducao() + ":"
        textView0501.text = Traducao(idioma: idioma, mensagem: "Caixas Arquivo").getTraducao() + ":"
        texto = Traducao(idioma: idioma, mensagem: "Estante").getTraducao() +  "("+String(caixasEstante)+" cx):"
        textView0601.text = texto
        textView0701.text = Traducao(idioma: idioma, mensagem: "Área Física da Estante").getTraducao() + ":" + "(m2):"
        
        parametro = parametro.replacingOccurrences(of: ",", with: ".")
        
        if (selecionado == 0){ // "Caixas Arquivo"
            fcaixa = (parametro as NSString).floatValue
            fmetro = fcaixa*caixasMetroLinear
            fpeso = fmetro*Float(pesoMetroLinear)
            fvolume = fmetro*volumeMetroLinear
            festante = fcaixa/Float(caixasEstante)
            farea = festante*areaEstante
            
            fmetro = Arredondar(valor: fmetro, casas: 2, ceilOrFloor: 0).getArredondado()
            fpeso = Arredondar(valor: fpeso, casas: 2, ceilOrFloor: 0).getArredondado()
            fvolume = Arredondar(valor: fvolume, casas: 3, ceilOrFloor: 0).getArredondado()
            fcaixa = Arredondar(valor: fcaixa, casas: 0, ceilOrFloor: 0).getArredondado()
            festante = Arredondar(valor: festante, casas: 0, ceilOrFloor: 1).getArredondado()
            farea = Arredondar(valor: farea, casas: 2, ceilOrFloor: 0).getArredondado()
         
            metro = String(fmetro)
            txtViewMetroLinear.text = metro
            peso = String(fpeso)
            txtViewPeso.text = peso
            volume =  String(fvolume)
            txtViewVolume.text = volume
            txtViewCaixa.text = parametro
            caixa = parametro
            estante = String(festante)
            txtViewEstante.text = estante
            area = String(farea)
            txtViewArea.text = area
        } else if (selecionado == 1 ) { // "Metro Linear Total"
            fmetro = (parametro as NSString).floatValue
            fpeso = fmetro*Float(pesoMetroLinear)
            fvolume = fmetro*volumeMetroLinear
            fcaixa = fmetro/caixasMetroLinear
            festante = fcaixa/Float(caixasEstante)
            farea = festante*areaEstante
            
            fmetro = Arredondar(valor: fmetro, casas: 2, ceilOrFloor: 0).getArredondado()
            fpeso = Arredondar(valor: fpeso, casas: 2, ceilOrFloor: 0).getArredondado()
            fvolume = Arredondar(valor: fvolume, casas: 3, ceilOrFloor: 0).getArredondado()
            fcaixa = Arredondar(valor: fcaixa, casas: 0, ceilOrFloor: 0).getArredondado()
            festante = Arredondar(valor: festante, casas: 0, ceilOrFloor: 1).getArredondado()
            farea = Arredondar(valor: farea, casas: 2, ceilOrFloor: 0).getArredondado()
            
            txtViewMetroLinear.text = parametro
            metro = parametro
            peso = String(fpeso)
            txtViewPeso.text = peso
            volume =  String(fvolume)
            txtViewVolume.text = volume
            caixa =  String(fcaixa)
            txtViewCaixa.text = caixa
            estante = String(festante)
            txtViewEstante.text = estante
            area = String(farea)
            txtViewArea.text = area
        } else if (selecionado == 2 ) { // "Área Física das Estantes"
            farea = (parametro as NSString).floatValue
            festante = farea / areaEstante
            fcaixa = Float(caixasEstante) * festante
            fmetro = fcaixa * caixasMetroLinear
            fpeso = fmetro*Float(pesoMetroLinear)
            fvolume = fmetro*volumeMetroLinear
            
            fmetro = Arredondar(valor: fmetro, casas: 2, ceilOrFloor: 0).getArredondado()
            fpeso = Arredondar(valor: fpeso, casas: 2, ceilOrFloor: 0).getArredondado()
            fvolume = Arredondar(valor: fvolume, casas: 3, ceilOrFloor: 0).getArredondado()
            fcaixa = Arredondar(valor: fcaixa, casas: 0, ceilOrFloor: 0).getArredondado()
            festante = Arredondar(valor: festante, casas: 0, ceilOrFloor: 1).getArredondado()
            farea = Arredondar(valor: farea, casas: 2, ceilOrFloor: 0).getArredondado()
            
            metro = String(fmetro)
            txtViewMetroLinear.text = metro
            peso = String(fpeso)
            txtViewPeso.text = peso
            volume =  String(fvolume)
            txtViewVolume.text = volume
            caixa =  String(fcaixa)
            txtViewCaixa.text = caixa
            estante = String(festante)
            txtViewEstante.text = estante
            txtViewArea.text = parametro
            area = parametro
        } else if (selecionado == 3 ) { // "Volume (m3) Documental"
            fvolume = (parametro as NSString).floatValue
            fmetro = fvolume / volumeMetroLinear
            fcaixa = fmetro / caixasMetroLinear
            festante = fcaixa / Float(caixasEstante)
            farea = areaEstante * festante
            fpeso = fmetro*Float(pesoMetroLinear)

            fmetro = Arredondar(valor: fmetro, casas: 2, ceilOrFloor: 0).getArredondado()
            fpeso = Arredondar(valor: fpeso, casas: 2, ceilOrFloor: 0).getArredondado()
            fvolume = Arredondar(valor: fvolume, casas: 3, ceilOrFloor: 0).getArredondado()
            fcaixa = Arredondar(valor: fcaixa, casas: 0, ceilOrFloor: 0).getArredondado()
            festante = Arredondar(valor: festante, casas: 0, ceilOrFloor: 1).getArredondado()
            farea = Arredondar(valor: farea, casas: 2, ceilOrFloor: 0).getArredondado()
            
            metro = String(fmetro)
            txtViewMetroLinear.text = metro
            peso = String(fpeso)
            txtViewPeso.text = peso
            txtViewVolume.text = parametro
            volume = parametro
            caixa =  String(fcaixa)
            txtViewCaixa.text = caixa
            estante = String(festante)
            txtViewEstante.text = estante
            area = String(farea)
            txtViewArea.text = area
        } else if (selecionado == 4 ) { // "Número de Estantes"
            festante = (parametro as NSString).floatValue
            fcaixa = festante*Float(caixasEstante)
            fmetro = fcaixa*caixasMetroLinear
            fvolume = volumeMetroLinear*fmetro
            farea = areaEstante * festante
            fpeso = fmetro*Float(pesoMetroLinear)

            fmetro = Arredondar(valor: fmetro, casas: 2, ceilOrFloor: 0).getArredondado()
            fpeso = Arredondar(valor: fpeso, casas: 2, ceilOrFloor: 0).getArredondado()
            fvolume = Arredondar(valor: fvolume, casas: 3, ceilOrFloor: 0).getArredondado()
            fcaixa = Arredondar(valor: fcaixa, casas: 0, ceilOrFloor: 0).getArredondado()
            festante = Arredondar(valor: festante, casas: 0, ceilOrFloor: 1).getArredondado()
            farea = Arredondar(valor: farea, casas: 2, ceilOrFloor: 0).getArredondado()
            
            metro = String(fmetro)
            txtViewMetroLinear.text = metro
            peso = String(fpeso)
            txtViewPeso.text = peso
            volume = String(fvolume)
            txtViewVolume.text = volume
            caixa =  String(fcaixa)
            txtViewCaixa.text = caixa
            txtViewEstante.text = parametro
            estante = parametro
            area = String(farea)
            txtViewArea.text = area
        }
        
        texto_parametros = Traducao(idioma: idioma, mensagem: "Parâmetros").getTraducao() + "\n\n"
        texto_parametros = texto_parametros + Traducao(idioma: idioma, mensagem: "Metro Linear Total").getTraducao() + ": "
        texto_parametros = texto_parametros + metro + "\n"
        texto_parametros = texto_parametros + Traducao(idioma: idioma, mensagem: "Peso (kg) Documental").getTraducao() + ": "
        texto_parametros = texto_parametros + peso + "\n"
        texto_parametros = texto_parametros + Traducao(idioma: idioma, mensagem: "Volume (m3) Documental").getTraducao() + ": "
        texto_parametros = texto_parametros + volume + "\n"
        texto_parametros = texto_parametros + Traducao(idioma: idioma, mensagem: "Caixas Arquivo").getTraducao() + ": "
        texto_parametros = texto_parametros + caixa + "\n"
        texto_parametros = texto_parametros + Traducao(idioma: idioma, mensagem: "Estante").getTraducao() +  "("+String(caixasEstante)+" cx): "
        texto_parametros = texto_parametros + estante + "\n"
        texto_parametros = texto_parametros + Traducao(idioma: idioma, mensagem: "Área Física da Estante").getTraducao() + ":" + "(m2): "
        texto_parametros = texto_parametros + area + "\n"

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
