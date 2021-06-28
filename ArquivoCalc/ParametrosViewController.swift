//
//  ParametrosViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 15/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import CoreData

class ParametrosViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var textView1: UILabel!
    @IBOutlet weak var edtParametro: UITextField!
    @IBOutlet weak var textView1c: UILabel!
    @IBOutlet weak var spinner: UIPickerView!
    @IBOutlet weak var btnCalcular: UIButton!
    @IBOutlet weak var txvtEstante: UILabel!
    @IBOutlet weak var btnEstante: UIButton!
    
    var context:NSManagedObjectContext!
    var registros: [NSManagedObject] = []
    var idioma: String = ""
    
    var lista_parametros: [String] = [String]()
    var id:Int = 0
    var volumeMetroLinear:Float = 0.0
    var pesoMetroLinear:Int = 0
    var caixasEstante:Int = 0
    var areaEstante:Float = 0.0
    var caixasMetroLinear:Float = 0.0
    var parametro = String()
    var selecionado = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCalcular.layer.cornerRadius = 10
        btnCalcular.layer.borderWidth = 2
        btnCalcular.clipsToBounds = true
        btnCalcular.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)
        
        btnEstante.layer.cornerRadius = 10
        btnEstante.layer.borderWidth = 2
        btnEstante.clipsToBounds = true
        btnEstante.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)
        
        edtParametro.keyboardType = .decimalPad
        
        // http://codewithchris.com/uipickerview-example
        self.spinner.delegate = self
        self.spinner.dataSource = self
        selecionado = 0 // "Caixas Arquivo" // valor default

        idioma = UserDefaults.standard.string(forKey: "idioma")!
        lista_parametros = [Traducao(idioma: idioma, mensagem: "Caixas Arquivo").getTraducao(),Traducao(idioma: idioma, mensagem: "Metro Linear Total").getTraducao(),Traducao(idioma: idioma, mensagem: "Área Física da Estante").getTraducao(),Traducao(idioma: idioma, mensagem: "Volume (m3) Documental").getTraducao(),Traducao(idioma: idioma, mensagem: "Número de Estantes").getTraducao()]
        //lista_parametros = ["Caixas Arquivo","Metro Linear Total","Área Física da Estante","Volume (m3) Documental","Número de Estantes"]
        print(Traducao(idioma: idioma, mensagem: "Caixas Arquivo").getTraducao())

        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Estante")
        do {
            let parametros = try context.fetch(requisicao)
            if parametros.count > 0 {
                self.registros = parametros as! [NSManagedObject]
                for registro in registros {
                    volumeMetroLinear = registro.value(forKey:"volume") as! Float
                    pesoMetroLinear = registro.value(forKey:"peso") as! Int
                    caixasEstante = registro.value(forKey:"caixas") as! Int
                    areaEstante = registro.value(forKey:"area") as! Float
                    caixasMetroLinear = registro.value(forKey:"cml") as! Float
                }
            } else {
                volumeMetroLinear = 0.08
                pesoMetroLinear = 50
                caixasEstante = 36
                areaEstante = 1.00
                caixasMetroLinear = 0.14
                id = 1
                let p2 = NSEntityDescription.insertNewObject(forEntityName:"Estante", into: context)
                p2.setValue(id,forKey: "id")
                p2.setValue(volumeMetroLinear,forKey: "volume")
                p2.setValue(pesoMetroLinear,forKey: "peso")
                p2.setValue(caixasEstante,forKey: "caixas")
                p2.setValue(areaEstante,forKey: "area")
                p2.setValue(caixasMetroLinear,forKey: "cml")
                do {
                    try context.save()
                } catch {
                    print("erro ao salvar os dados estante")
                }
            }
        }catch let erro as NSError{
            print("Erro ler Estante"+erro.description)
        }
        
        //textView1.text = "Digite o parâmetro:"
        textView1.text = Traducao(idioma: idioma, mensagem: "Digite o parâmetro:").getTraducao()
        //textView1c.text = "Selecione o tipo de parâmetro:"
        textView1c.text = Traducao(idioma: idioma, mensagem: "Selecione o tipo de parâmetro:").getTraducao()
        btnCalcular.setTitle(Traducao(idioma: idioma, mensagem: "Calcular").getTraducao(), for: .normal)
        var xNSNumber = caixasEstante as NSNumber
        let xcaixasEstante : String = xNSNumber.stringValue
        xNSNumber = volumeMetroLinear as NSNumber
        let xvolumeMetroLinear : String = xNSNumber.stringValue
        xNSNumber = pesoMetroLinear as NSNumber
        let xpesoMetroLinear : String = xNSNumber.stringValue
        xNSNumber = areaEstante as NSNumber
        let xareaEstante : String = xNSNumber.stringValue
        xNSNumber = caixasMetroLinear as NSNumber
        let xcaixasMetroLinear : String = xNSNumber.stringValue

        txvtEstante.text = Traducao(idioma: idioma, mensagem: "Estante com ").getTraducao()+xcaixasEstante+Traducao(idioma: idioma, mensagem: " caixas arquivo e área de ").getTraducao()+xareaEstante+Traducao(idioma: idioma, mensagem: " m2 \n Cada caixa arquivo com ").getTraducao()+xcaixasMetroLinear+Traducao(idioma: idioma, mensagem: " metros lineares \n Cada metro linear com ").getTraducao()+xpesoMetroLinear+Traducao(idioma: idioma, mensagem: " Kg de peso \n Cada metro linear com ").getTraducao()+xvolumeMetroLinear+Traducao(idioma: idioma, mensagem: " m3 de volume").getTraducao()
        
        btnEstante.setTitle(Traducao(idioma: idioma, mensagem: "Ajustar parâmetros Arquivo").getTraducao(), for: .normal)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lista_parametros.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lista_parametros[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selecionado = row
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Estante")
        do {
            let parametros = try context.fetch(requisicao)
            if parametros.count > 0 {
                self.registros = parametros as! [NSManagedObject]
                for registro in registros {
                    volumeMetroLinear = registro.value(forKey:"volume") as! Float
                    pesoMetroLinear = registro.value(forKey:"peso") as! Int
                    caixasEstante = registro.value(forKey:"caixas") as! Int
                    areaEstante = registro.value(forKey:"area") as! Float
                    caixasMetroLinear = registro.value(forKey:"cml") as! Float
                }
            }
        }catch let erro as NSError{
            print("Erro ler Estante"+erro.description)
        }
        
        
        var xNSNumber = caixasEstante as NSNumber
        let xcaixasEstante : String = xNSNumber.stringValue
        xNSNumber = volumeMetroLinear as NSNumber
        let xvolumeMetroLinear : String = xNSNumber.stringValue
        xNSNumber = pesoMetroLinear as NSNumber
        let xpesoMetroLinear : String = xNSNumber.stringValue
        xNSNumber = areaEstante as NSNumber
        let xareaEstante : String = xNSNumber.stringValue
        xNSNumber = caixasMetroLinear as NSNumber
        let xcaixasMetroLinear : String = xNSNumber.stringValue
        
        //txvtEstante.text = "Estante com "+xcaixasEstante+" caixas arquivo e área de "+xareaEstante+"m2 \n Cada caixa arquivo com "+xcaixasMetroLinear+" metros lineares \n Cada metro linear com "+xpesoMetroLinear+" Kg de peso \n Cada metro linear com "+xvolumeMetroLinear+" m3 de volume"
        txvtEstante.text = Traducao(idioma: idioma, mensagem: "Estante com ").getTraducao()+xcaixasEstante+Traducao(idioma: idioma, mensagem: " caixas arquivo e área de ").getTraducao()+xareaEstante+Traducao(idioma: idioma, mensagem: " m2 \n Cada caixa arquivo com ").getTraducao()+xcaixasMetroLinear+Traducao(idioma: idioma, mensagem: " metros lineares \n Cada metro linear com ").getTraducao()+xpesoMetroLinear+Traducao(idioma: idioma, mensagem: " Kg de peso \n Cada metro linear com ").getTraducao()+xvolumeMetroLinear+Traducao(idioma: idioma, mensagem: " m3 de volume").getTraducao()

        idioma = UserDefaults.standard.string(forKey: "idioma") ?? ""
        textView1.text = Traducao(idioma: idioma, mensagem: "Digite o parâmetro:").getTraducao()
        //textView1c.text = "Selecione o tipo de parâmetro:"
        textView1c.text = Traducao(idioma: idioma, mensagem: "Selecione o tipo de parâmetro:").getTraducao()
        btnCalcular.setTitle(Traducao(idioma: idioma, mensagem: "Calcular").getTraducao(), for: .normal)

    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueToEditarEstante"{
            let viewControllerDestino = segue.destination as! EditarEstanteViewController
            viewControllerDestino.volumeMetroLinear = volumeMetroLinear
            viewControllerDestino.pesoMetroLinear = pesoMetroLinear
            viewControllerDestino.caixasEstante = caixasEstante
            viewControllerDestino.areaEstante = areaEstante
            viewControllerDestino.caixasMetroLinear = caixasMetroLinear
        }
        
        if segue.identifier == "segueToCalcularParametros"{
            let viewControllerDestino = segue.destination as! CalcularParametrosViewController
            parametro = String(edtParametro.text!)
            viewControllerDestino.parametro = parametro
            viewControllerDestino.selecionado = selecionado
            viewControllerDestino.volumeMetroLinear = volumeMetroLinear
            viewControllerDestino.pesoMetroLinear = pesoMetroLinear
            viewControllerDestino.caixasEstante = caixasEstante
            viewControllerDestino.areaEstante = areaEstante
            viewControllerDestino.caixasMetroLinear = caixasMetroLinear
        }
        
    }
    

}
