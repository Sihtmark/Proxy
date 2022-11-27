//
//  LoadServiceProtocol.swift
//  Proxy
//
//  Created by Sergei Poluboiarinov on 2022-11-27.
//

import Foundation

protocol LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}
