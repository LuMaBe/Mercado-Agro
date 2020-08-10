//
//  DataProductos.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/9/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import Foundation

struct DataProductos {
    var producto: String
    var precio: Double
    
    init(producto: String, precio: Double) {
        self.producto = producto
        self.precio = precio
    }
    
}
