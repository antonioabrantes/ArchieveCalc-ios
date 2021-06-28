//
//  ColetarDados3ViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 05/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ColetarDados3ViewController: UIViewController {

    var list: TiposRegistros!
    @IBOutlet weak var editText3Altura: UITextField!
    @IBOutlet weak var editText3Extensao: UITextField!
    @IBOutlet weak var btn3Calcular: UIButton!
    
    @IBOutlet weak var textView3: UILabel!
    @IBOutlet weak var textView3b: UILabel!
    
    
    var tipo:Int = 3
    var extensao1:Float = 0.0
    var prateleiras1:Float = 0.0
    var extensao2:Float = 0.0
    var prateleiras2:Float = 0.0
    var total:Float = 0.0
    var altura:Float = 0.0
    var extensao:Float = 0.0
    var id:Int = 0
    var registros: [NSManagedObject] = []
    var idioma: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn3Calcular.layer.cornerRadius = 10
        btn3Calcular.layer.borderWidth = 2
        btn3Calcular.clipsToBounds = true
        btn3Calcular.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)

        editText3Altura.keyboardType = .decimalPad
        editText3Extensao.keyboardType = .decimalPad
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        textView3.text = Traducao(idioma: idioma, mensagem: "Altura da pilha de docs (m)").getTraducao()
        textView3b.text = Traducao(idioma: idioma, mensagem: "Extensão da pilha de docs (m)").getTraducao()
        btn3Calcular.setTitle(Traducao(idioma: idioma, mensagem: "Calcular").getTraducao(), for: .normal)

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
        if segue.identifier == "segue3ToCalcularDados"{
            
            let stAltura = editText3Altura.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stExtensao = editText3Extensao.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if stAltura == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Altura vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stExtensao == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Extensão vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else {
                
                var txt = String(editText3Altura.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                altura = (txt as NSString).floatValue

                txt = String(editText3Extensao.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                extensao = (txt as NSString).floatValue
                
                //altura = (editText3Altura.text! as NSString).floatValue
                //extensao = (editText3Extensao.text! as NSString).floatValue
                total = altura + extensao
                print("total: ")
                print(total)
                
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
                
                parametros.setValue(id,forKey: "id")
                parametros.setValue(tipo,forKey:"tipo")
                parametros.setValue(altura,forKey:"x")
                parametros.setValue(extensao,forKey:"y")
                do {
                    try context.save()
                    print("dados salvos")
                } catch {
                    print("erro ao salvar os dados coletarDados3")
                }
            }
        }

    }
 

}
