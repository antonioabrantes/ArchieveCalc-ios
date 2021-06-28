//
//  DeletarDadosViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 12/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import CoreData

class DeletarDadosViewController: UIViewController {

    var position:Int=Int()
    var context:NSManagedObjectContext!
    var registros: [NSManagedObject] = []
    
    var tipo:Int = 0
    var x:Float = 0.0
    var y:Float = 0.0
    var z:Float = 0.0
    var w:Float = 0.0
    var total:Float = 0.0
    var id:Int = 0
    var texto:String = ""
    var str:String = ""
    var i:Int = 0
    var resultado:Bool = false
    var metro_linear_deletar:Float = 0.0
    var metro_linear_gravado:Float = 0.0
    var apagar_tudo:Bool = false
    
    @IBOutlet weak var textViewDeletar: UILabel!
    @IBOutlet weak var buttonDeletar: UIButton!
    @IBOutlet weak var buttonDeletarTodos: UIButton!
    
    @IBAction func btnDeletar(_ sender: Any) {
        var idioma:String
        apagar_tudo = false
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Parametros")
        do {
            let predicate = NSPredicate(format:"id = %@",String(position))
            requisicao.predicate = predicate
            let parametros = try context.fetch(requisicao)
            if parametros.count > 0 {
                self.registros = parametros as! [NSManagedObject]
                
                texto = Traducao(idioma: idioma, mensagem: "Confirma apagar o registro").getTraducao()+" "+String(position)+" ?"
                let alerta = UIAlertController(title: Traducao(idioma: idioma, mensagem: "Confirmação").getTraducao(), message: texto, preferredStyle: .alert)
                let acaoSim = UIAlertAction(title:Traducao(idioma: idioma, mensagem: "Sim").getTraducao(),style:.default,handler: clicadoSim)
                alerta.addAction(acaoSim)
                let acaoNao = UIAlertAction(title: Traducao(idioma: idioma, mensagem: "Não").getTraducao(), style: .default, handler: clicadoNao)
                alerta.addAction(acaoNao)
                self.present(alerta,animated:true,completion:nil)

            }
        }catch let erro as NSError{
            print("Erro ao apagar registro em DeletarDados"+erro.description)
        }
    }
    
    func clicadoSim(action:UIAlertAction){
        print("clicado sim")
        var idioma:String
        idioma = UserDefaults.standard.string(forKey: "idioma")!

        for registro in registros {
            context.delete(registro)
            do {
                try context.save()
                texto = Traducao(idioma: idioma, mensagem: "Registro apagado !").getTraducao()
                textViewDeletar.text = texto
                if apagar_tudo {                        UserDefaults.standard.set(0.0,forKey:"metro_linear")
                } else {
                    metro_linear_gravado = UserDefaults.standard.object(forKey:"metro_linear") as! Float
                    metro_linear_gravado = metro_linear_gravado - metro_linear_deletar
                    let total1 = Arredondar(valor: metro_linear_gravado, casas: 2, ceilOrFloor: 0).getArredondado()
                    UserDefaults.standard.set(total1,forKey:"metro_linear")
                }
                
            } catch let erro as NSError {
                print("Erro ao apagar registro em clicadoSim DeletarDados"+erro.description)
            }
        }
        return
    }
    
    func clicadoNao(action:UIAlertAction){
        print("clicado não")
        //self.navigationController?.popToRootViewController(animated: true)
        //self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
        return
    }
    
    @IBAction func btnDeletarTodos(_ sender: Any) {
        var idioma:String
        
        apagar_tudo = true
        idioma = UserDefaults.standard.string(forKey: "idioma")!

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Parametros")
        do {
            let parametros = try context.fetch(requisicao)
            if parametros.count > 0 {
                self.registros = parametros as! [NSManagedObject]
                
                texto = Traducao(idioma: idioma, mensagem: "Confirma apagar todos os registros ?").getTraducao()
                let alerta = UIAlertController(title: Traducao(idioma: idioma, mensagem: "Confirmação").getTraducao(), message: texto, preferredStyle: .alert)
                let acaoSim = UIAlertAction(title:Traducao(idioma: idioma, mensagem: "Sim").getTraducao(),style:.default,handler: clicadoSim)
                alerta.addAction(acaoSim)
                let acaoNao = UIAlertAction(title: Traducao(idioma: idioma, mensagem: "Não").getTraducao(), style: .default, handler: clicadoNao)
                alerta.addAction(acaoNao)
                self.present(alerta,animated:true,completion:nil)
                
            }
        }catch let erro as NSError{
            print("Erro ao apagar todos os registros em DeletarDados"+erro.description)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var idioma:String
        idioma = UserDefaults.standard.string(forKey: "idioma")!

        buttonDeletar.layer.cornerRadius = 10
        buttonDeletar.layer.borderWidth = 2
        buttonDeletar.clipsToBounds = true
        buttonDeletar.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)

        buttonDeletarTodos.layer.cornerRadius = 10
        buttonDeletarTodos.layer.borderWidth = 2
        buttonDeletarTodos.clipsToBounds = true
        buttonDeletarTodos.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)
        
