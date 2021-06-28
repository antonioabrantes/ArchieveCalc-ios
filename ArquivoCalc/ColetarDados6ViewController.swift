//
//  ColetarDados6ViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 05/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ColetarDados6ViewController: UIViewController {

    var list: TiposRegistros!
    
    @IBOutlet weak var editText6Altura: UITextField!
    @IBOutlet weak var editText6Comprimento: UITextField!
    @IBOutlet weak var editText6Largura: UITextField!
    @IBOutlet weak var btn6Calcular: UIButton!
    
    @IBOutlet weak var textView6b1: UILabel!
    @IBOutlet weak var textView6b2: UILabel!
    @IBOutlet weak var textView6b3: UILabel!
    
    var tipo:Int = 6
    var extensao1:Float = 0.0
    var prateleiras1:Float = 0.0
    var extensao2:Float = 0.0
    var prateleiras2:Float = 0.0
    var total:Float = 0.0
    var altura:Float = 0.0
    var comprimento:Float = 0.0
    var largura:Float = 0.0
    var id:Int = 0
    var registros: [NSManagedObject] = []
    var idioma: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        btn6Calcular.layer.cornerRadius = 10
        btn6Calcular.layer.borderWidth = 2
        btn6Calcular.clipsToBounds = true
        btn6Calcular.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)
        
        editText6Altura.keyboardType = .decimalPad
        editText6Comprimento.keyboardType = .decimalPad
        editText6Largura.keyboardType = .decimalPad //.numberPad
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        textView6b1.text = Traducao(idioma: idioma, mensagem: "Altura do monte (m)").getTraducao()
        textView6b2.text = Traducao(idioma: idioma, mensagem: "Comprimento do monte (m)").getTraducao()
        textView6b3.text = Traducao(idioma: idioma, mensagem: "Largura do monte (m)").getTraducao()
        btn6Calcular.setTitle(Traducao(idioma: idioma, mensagem: "Calcular").getTraducao(), for: .normal)


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
        if segue.identifier == "segue6ToCalcularDados"{
            
            let stAltura = editText6Altura.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stComprimento = editText6Comprimento.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stLargura = editText6Largura.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if stAltura == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Altura do monte vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stComprimento == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Comprimento do monte vazio")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stLargura == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Largura do monte vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else {
                
                var txt = String(editText6Altura.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                altura = (txt as NSString).floatValue

                txt = String(editText6Comprimento.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                comprimento = (txt as NSString).floatValue

                txt = String(editText6Largura.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                largura = (txt as NSString).floatValue

                //altura = (editText6Altura.text! as NSString).floatValue
                //comprimento = (editText6Comprimento.text! as NSString).floatValue
                //largura = (editText6Largura.text! as NSString).floatValue
                total = altura*comprimento*largura*12
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
                parametros.setValue(comprimento,forKey:"y")
                parametros.setValue(largura,forKey:"z")
                do {
                    try context.save()
                    print("dados salvos")
                } catch {
                    print("erro ao salvar os dados coletarDados6")
                }
            }
        }
    }
}
