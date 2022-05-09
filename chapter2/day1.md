1.Deploy a contract to account 0x03 called "JacobTucker".
 Inside that contract, declare a constant variable named is, and make it have type String.
 Initialize it to "the best" when your contract gets deployed.

Contract code
```
pub contract JacobTucker {

    pub let is: String
    init() {
        self.is = "the best"
    }
}
```

2.Check that your variable is actually equals "the best" by executing a script to read that variable.
　Include a screenshot of the output.

Script Template
```
import JacobTucker from 0x03

pub fun main(): String {
    return JacobTucker.is
}
```

![スクリーンショット (300)](https://user-images.githubusercontent.com/104513005/167428775-afae9242-44d7-4897-b342-9318cbda2d2c.png)
