//
//  KeyArray.swift
//
//
//  Created by leehs81 on 2022/12/08.
//

import Foundation

/// KeyArray는 Array 타입을 자동으로 Dictionary 타입으로 매핑해주는 Property Wrapper입니다.
/// subscript 문법을 통해 저장된 hashValue를 통해 저장된 Array 아이템을 가져올 수 있습니다.
/// example
/// ```
///
/// struct Model: KeyOwned {
///   let id: UUID
///   let name: String
///
///   init(id: UUID = UUID(), name: String) {
///     self.id = id
///     self.name = name
///   }
///
///   var key: AnyHashable {
///     return name
///   }
/// }
///
/// @KeyArray var models: [Model] = [
///     Model(name: "hue"),
///     Model(name: "jack")
/// ]
///
/// let name = "hue"
/// let model = $models[name] // if contains name "hue" will return Model that name "hue"
///
/// //and
/// //models is same Array
///
/// for model in models {
///     // some block
/// }
///
/// let firstModel = models.first
/// // etc...
///
/// ```
@propertyWrapper
struct KeyArray<Element> where Element: KeyOwned {
  private var array: [Element] = []
  private var map: [AnyHashable: Element] = [:]
  
  var wrappedValue: [Element] {
    get {
      array
    }
    set {
      array = newValue
      array.forEach { element in
        map.updateValue(element, forKey: element.key)
      }
    }
  }
  
  var projectedValue: KeyArray<Element> {
    self
  }
  
  init(wrappedValue: [Element]) {
    self.array = wrappedValue
    array.forEach { element in
      map.updateValue(element, forKey: element.key)
    }
  }
  
  subscript(key: AnyHashable) -> Element? {
    get {
      return map[key]
    }
    set {
      map[key] = newValue
    }
  }
  
  
  mutating func append(_ element: Element) {
    array.append(element)
    map.updateValue(element, forKey: element.key)
  }
  
  mutating func removeLast() -> Element? {
    let element = array.popLast()
    
    defer {
      if let key = element?.key {
        map.removeValue(forKey: key)
      }
    }
    return element
  }
}
