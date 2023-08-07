//
//  Observable.swift
//  MouvieApp_MVVM
//
//  Created by Xursandbek Qambaraliyev on 07/08/23.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(value: T? = nil) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind( _ listener: @escaping ((T?) -> Void)) {
        
        listener(value)
        self.listener = listener
    }
    
}
