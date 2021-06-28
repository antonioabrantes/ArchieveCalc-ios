//
//  ColetarDados4ViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 05/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ColetarDados4ViewController: UIViewController {

    var list: TiposRegistros!
    
    @IBOutlet weak var editText4Profundidade1: UITextField!
    @IBOutlet weak var editText4Profundidade2: UITextField!
    @IBOutlet weak var btn4Calcular: UIButton!
    @IBOutlet weak var textView4: UILabel!
    @IBOutlet weak var textView4b: UILabel!
    
    var tipo:Int = 4
    var extensao1:Float = 0.0
    var prateleiras1:Float = 0.0
    var extensao2:Float = 0.0
    var prateleiras2:Float = 0.0
    var total:Float = 0.0
    var profundidade1:Float = 0.0
    var profundidade2:Float = 0.0
    var id:Int = 0
    var registros: [NSManagedObject] = []
    var idioma: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        btn4Calcular.layer.cornerRadius = 10
        btn4Calcular.layer.borderWidth = 2
        btn4Calcular.clipsToBounds = true
        btn4Calcular.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)
        
        editText4Profundidade1.keyboardType = .decimalPad
        editText4Profundidade2.keyboardType = .decimalPad
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        textView4.text = Traducao(idioma: idioma, mensagem: "Profundidade da 1a gaveta (m)").getTraducao()
        textView4b.text = Traducao(idioma: idioma, mensagem: "Profundidade da 2a gaveta (m)").getTraducao()
        btn4Calcular.setTitle(Traducao(idioma: idioma, mensagem: "Calcular").getTraducao(), for: .normal)


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
        if segue.identifier == "segue4ToCalcularDados"{
            
            let stProfundidade1 = editText4Profundidade1.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stProfundidade2 = editText4Profundidade2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if stProfundidade1 == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Profundidade da primeira gaveta vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stProfundidade2 == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Profundidade da segunda gaveta vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else {
                
                var txt = String(editText4Profundidade1.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                profundidade1 = (txt as NSString).floatValue

                txt = String(editText4Profundidade2.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                profundidade2 = (txt as NSString).floatValue

                //profundidade1 = (editText4Profundidade1.text! as NSString).floatValue
                //profundidade2 = (editText4Profundidade2.text! as NSString).floatValue
                total = profundidade1 + profundidade2
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
                parametros.setValue(profundidade1,forKey:"x")
                parametros.setValue(profundidade2,forKey:"y")
                do {
                    try context.save()
                    print("dados salvos")
                } catch {
                    print("erro ao salvar os dados coletarDados4")
                }
            }
        }
    }
   
}
