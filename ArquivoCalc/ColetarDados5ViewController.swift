//
//  ColetarDados5ViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 05/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ColetarDados5ViewController: UIViewController {

    var list: TiposRegistros!
    
    @IBOutlet weak var editText5Altura: UITextField!
    @IBOutlet weak var editText5Comprimento: UITextField!
    @IBOutlet weak var editText5Largura: UITextField!
    @IBOutlet weak var editText5Pacotes: UITextField!
    @IBOutlet weak var btn5Calcular: UIButton!
    
    @IBOutlet weak var textView5b1: UILabel!
    @IBOutlet weak var textView5b2: UILabel!
    @IBOutlet weak var textView5b3: UILabel!
    @IBOutlet weak var textView5b4: UILabel!
    
    var tipo:Int = 5
    var extensao1:Float = 0.0
    var prateleiras1:Float = 0.0
    var extensao2:Float = 0.0
    var prateleiras2:Float = 0.0
    var total:Float = 0.0
    var altura:Float = 0.0
    var comprimento:Float = 0.0
    var largura:Float = 0.0
    var pacotes:Float = 0.0
    var id:Int = 0
    var registros: [NSManagedObject] = []
    var idioma: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        btn5Calcular.layer.cornerRadius = 10
        btn5Calcular.layer.borderWidth = 2
        btn5Calcular.clipsToBounds = true
        btn5Calcular.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)
        
        editText5Altura.keyboardType = .decimalPad
        editText5Comprimento.keyboardType = .decimalPad
        editText5Largura.keyboardType = .decimalPad
        editText5Pacotes.keyboardType = .numberPad
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        textView5b1.text = Traducao(idioma: idioma, mensagem: "Altura do pacote (m)").getTraducao()
        textView5b2.text = Traducao(idioma: idioma, mensagem: "Comprimento do pacote (m)").getTraducao()
        textView5b3.text = Traducao(idioma: idioma, mensagem: "Largura do pacote (m)").getTraducao()
        textView5b4.text = Traducao(idioma: idioma, mensagem: "Número de pacotes").getTraducao()
        btn5Calcular.setTitle(Traducao(idioma: idioma, mensagem: "Calcular").getTraducao(), for: .normal)

        
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
        if segue.identifier == "segue5ToCalcularDados"{
            
            let stAltura = editText5Altura.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stComprimento = editText5Comprimento.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stLargura = editText5Largura.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let stPacotes = editText5Pacotes.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if stAltura == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Altura do pacote vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stComprimento == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Comprimento do pacote vazio")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stLargura == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Largura do pacote vazia")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else if stPacotes == ""{
                let alerta=Alerta(titulo: "Aviso", mensagem: "Número de pacotes vazio")
                self.present(alerta.getAlerta(),animated:true,completion:nil)
            } else {
                
                var txt = String(editText5Altura.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                altura = (txt as NSString).floatValue

                txt = String(editText5Comprimento.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                comprimento = (txt as NSString).floatValue

                txt = String(editText5Largura.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                largura = (txt as NSString).floatValue

                txt = String(editText5Pacotes.text!)
                txt = txt.replacingOccurrences(of: ",", with: ".")
                pacotes = (txt as NSString).floatValue

                //altura = (editText5Altura.text! as NSString).floatValue
                //comprimento = (editText5Comprimento.text! as NSString).floatValue
                //largura = (editText5Largura.text! as NSString).floatValue
                //pacotes = (editText5Pacotes.text! as NSString).floatValue
                total = altura*comprimento*largura*12*pacotes
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
                parametros.setValue(pacotes,forKey:"w")
                do {
                    try context.save()
                    print("dados salvos")
                } catch {
                    print("erro ao salvar os dados coletarDados5")
                }
            }
        }
    }
 

}
