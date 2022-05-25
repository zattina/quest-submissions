>1. What does .link() do?
 It links our resource to the /public/ path.
>2. In your own words (no code), explain how we can use resource interfaces to only expose certain things to the /public/ path.
 At first, we define a new resource interface that only exposes certain things.
 When we .link() the resource to the /public/ path, we restrict the reference to use that resource interface.
 
>3.Deploy a contract that contains a resource that implements a resource interface. Then, do the following:
```
pub contract Student {

  pub resource interface IScore {
    pub var name: String
  }

  // `Test` now implements `IScore`
  pub resource Score: IScore {
    pub var name: String

    pub fun changeName(newName: String) {
      self.name = newName
    }

    init() {
      self.name = "Lelouch"
    }
  }

  pub fun createScore(): @Score {
    return <- create Score()
  }

}
```
![スクリーンショット (336)](https://user-images.githubusercontent.com/104513005/170257708-41147553-ae2b-493c-b4cd-0379fc521b5d.png)

>i. In a transaction, save the resource to storage and link it to the public with the restrictive interface.
```
import Student from 0x05
transaction() {
  prepare(signer: AuthAccount) {
    signer.save(<- Student.createScore(), to: /storage/MyScoreResource)

    signer.link<&Student.Score{Student.IScore}>(/public/MyScoreResource, target: /storage/MyScoreResource)
  }

  execute {

  }
}
```

>ii. Run a script that tries to access a non-exposed field in the resource interface, and see the error pop up.
```

>iii. Run the script and access something you CAN read from. Return it from the script.
