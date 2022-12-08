//
//  Model.swift
//  
//
//  Created by hoseung Lee on 2022/12/08.
//

import Foundation
@testable import KeyArray

struct Model: KeyOwned {
  let id: UUID
  let name: String
  
  var key: AnyHashable {
    name
  }
  
  init(id: UUID = UUID(), name: String) {
    self.id = id
    self.name = name
  }
}
