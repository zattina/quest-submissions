>1.Explain, in your own words, the 2 things resource interfaces can be used for (we went over both in today's content)

(1)Used to define requirements for what is to be performed.<br>
(2)Used to limit the number of people to whom information is provided.<br><br>

>2.Define your own contract. Make your own resource interface and a resource that implements the interface. Create 2 functions.
>In the 1st function, show an example of not restricting the type of the resource and accessing its content.
>In the 2nd function, show an example of restricting the type of the resource and NOT being able to access its content.

```
pub contract Student {

    pub resource interface IRecordNumber {
      pub var name: String
      pub var number: Int
    }

    pub resource RecordNumber: IRecordNumber {
      pub var name: String
      pub var number: Int

      pub fun updateNumber(newNumber: Int): Int {
        self.number = newNumber
        return self.number 
      }

      init() {
        self.name = "Cup"
        self.number = 1
      }
    }

    pub fun noInterface() {
      let recordNumber: @RecordNumber <- create RecordNumber()
      recordNumber.updateNumber(newNumber: 5)
      log(recordNumber.number) // 5

      destroy recordNumber
    }

    pub fun yesInterface() {
      let recordNumber: @RecordNumber{IRecordNumber} <- create RecordNumber()
      let newNumber = recordNumber.updateNumber(newNumber: 5)
      log(newNumber) // 5

      destroy recordNumber
    }
}
```
![スクリーンショット (323)](https://user-images.githubusercontent.com/104513005/168471026-83052772-8ff0-49f8-a788-cca4a414b729.png)

>3.How would we fix this code?
>```
>pub contract Stuff {
>
>    pub struct interface ITest {
>      pub var greeting: String
>      pub var favouriteFruit: String
>    }
>
>    // ERROR:
>    // `structure Stuff.Test does not conform 
>    // to structure interface Stuff.ITest`
>    pub struct Test: ITest {
>      pub var greeting: String
>
>      pub fun changeGreeting(newGreeting: String): String {
>        self.greeting = newGreeting
>        return self.greeting // returns the new greeting
>      }
>
>      init() {
>        self.greeting = "Hello!"
>      }
>    }
>
>    pub fun fixThis() {
>      let test: Test{ITest} = Test()
>      let newGreeting = test.changeGreeting(newGreeting: "Bonjour!") // ERROR HERE: `member of restricted type is not accessible: changeGreeting`
>      log(newGreeting)
>    }
>}
>```
```
pub contract Stuff {

    pub struct interface ITest {
      pub var greeting: String
      pub var favouriteFruit: String
      pub fun changeGreeting(newGreeting: String): String
    }

    // ERROR:
    // `structure Stuff.Test does not conform 
    // to structure interface Stuff.ITest`
    pub struct Test: ITest {
      pub var greeting: String
      pub var favouriteFruit: String

      pub fun changeGreeting(newGreeting: String): String {
        self.greeting = newGreeting
        return self.greeting // returns the new greeting
      }

      init() {
        self.greeting = "Hello!"
        self.favouriteFruit = "Apple"
        
      }
    }

    pub fun fixThis() {
      let test: Test{ITest} = Test()
      let newGreeting = test.changeGreeting(newGreeting: "Bonjour!") // ERROR HERE: `member of restricted type is not accessible: changeGreeting`
      log(newGreeting)
    }
}
```
![スクリーンショット (325)](https://user-images.githubusercontent.com/104513005/168471839-7df95e47-6eae-4761-a6da-a2f9ea53e9d9.png)
