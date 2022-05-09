>1.Explain why we wouldn't call changeGreeting in a script.
We can't change the contents of greeting in the script.

>2.What does the AuthAccount mean in the prepare phase of the transaction?
Because the account needs to be signed before the transaction can be executed.

>3.What is the difference between the prepare phase and the execute phase in the transaction?
We are only able to get date/information from account on the prepare phase.
We are able to call functions and do stuff to change the data on the blockchain in the execute phase.
It is possible to do all the processing in the prepare phase, but it is better to separate them because the code is more difficult to read.

>4.This is the hardest quest so far, so if it takes you some time, do not worry! I can help you in the Discord if you have questions.
>●Add two new things inside your contract:
>○A variable named myNumber that has type Int (set it to 0 when the contract is deployed)
>○A function named updateMyNumber that takes in a new number named newNumber as a parameter that has type Int and updates myNumber to be newNumber

Contract code
'''
pub contract NumberChange {

    pub var myNumber: Int
    
    pub fun updateMyNumber(newNumber: Int) {
        self.myNumber = newNumber
    }
    init() {
        self.myNumber = 0
    }


}
'''

>●Add a script that reads myNumber from the contract

Script templates
'''
import NumberChange from 0x04

pub fun main(): Int {
    return NumberChange.myNumber
}
'''

>●Add a transaction that takes in a parameter named myNewNumber and passes it into the updateMyNumber function.
>Verify that your number changed by running the script again.

Transaction templates
'''
import NumberChange from 0x04

transaction(mynewNumber: Int) {

  prepare(signer: AuthAccount) {}

  execute {
    NumberChange.updateMyNumber(newNumber: mynewNumber)
  }
}
'''

Script result
![スクリーンショット (302)](https://user-images.githubusercontent.com/104513005/167430208-07a45f50-6fcf-4eeb-a8f1-3383cee7dea1.png)
