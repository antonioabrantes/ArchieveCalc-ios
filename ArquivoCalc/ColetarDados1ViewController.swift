//
//  ColetarDados1ViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 05/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ColetarDados1ViewController: UIViewController {
    
    @IBOutlet weak var editText1Extensao1: UITextField!
    @IBOutlet weak var editText1Prateleiras1: UITextField!
    @IBOutlet weak var editText1Extensao2: UITextField!
    @IBOutlet weak var editText1Prateleiras2: UITextField!
    @IBOutlet weak var btn1Calcular: UIButton!
    
    
    @IBOutlet weak var textView1b1: UILabel!
    @IBOutlet weak var textView1b2: UILabel!
    @IBOutlet weak var textView1b3: UILabel!
    @IBOutlet weak var textView1b4: UILabel!
    
    var tipo:Int = 1
    var extensao1:Float = 0.0
    var prateleiras1:Float = 0.0
    var extensao2:Float = 0.0
    var prateleiras2:Float = 0.0
    var total:Float = 0.0
    var id:Int = 0
    var registros: [NSManagedObject] = []
    var idioma: String = ""

    var list: TiposRegistros!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1Calcular.layer.cornerRadius = 10
        btn1Calcular.layer.borderWidth = 2
        btn1Calcular.clipsToBounds = true
        btn1Calcular.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)
        
        editText1Extensao1.keyboardType = .decimalPad
        editText1Prateleiras1.keyboardType = .numberPad
        editText1Extensao2.keyboardType = .decimalPad
        editText1Prateleiras2.keyboardType = .numberPad
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        textView1b1.text = Traducao(idioma: idioma, mensagem: "Extensão A (m)").getTraducao()
        textView1b2.text = Traducao(idioma: idioma, mensagem: "Número de prateleiras A").getTraducao()
        textView1b3.text = Traducao(idioma: idioma, mensagem: "Extensão B (m)").getTraducao()
        textView1b4.text = Traducao(idioma: idioma, mensagem: "Número de prateleiras B").getTraducao()
        btn1Calcular.setTitle(Traducao(idioma: idioma, mensagem: "Calcular").getTraducao(), for: .normal)

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segue1ToCalcularDados"{
            
            let stExtensao1 = editText1Extensao1.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stPrateleiras1 = editText1Prateleiras1.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stExtensao2 = editText1Extensao2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stPrateleiras2 = editText1Prateleiras2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if stExtensao1 == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Extensão A vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stPrateleiras1 == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Número de Prateleiras A vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stExtensao2 == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Extensão B vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stPrateleiras2 == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Número de Prateleiras B vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else {
            
            var txt = String(editText1Extensao1.text!)
            txt = txt.replacingOccurrences(of: ",", with: ".")
            extensao1 = (txt as NSString).floatValue
                
            txt = String(editText1Prateleiras1.text!)
            txt = txt.replacingOccurrences(of: ",", with: ".")
            prateleiras1 = (txt as NSString).floatValue

            txt = String(editText1Extensao2.text!)
            txt = txt.replacingOccurrences(of: ",", with: ".")
            extensao2 = (txt as NSString).floatValue
                
            txt = String(editText1Prateleiras2.text!)
            txt = txt.replacingOccurrences(of: ",", with: ".")
            prateleiras2 = (txt as NSString).floatValue

            //prateleiras1 = (editText1Prateleiras1.text! as NSString).floatValue
            //extensao2 = (editText1Extensao2.text! as NSString).floatValue
            //prateleiras2 = (editText1Prateleiras2.text! as NSString).floatValue
            total = prateleiras1*extensao1 + prateleiras2*extensao2
            /*
            print("total: ")
            print(total)
            print("extensao: ")
            print(extensao1)
            let valor = Arredondar(valor: extensao1, casas: 2, ceilOrFloor: 3).getArredondado()
            print("valor: ")
            print(valor)
            */

            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let parametros = NSEntityDescription.insertNewObject(forEntityName:"Parametros", into: context)
            
            let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Parametros")
            do {
                let param = try context.fetch(requisicao)
                /// determine o valor maximo de id neste array
                var max = 0
                registros = param as! [NSManagedObject]
                for registro in registros {
                    id = registro.value(forKey: "id") as! Int
                    if (id > max) {
                        max = id
                    }
                }
                //id = parametros.count + 1
                id = max + 1
                print("salvei em id= "+String(id))
            }catch{
                let fetchError = error as NSError
                print(fetchError)
            }
            //print("id = ")
            //print(id)
            
            let uuid = NSUUID()
            parametros.setValue(tipo,forKey:"tipo")
            parametros.setValue(uuid,forKey: "uuid")
            parametros.setValue(id,forKey: "id")
            parametros.setValue(extensao1,forKey:"x")
            parametros.setValue(prateleiras1,forKey:"y")
            parametros.setValue(extensao2,forKey:"z")
            parametros.setValue(prateleiras2,forKey:"w")
            do {
                try context.save()
                print("dados salvos")
            } catch {
                print("erro ao salvar os dados coletarDados1")
            }
            }
        }
    }


}
