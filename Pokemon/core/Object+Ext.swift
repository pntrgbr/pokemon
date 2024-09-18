//
//  Object+Ext.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import RealmSwift

extension Object {
    static func build<O: Object>(_ builder: (O) -> () ) -> O {
        let object = O()
        builder(object)
        return object
    }
}
