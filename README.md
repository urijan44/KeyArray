# KeyArray
## Introduce
- KeyArray is container that has Dictionary Type, You can use array or Dictionary

## Usage
- KeyArray is @propertyWrapper
- First. Make a model that confirm to `KeyOwned` protocol

```swift
struct Model: KeyOwned {
    let id: UUID
    let name: String

    //require
    var key: AnyHashable {
        name
    }
}
```
- Use Array
```swift

let models: [Model] = [
    Model(name: "hue"),
    Model(name: "jack"),
    Model(name: "brady")
]

models[1] // is Model(name: "jack")

print(models.map(\.name))
//will print "hue", "jack", "brady"

```
- Also you can use Dictionary
- When you use Dictionary, insert `$`
```swift

let hue = $models["hue"]
// hue is Optional<Model>(name: "hue")

```