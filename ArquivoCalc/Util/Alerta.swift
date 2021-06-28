//
//  Alerta.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 24/12/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import UIKit
class Alerta {
    var titulo:String
    var mensagem: String
    
    init(titulo:String, mensagem: String){
        self.titulo = titulo
        self.mensagem = mensagem
    }
    
    func getAlerta()->UIAlertController{
        var titulo_traduzido:String
        var mensagem_traduzida:String
        var idioma:String
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        titulo_traduzido = Traducao(idioma: idioma, mensagem: titulo).getTraducao()
        mensagem_traduzida = Traducao(idioma: idioma, mensagem: mensagem).getTraducao()
        let alerta = UIAlertController(title:titulo_traduzido,message:mensagem_traduzida,preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title:"OK",style:.cancel,handler: nil)
        alerta.addAction(acaoCancelar)
        return alerta
    }

    func getAlertaOriginal()->UIAlertController{
        let alerta = UIAlertController(title:titulo,message:mensagem,preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title:"OK",style:.cancel,handler: nil)
        alerta.addAction(acaoCancelar)
        return alerta
    }

    
    func getAlertaSimNao()->UIAlertController{
        var titulo_traduzido:String
        var mensagem_traduzida:String
        var idioma:String
        idioma = UserDefaults.standard.string(forKey: "idioma")!
        titulo_traduzido = Traducao(idioma: idioma, mensagem: titulo).getTraducao()
        mensagem_traduzida = Traducao(idioma: idioma, mensagem: mensagem).getTraducao()
        let alerta = UIAlertController(title: titulo_traduzido, message: mensagem_traduzida, preferredStyle: .alert)
        let acaoSim = UIAlertAction(title:Traducao(idioma: idioma, mensagem: "Sim").getTraducao(),style:.default,handler: nil)
        alerta.addAction(acaoSim)
        let acaoNao = UIAlertAction(title: Traducao(idioma: idioma, mensagem: "Não").getTraducao(), style: .default, handler: nil)
        alerta.addAction(acaoNao)
        return alerta
    }

}
