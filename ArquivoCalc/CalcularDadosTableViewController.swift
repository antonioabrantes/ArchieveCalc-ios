//
//  CalcularDadosTableViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 06/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import CoreData

class CalcularDadosTableViewController: UITableViewController {

    @IBAction func btnCopyOnClick(_ sender: Any) {
        // let content = UIPasteboard.general.string
        UIPasteboard.general.string = texto_completo
        let alerta=Alerta(titulo: "Aviso", mensagem: "Registros copiados para área de transferência")
        self.present(alerta.getAlerta(),animated:true,completion:nil)
    }
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
    var texto_completo: String = ""
    var str:String = ""
    var i:Int = 0
    var array_id = [Int](1...1000)
    var idioma: String = ""
    var metro_linear_total:Float = 0.0
    var metro_linear_atualizado:Float = 0.0
    var gravar_metro_linear:Bool = true
    var total_registros:Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        metro_linear_total = 0.0
        recuperarRegistros()
        print("load")
        gravar_metro_linear = true
    }

    override func viewDidAppear(_ animated: Bool) {
        //self.tableView.reloadData() não adiantou nada, ele não recalculou de novo metro_linear_total
        print("metro_linear_atualizado = ")
        print(metro_linear_atualizado)
        recuperarRegistros()
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        texto_completo = Traducao(idioma: idioma, mensagem: "Parâmetros").getTraducao() + "\n"
    }
    
    func recuperarRegistros(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Parametros")
        //let ordenar = NSSortDescriptor(key:"id",ascending:true)
        //requisicao.sortDescriptors=[ordenar]
        
        do {
            let parametros = try context.fetch(requisicao)
            self.registros = parametros as! [NSManagedObject]
            self.tableView.reloadData()
            /*
            for registro in registros {
                let valorX = registro.value(forKey:"x")
                //let s2 = NumberFormatter().string(from: valorX as! NSNumber)
                print("valor = ")
                print(valorX ?? 0)
            }
            let s3 = registros[4].value(forKey: "x")
            print("valorS3=")
            print(s3!)
             */
            
        }catch let erro as NSError{
            print("Erro ao recuperar parâmetros em Calculardados"+erro.description)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.registros.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReusoCalcularDados", for: indexPath)

        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        texto = ""
        
        // Configure the cell...
        if indexPath.row > 0 {
        let registro = self.registros[indexPath.row - 1]
        x = registro.value(forKey: "x") as! Float
        y = registro.value(forKey: "y") as! Float
        z = registro.value(forKey: "z") as! Float
        w = registro.value(forKey: "w") as! Float
        tipo = registro.value(forKey: "tipo") as! Int
        id = registro.value(forKey: "id") as! Int
        //let uuid = registro.value(forKey: "uuid") as! UUID
        array_id[indexPath.row - 1] = id // index out of range
         // index out of range
        //array_id.append(id)
        //let c = String(UnicodeScalar(170))
        // http://en.wikipedia.org/wiki/List_of_Unicode_characters
 
        texto = "Id: " + String(id) + "\n"
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!

        if tipo == 1 {
            texto = texto + Traducao(idioma: idioma, mensagem: "Documentos arquivados em caixas").getTraducao() + "\n"
            texto = texto + Traducao(idioma: idioma, mensagem: "Extensão A (m)").getTraducao() + ": " + String(x) + "\n"
            let p1 = Arredondar(valor: y, casas: 0, ceilOrFloor: 0).getArredondado()
            let newp1 = String(p1).replacingOccurrences(of:".0", with:"",options:.literal,range:nil)
            texto = texto + Traducao(idioma: idioma, mensagem: "Número de prateleiras A").getTraducao() + ": " + newp1 + "\n"
            texto = texto + Traducao(idioma: idioma, mensagem: "Extensão B (m)").getTraducao() + ": " + String(z) + "\n"
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

        cell.textLabel?.text = texto
        texto_completo = texto_completo + "\n\n" + texto
        if indexPath.row == 1 {  // o indexPath.row =0 é a mensagem de aviso
            metro_linear_total = total
        } else {
            metro_linear_total = metro_linear_total + total
        }
        }
        else {
            if gravar_metro_linear && metro_linear_total>0{
                let total1 = Arredondar(valor: metro_linear_total, casas: 2, ceilOrFloor: 0).getArredondado()
                UserDefaults.standard.set(total1,forKey:"metro_linear")
                gravar_metro_linear = false
            }
            total_registros = self.registros.count
            if total_registros == 0 {
                texto = Traducao(idioma: idioma, mensagem: "Não há registros em memória !").getTraducao() + "\n\n"
            } else {
            let metro_linear_gravado = UserDefaults.standard.object(forKey:"metro_linear") as! Float
            texto = Traducao(idioma: idioma, mensagem: "Para apagar um registro basta selecioná-lo para ser direcionado à tela que permite apagar a todos ou somente o registro selecionado").getTraducao() + "\n\n"
            texto = texto + Traducao(idioma: idioma, mensagem: "Metro Linear Total").getTraducao() + " :" + String(metro_linear_gravado) + " (m) \n"
            texto = texto + Traducao(idioma: idioma, mensagem: "Total de registros:").getTraducao() + String(total_registros)
            }
            
            cell.textLabel?.text = texto
        }
        
        if indexPath.row == (self.registros.count - 1) {
            print("ultimo registro = ")
            print(metro_linear_total)
            metro_linear_atualizado = metro_linear_total
            let total1 = Arredondar(valor: metro_linear_total, casas: 2, ceilOrFloor: 0).getArredondado()
            //idioma = UserDefaults.standard.string(forKey: "idioma")!
            //let alerta=Alerta(titulo: Traducao(idioma: idioma, mensagem: "Aviso").getTraducao(), mensagem: Traducao(idioma: idioma, mensagem: "Metro Linear Total").getTraducao() + " :" + String(total1))
            //self.present(alerta.getAlertaOriginal(),animated:true,completion:nil)
            texto_completo = texto_completo + "\n\n" + Traducao(idioma: idioma, mensagem: "Metro Linear Total").getTraducao() + " :" + String(total1)
        }
        //cell.textLabel?.text = NumberFormatter().string(from: s3 as! NSNumber)
        //print("valorS3=")
        //print(s3 ?? 0)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let indexPath=tableView.indexPathForSelectedRow {
            if indexPath.row == 0 { // se clicar na primeira célula não execute a segue
                return false
            }
        }
        return true // para qualquer outra segue siga em diante ou seja chame a func prepare
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueToDeletarDados"{
            if let indexPath=tableView.indexPathForSelectedRow {
                let viewControllerDestino = segue.destination as! DeletarDadosViewController
                let position = array_id[indexPath.row - 1]
                //let elementos = array_id.count
                //print("index = "+String(indexPath.row))
                //print("count = "+String(elementos))
                //print("position = "+String(position))
                //position = 10
                viewControllerDestino.position = position
            }
        }
    }
   

}
