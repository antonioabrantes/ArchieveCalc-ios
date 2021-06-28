//
//  Arredondar.swift
//  ArquivoCalc
//
//  Created by Macintosh HD on 12/01/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import Foundation

class Arredondar {
    var valor:Float
    var casas:Int
    var ceilOrFloor:Int

    
    init(valor:Float, casas:Int, ceilOrFloor:Int){
        self.valor = valor
        self.casas = casas
        self.ceilOrFloor = ceilOrFloor
    }
    
    func getArredondado()->Float{
        var iceil:Float
        var ifloor:Float
        var arredondado:Float
        
        //let a: Int = 3
        //let b: Int = 3
        //let _: Int = Int(pow(Float(a),Float(b)))
        //let _: Float = Float(pow(Float(a),Float(b)))

        //arredondado = (powf(Float(10), Float(casas)) as NSNumber).floatValue
        if casas == 0 {
            arredondado = valor
        } else {
            arredondado = Float(pow(Float(10), Float(casas)))
            arredondado = arredondado*valor
        }
        
        if (ceilOrFloor == 1) {
            arredondado = Float(ceil(CGFloat(arredondado)))
        }
        else if (ceilOrFloor == 2) {
            arredondado = Float(floor(CGFloat(arredondado)))
        } else {
            iceil = Float(ceil(CGFloat(arredondado)))
            ifloor = Float(floor(CGFloat(arredondado)))
            if ((iceil-arredondado)<(arredondado-ifloor)){
                arredondado = iceil;
            } else{
                arredondado = ifloor;
            }
            
        }
        
        if (casas > 0) {
            arredondado = arredondado/Float(pow(Float(10), Float(casas)))
        }
        return arredondado
    }
}
