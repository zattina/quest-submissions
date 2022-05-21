>1. Explain what lives inside of an account.

An account have Contract Code and Account Storage.

>2. What is the difference between the /storage/, /public/, and /private/ paths?

/storage/ - Only the account owner can access this.
/public/ - Available to everybody
/private/ - Only available to the account owner and the people that the account owner gives access to

>3. What does .save() do? What does .load() do? What does .borrow() do?

If we wanted to store data in our account, we use .save().
If we wanted to take data out of our account storage, we use .load().
If we wanted to look at something in our account, we use .borrow().

>4. Explain why we couldn't save something to our account storage inside of a script.

Because the script can't modify data in the account.

>5. Explain why I couldn't save something to your account.

Because you don't have an AuthAccount to save something to my acconut.

>6. Define a contract that returns a resource that has at least 1 field in it. Then, write 2 transactions:
```
pub contract Student {

  pub resource Score {
    pub var name: String
    init() {
      self.name = "Lelouch"
    }
  }

  pub fun createTest(): @Score {
    return <- create Score()
  }

}
```
>  i. A transaction that first saves the resource to account storage, then loads it out of account storage, logs a field inside the resource, and destroys it.
```
import Student from 0x01
transaction() {
  prepare(signer: AuthAccount) {
    let ScoreResource <- Student.createScore()
    signer.save(<- ScoreResource, to: /storage/MyScoreResource) 
    let LoadScoreResource <- signer.load<@Student.Score>(from: /storage/MyScoreResource)!
    log(LoadScoreResource.name)

    destroy LoadScoreResource
  }

  execute {

  }
}
```


>  ii. A transaction that first saves the resource to account storage, then borrows a reference to it, and logs a field inside the resource.
