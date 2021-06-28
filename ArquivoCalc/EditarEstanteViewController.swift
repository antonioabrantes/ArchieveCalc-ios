//
//  EditarEstanteViewController.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 16/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import CoreData

class EditarEstanteViewController: UIViewController {

    
    @IBOutlet weak var textView5: UILabel!
    @IBOutlet weak var textView2: UILabel!
    @IBOutlet weak var edtCml: UITextField!
    @IBOutlet weak var textView3: UILabel!
    @IBOutlet weak var edtPeso: UITextField!
    @IBOutlet weak var textView4: UILabel!
    @IBOutlet weak var edtVolume: UITextField!
    @IBOutlet weak var textView7: UILabel!
    @IBOutlet weak var edtCaixas: UITextField!
    @IBOutlet weak var textView8: UILabel!
    @IBOutlet weak var edtArea: UITextField!
    @IBOutlet weak var btnGravar: UIButton!
    
    var id = Int()
    var volumeMetroLinear = Float()
    var pesoMetroLinear = Int()
    var caixasEstante = Int()
    var areaEstante = Float()
    var caixasMetroLinear = Float()
    var context:NSManagedObjectContext!
    var registros: [NSManagedObject] = []
    var idioma: String = ""
    
    @IBAction func btnGravarOnClick(_ sender: Any) {
        
        caixasMetroLinear = (edtCml.text! as NSString).floatValue
        pesoMetroLinear = Int((edtPeso.text! as NSString).intValue)
        volumeMetroLinear = (edtVolume.text! as NSString).floatValue
        caixasEstante = Int((edtCaixas.text! as NSString).intValue)
        areaEstante = (edtArea.text! as NSString).floatValue
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let p2 = NSEntityDescription.insertNewObject(forEntityName:"Estante", into: context)
        p2.setValue(id,forKey: "id")
        p2.setValue(volumeMetroLinear,forKey: "volume")
        p2.setValue(pesoMetroLinear,forKey: "peso")
        p2.setValue(caixasEstante,forKey: "caixas")
        p2.setValue(areaEstante,forKey: "area")
        p2.setValue(caixasMetroLinear,forKey: "cml")
        do {
            try context.save()
            print("gravando estante")
            print("caixasEstante= ")
            print(caixasEstante)
            let alerta=Alerta(titulo: "Aviso", mensagem: "Parâmetros salvos com sucesso")
            self.present(alerta.getAlerta(),animated:true,completion:nil)
        } catch {
            print("erro ao salvar os dados estante")
            let alerta=Alerta(titulo: "Aviso", mensagem: "Erro na base de dados")
            self.present(alerta.getAlerta(),animated:true,completion:nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnGravar.layer.cornerRadius = 10
        btnGravar.layer.borderWidth = 2
        btnGravar.clipsToBounds = true
        btnGravar.contentEdgeInsets = UIEdgeInsets(top:8,left:8,bottom:8,right:8)
        
        edtCml.keyboardType = .decimalPad // Float
        edtCml.text = String(caixasMetroLinear)
        edtPeso.keyboardType = .numberPad // Int
        edtPeso.text = String(pesoMetroLinear)
        edtVolume.keyboardType = .decimalPad // Float
        edtVolume.text = String(volumeMetroLinear)
        edtCaixas.keyboardType = .numberPad // Int
        edtCaixas.text = String(caixasEstante)
        edtArea.keyboardType = .decimalPad // Float
        edtArea.text = String(areaEstante)
        
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        textView5.text = Traducao(idioma: idioma, mensagem: "Parâmetros de Arquivo").getTraducao()
        textView2.text = Traducao(idioma: idioma, mensagem: "Metro linear de cada Caixa Arquivo").getTraducao()
        textView3.text = Traducao(idioma: idioma, mensagem: "Peso (kg) por Metro Linear").getTraducao()
        textView4.text = Traducao(idioma: idioma, mensagem: "Volume (m3) por Metro Linear").getTraducao()
        textView7.text = Traducao(idioma: idioma, mensagem: "Caixas Arquivo por estante").getTraducao()
        textView8.text = Traducao(idioma: idioma, mensagem: "Área (m2) por estante").getTraducao()
        
        btnGravar.setTitle(Traducao(idioma: idioma, mensagem: "Gravar").getTraducao(), for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
