//
//  TiposRegistros.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 30/12/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import UIKit

class TiposRegistros {
    var id:Int!
    var nome:String!
    var imagem:UIImage!
    
    init(id:Int,nome:String,imagem:UIImage){
        self.id=id
        self.nome=nome
        self.imagem=imagem
    }
    
    func getNome()->String{
        return nome
    }
    
    func getImagem()->UIImage{
        switch (id){
        case 0:
            return #imageLiteral(resourceName: "tipo1") // return #imageLiteral(resourceName: "tipo1")
        case 1:
            return #imageLiteral(resourceName: "tipo2")
        case 2:
            return #imageLiteral(resourceName: "tipo3")
        case 3:
            return #imageLiteral(resourceName: "tipo4")
        case 4:
            return #imageLiteral(resourceName: "tipo5")
        case 5:
            return #imageLiteral(resourceName: "tipo6")
        case .none:
            return #imageLiteral(resourceName: "tipo3")
        case .some(_):
            return #imageLiteral(resourceName: "tipo3")
        }
    }
}
