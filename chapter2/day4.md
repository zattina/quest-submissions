>1.Deploy a new contract that has a Struct of your choosing inside of it (must be different than Profile).
>2.Create a dictionary or array that contains the Struct you defined.
>3.Create a function to add to that array/dictionary.
```
pub contract Totalling {

    pub var Grades: {Address: Grade}
    
    pub struct Grade {
        pub let Name: String
        pub let Score: Int
        pub let Rank: Int
        pub let Account: Address

        init(_Name: String, _Score: Int, _Rank: Int, _Account: Address) {
            self.Name = _Name
            self.Score = _Score
            self.Rank = _Rank
            self.Account = _Account
        }
    }

    pub fun addGrade(Name: String, Score: Int, Rank: Int, Account: Address) {
        let newGrade = Grade(_Name: Name, _Score: Score, _Rank: Rank, _Account: Account)
        self.Grades[Account] = newGrade
    }

    init() {
        self.Grades = {}
    }

}
```

>4.Add a transaction to call that function in step 3.
```
import Totalling from 0x01

transaction(Name: String, Score: Int, Rank: Int, Account: Address) {

    prepare(signer: AuthAccount) {}

    execute {
        Totalling.addGrade(Name: Name, Score: Score, Rank: Rank, Account: Account)
        log("We're done.")
    }
}
```
![スクリーンショット (312)](https://user-images.githubusercontent.com/104513005/168073743-1cf4278e-5046-485e-ae40-2e6c31cfd5ec.png)

>5.Add a script to read the Struct you defined.
```
import Totalling from 0x01

pub fun main(Account: Address): Totalling.Grade {
    return Totalling.Grades[Account]!
}
```
![スクリーンショット (313)](https://user-images.githubusercontent.com/104513005/168073865-62e30de1-1005-4dde-ad67-426b4a834ae9.png)
