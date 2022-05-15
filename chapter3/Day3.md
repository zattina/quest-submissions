>1.Define your own contract that stores a dictionary of resources. Add a function to get a reference to one of the resources in the dictionary.
```
pub contract AlphanumericConversion {

    pub var dictionaryOfNumbers: @{Int: Anumber}

    pub resource Anumber {
        pub let English: String
        init(_English: String) {
            self.English = _English
        }
    }

    pub fun getReference(key: Int): &Anumber {
        return &self.dictionaryOfNumbers[key] as &Anumber
    }

    init() {
        self.dictionaryOfNumbers <- {
            1: <- create Anumber(_English: "One"), 
            2: <- create Anumber(_English: "Two")
        }
    }
}
```
![スクリーンショット (319)](https://user-images.githubusercontent.com/104513005/168467036-a32e61bf-49ef-4d22-b847-d5358165d04d.png)

>2.Create a script that reads information from that resource using the reference from the function you defined in part 1.
```
import AlphanumericConversion from 0x01

pub fun main(): String {
  let ref = AlphanumericConversion.getReference(key: 1)
  return ref.English
}
```
![スクリーンショット (321)](https://user-images.githubusercontent.com/104513005/168467137-7fc9b9fe-1e21-4fde-8a91-d2a36b2d00ca.png)

>3.Explain, in your own words, why references can be useful in Cadence.

If we just want to look at the information in resources, it is a hassle in the field to move resources every time and then check the information.
With references, we can conveniently check the information without that hassle.
