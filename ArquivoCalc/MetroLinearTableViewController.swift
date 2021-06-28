//
//  MetroLinearTableViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 30/12/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import UIKit

class MetroLinearTableViewController: UITableViewController {

    var list:[TiposRegistros]=[]
    var idioma:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        var auxiliar:TiposRegistros
        auxiliar = TiposRegistros(id:0, nome: Traducao(idioma: idioma, mensagem: "Documentos arquivados em caixas").getTraducao(), imagem: #imageLiteral(resourceName: "tipo1"))
        list.append( auxiliar )
        auxiliar = TiposRegistros(id:1, nome: Traducao(idioma: idioma, mensagem: "Documentos empilhados").getTraducao(),imagem: #imageLiteral(resourceName: "tipo2"))
        list.append( auxiliar )
        auxiliar = TiposRegistros(id:2, nome: Traducao(idioma: idioma, mensagem: "Documentos encadernados").getTraducao(),imagem: #imageLiteral(resourceName: "tipo3"))
        list.append( auxiliar )
        auxiliar = TiposRegistros(id:3, nome: Traducao(idioma: idioma, mensagem: "Documentos fichários ou arquivos").getTraducao(),imagem: #imageLiteral(resourceName: "tipo4"))
        list.append( auxiliar )
        auxiliar = TiposRegistros(id:4, nome: Traducao(idioma: idioma, mensagem: "Documentos em pacotes").getTraducao(),imagem: #imageLiteral(resourceName: "tipo5"))
        list.append( auxiliar )
        auxiliar = TiposRegistros(id:5, nome: Traducao(idioma: idioma, mensagem: "Documentos em montes").getTraducao(),imagem: #imageLiteral(resourceName: "tipo6"))
        list.append( auxiliar )

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let auxiliar:TiposRegistros=list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReusoMetroLinear", for: indexPath) as! TiposRegistrosCelula

        // Configure the cell...
        
        //cell.textLabel?.text = auxiliar.nome //auxiliar.getNome()
        //cell.imageView?.image = auxiliar.imagem //auxiliar.getImagem()
        cell.imagem?.image = auxiliar.imagem
        cell.titulo?.text = auxiliar.nome
            
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueToCalcularDados1" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let list1 = self.list[indexPath.row]
                let viewControllerDestino = segue.destination as! ColetarDados1ViewController
                viewControllerDestino.list = list1
            }
        }
         if segue.identifier == "segueToCalcularDados2" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let list1 = self.list[indexPath.row]
                let viewControllerDestino = segue.destination as! ColetarDados2ViewController
                viewControllerDestino.list = list1
            }
        }
        if segue.identifier == "segueToCalcularDados3" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let list1 = self.list[indexPath.row]
                let viewControllerDestino = segue.destination as! ColetarDados3ViewController
                viewControllerDestino.list = list1
            }
        }
        if segue.identifier == "segueToCalcularDados4" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let list1 = self.list[indexPath.row]
                let viewControllerDestino = segue.destination as! ColetarDados4ViewController
                viewControllerDestino.list = list1
            }
        }
        if segue.identifier == "segueToCalcularDados5" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let list1 = self.list[indexPath.row]
                let viewControllerDestino = segue.destination as! ColetarDados5ViewController
                viewControllerDestino.list = list1
            }
        }
        if segue.identifier == "segueToCalcularDados6" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let list1 = self.list[indexPath.row]
                let viewControllerDestino = segue.destination as! ColetarDados6ViewController
                viewControllerDestino.list = list1
            }
        }

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var proximo1 = 1
        if let indexPath=tableView.indexPathForSelectedRow {
            proximo1 = indexPath.row + 1
        }
        print("shouldPerform "+String(proximo1))
        //print(identifier)
        
        if identifier == "segueToColetarDados" {
            
        // a celulaReusoGrupos tem segue para kindZ no default, neste caso basta dar return, nos demais reoriente para a segue correta
        if proximo1 == 1{
            self.performSegue(withIdentifier: "segueToColetarDados1", sender: self)
            return false
        }
        if proximo1 == 2{
            self.performSegue(withIdentifier: "segueToColetarDados2", sender: self)
            return false
        }
        if proximo1 == 3{
            self.performSegue(withIdentifier: "segueToColetarDados3", sender: self)
            return false
        }
        if proximo1 == 4{
            self.performSegue(withIdentifier: "segueToColetarDados4", sender: self)
            return false
        }
        if proximo1 == 5{
            self.performSegue(withIdentifier: "segueToColetarDados5", sender: self)
            return false
        }
        if proximo1 == 6{
            self.performSegue(withIdentifier: "segueToColetarDados6", sender: self)
            return false
        }
        }
        return true
    }
    

}
