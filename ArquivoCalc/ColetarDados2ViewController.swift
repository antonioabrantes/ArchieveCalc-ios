//
//  ColetarDados2ViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 05/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ColetarDados2ViewController: UIViewController {

    var list: TiposRegistros!
    @IBOutlet weak var editText2Altura1: UITextField!
    @IBOutlet weak var editText2Altura2: UITextField!
    @IBOutlet weak var btn2Calcular: UIButton!
    
    @IBOutlet weak var textView2: UILabel!
    @IBOutlet weak var textView2b: UILabel!
    
    var tipo:Int = 2
    var extensao1:Float = 0.0
    var prateleiras1:Float = 0.0
    var extensao2:Float = 0.0
    var prateleiras2:Float = 0.0
    var total:Float = 0.0
    var altura1:Float = 0.0
    var altura2:Float = 0.0
    var id:Int = 0
    var registros: [NSManagedObject] = []
    var idioma: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn2Calcular.layer.cornerRadius = 10
        btn2Calcular.layer.borderWidth = 2
        btn2Calcular.clipsToBounds = true
        btn2Calcular.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)

        editText2Altura1.keyboardType = .decimalPad
        editText2Altura2.keyboardType = .decimalPad
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        textView2.text = Traducao(idioma: idioma, mensagem: "Altura da 1a pilha de docs (m)").getTraducao()
        textView2b.text = Traducao(idioma: idioma, mensagem: "Altura da 2a pilha de docs (m)").getTraducao()
        btn2Calcular.setTitle(Traducao(idioma: idioma, mensagem: "Calcular").getTraducao(), for: .normal)

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
        if segue.identifier == "segue2ToCalcularDados"{
            
            let stAltura1 = editText2Altura1.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stAltura2 = editText2Altura2.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            if stAltura1 == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Altura 1 vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stAltura2 == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Altura 2 vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else {
                
                var txt = String(editText2Altura1.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                altura1 = (txt as NSString).floatValue

                txt = String(editText2Altura2.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                altura2 = (txt as NSString).floatValue

                //altura1 = (editText2Altura1.text! as NSString).floatValue
                //altura2 = (editText2Altura2.text! as NSString).floatValue
                total = altura1 + altura2
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
                parametros.setValue(altura1,forKey:"x")
                parametros.setValue(altura2,forKey:"y")
                do {
                    try context.save()
                    print("dados salvos")
                } catch {
                    print("erro ao salvar os dados coletarDados2")
                }
            }
        }
    }


}