        buttonDeletar.setTitle(Traducao(idioma: idioma, mensagem: "Apagar registro").getTraducao(), for: .normal)
        buttonDeletarTodos.setTitle(Traducao(idioma: idioma, mensagem: "Apagar todos os registros").getTraducao(), for: .normal)

        print("position = "+String(position))
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Parametros")
        do {
            let ordenar = NSSortDescriptor(key:"id", ascending:true)
            requisicao.sortDescriptors = [ordenar]
            let predicate = NSPredicate(format:"id = %@",String(position))
            requisicao.predicate = predicate
            let parametros = try context.fetch(requisicao)
            if parametros.count > 0 {
                self.registros = parametros as! [NSManagedObject]
                for registro in registros {
                    x = registro.value(forKey: "x") as! Float
                    y = registro.value(forKey: "y") as! Float
                    z = registro.value(forKey: "z") as! Float
                    w = registro.value(forKey: "w") as! Float
                    tipo = registro.value(forKey: "tipo") as! Int
                    id = registro.value(forKey: "id") as! Int
                    //let c = String(UnicodeScalar(170))
                    
                    texto = "Id: " + String(id) + "\n"
                    
                    /*
                    if tipo == 1 {
                        texto = texto + "Tipo: Documentos arquivados em caixas \n"
                        texto = texto + "Extensão A: " + String(x) + " (m) \n"
                        let p1 = Arredondar(valor: y, casas: 0, ceilOrFloor: 0).getArredondado()
                        let newp1 = String(p1).replacingOccurrences(of:".0", with:"",options:.literal,range:nil)
                        texto = texto + "Prateleiras A: " + newp1 + "\n"
                        texto = texto + "Extensão B: " + String(z) + " (m) \n"
                        let p2 = Arredondar(valor: w, casas: 0, ceilOrFloor: 0).getArredondado()
                        let newp2 = String(p2).replacingOccurrences(of:".0", with:"",options:.literal,range:nil)
                        texto = texto + "Prateleiras B: " + newp2 + " \n"
                        total = y*x + w*z
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + "Metro Linear: " + String(total) + " (m) \n"
                    }
                    else if tipo == 2 {
                        texto = texto + "Tipo: Documentos empilhados \n"
                        texto = texto + "Altura da 1" + c + " pilha de docs: " + String(x) + " (m) \n"
                        texto = texto + "Altura da 2" + c + " pilha de docs: " + String(y) + " (m) \n"
                        total = x + y
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + "Metro Linear: " + String(total) + " (m) \n"
                    }
                    else if tipo == 3 {
                        texto = texto + "Tipo: Documentos encadernados \n"
                        texto = texto + "Altura da pilha de docs: " + String(x) + " (m) \n"
                        texto = texto + "Extensão da pilha de docs: " + String(y) + " (m) \n"
                        total = x + y
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + "Metro Linear: " + String(total) + " (m) \n"
                    }
                    else if tipo == 4 {
                        texto = texto + "Tipo: Documentos fichários ou arquivos \n"
                        texto = texto + "Profundidade da 1" + c + " gaveta: " + String(x) + " (m) \n"
                        texto = texto + "Profundidade da 2" + c + " gaveta: " + String(y) + " (m) \n"
                        total = x + y
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + "Metro Linear: " + String(total) + " (m) \n"
                    }
                    else if tipo == 5 {
                        texto = texto + "Tipo: Documentos em pacotes \n"
                        texto = texto + "Altura do pacote: " + String(x) + " (m) \n"
                        texto = texto + "Comprimento do pacote: " + String(y) + " (m) \n"
                        texto = texto + "Largura do pacote: " + String(z) + " (m) \n"
                        let p3 = Arredondar(valor: w, casas: 0, ceilOrFloor: 0).getArredondado()
                        let newp3 = String(p3).replacingOccurrences(of:".0", with:"",options:.literal,range:nil)
                        texto = texto + "Número de pacotes" + newp3 + " \n"
                        total = x*y*z*12*w
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + "Metro Linear: " + String(total) + " (m) \n"
                    }
                    else if tipo == 6 {
                        texto = texto + "Tipo: Documentos em montes \n"
                        texto = texto + "Altura do monte: " + String(x) + " (m) \n"
                        texto = texto + "Comprimento do monte: " + String(y) + " (m) \n"
                        texto = texto + "Largura do monte: " + String(z) + " (m) \n"
                        total = x*y*z*12
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + "Metro Linear: " + String(total) + " (m) \n"
                    }
                    */
                    
                    if tipo == 1 {
                        texto = texto + Traducao(idioma: idioma, mensagem: "Documentos arquivados em caixas").getTraducao() + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Extensão A (m)").getTraducao() + ": " + String(x) + "\n"
                        let p1 = Arredondar(valor: y, casas: 0, ceilOrFloor: 0).getArredondado()
                        let newp1 = String(p1).replacingOccurrences(of:".0", with:"",options:.literal,range:nil)
                        texto = texto + Traducao(idioma: idioma, mensagem: "Número de prateleiras A").getTraducao() + ": " + newp1 + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Extensão B (m)").getTraducao() + String(z) + ": " + "\n"
                        let p2 = Arredondar(valor: w, casas: 0, ceilOrFloor: 0).getArredondado()
                        let newp2 = String(p2).replacingOccurrences(of:".0", with:"",options:.literal,range:nil)
                        texto = texto + Traducao(idioma: idioma, mensagem: "Número de prateleiras B").getTraducao() + ": " + newp2 + "\n"
                        total = y*x + w*z
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + Traducao(idioma: idioma, mensagem: "Metro Linear").getTraducao() + ": " + String(total) + " (m) \n"
                    }
                    else if tipo == 2 {
                        texto = texto + Traducao(idioma: idioma, mensagem: "Documentos empilhados").getTraducao() + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Altura da 1a pilha de docs (m)").getTraducao() + ": " +  String(x) + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Altura da 2a pilha de docs (m)").getTraducao() + ": " + String(y) + " (m) \n"
                        total = x + y
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + Traducao(idioma: idioma, mensagem: "Metro Linear").getTraducao() + ": " + String(total) + "\n"
                    }
                    else if tipo == 3 {
                        texto = texto + Traducao(idioma: idioma, mensagem: "Documentos encadernados").getTraducao() + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Altura da pilha de docs (m)").getTraducao() + ": " + String(x) + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Extensão da pilha de docs (m)").getTraducao() + ": " + String(y) + "\n"
                        total = x + y
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + Traducao(idioma: idioma, mensagem: "Metro Linear").getTraducao() + ": " + String(total) + "\n"
                    }
                    else if tipo == 4 {
                        texto = texto + Traducao(idioma: idioma, mensagem: "Documentos fichários ou arquivos").getTraducao() + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Profundidade da 1a gaveta (m)").getTraducao() + ": " + String(x) + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Profundidade da 2a gaveta (m)").getTraducao() + ": " + String(y) + "\n"
                        total = x + y
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + Traducao(idioma: idioma, mensagem: "Metro Linear").getTraducao() + ": " + String(total) + "\n"
                    }
                    else if tipo == 5 {
                        texto = texto + Traducao(idioma: idioma, mensagem: "Documentos em pacotes").getTraducao() + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Altura do pacote (m)").getTraducao() + ": " + String(x) + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Comprimento do pacote (m)").getTraducao() + ": " + String(y) + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Largura do pacote (m)").getTraducao() + ": " + String(z) + "\n"
                        let p3 = Arredondar(valor: w, casas: 0, ceilOrFloor: 0).getArredondado()
                        let newp3 = String(p3).replacingOccurrences(of:".0", with:"",options:.literal,range:nil)
                        texto = texto + Traducao(idioma: idioma, mensagem: "Número de pacotes").getTraducao() + ": " + newp3 + "\n"
                        total = x*y*z*12*w
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + Traducao(idioma: idioma, mensagem: "Metro Linear").getTraducao() + ": " + String(total) + "\n"
                    }
                    else if tipo == 6 {
                        texto = texto + Traducao(idioma: idioma, mensagem: "Documentos em montes").getTraducao() + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Altura do monte (m)").getTraducao() + ": " + String(x) + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Comprimento do monte (m)").getTraducao() + ": " + String(y) + "\n"
                        texto = texto + Traducao(idioma: idioma, mensagem: "Largura do monte (m)").getTraducao() + ": " + String(z) + "\n"
                        total = x*y*z*12
                        total = Arredondar(valor: total, casas: 2, ceilOrFloor: 0).getArredondado()
                        texto = texto + Traducao(idioma: idioma, mensagem: "Metro Linear").getTraducao() + ": " + String(total) + "\n"
                    }

                    textViewDeletar.text = texto
                    metro_linear_deletar = total
                }
            }
        }catch let erro as NSError{
            print("Erro ao recuperar parâmetros em DeletarDados"+erro.description)
        }
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("voltando para CalcularDados") // o back não passa por aqui
    }
    

}
