//
//  Observable.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

class Observable<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    var value: T {
        didSet{
            listener?(value)
        }
    }
    init(_ value: T){
        self.value = value
    }
    func bind(_ listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
