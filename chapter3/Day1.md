>1.In words, list 3 reasons why structs are different from resources.

Reason1：To avoid losing NFTs easily by making them more difficult to handle.<br>
Reason2：To prevent NFTs from being easily copied by making them more difficult to handle.<br>
Reason3：To prevent NFTs from being moved easily by making them more difficult to handle.<br>
<br>
>2.Describe a situation where a resource might be better to use than a struct.

Situations involving NFTs, tokens, or other items that cannot be easily lost or copied.<br>
<br>
>3.What is the keyword to make a new resource?

Keyword is "create".<br>
<br>
>4.Can a resource be created in a script or transaction (assuming there isn't a public function to create one)?

A resource can only be created when using create inside contract.<br>
<br>
>5.What is the type of the resource below?
>```
>pub resource Jacob {
>
>}
>```
The type of the resourc is "Jacob".<br>
<br>

>6.Let's play the "I Spy" game from when we were kids. I Spy 4 things wrong with this code. Please fix them.
>```
>pub contract Test {
>
>    // Hint: There's nothing wrong here ;)
>    pub resource Jacob {
>        pub let rocks: Bool
>        init() {
>            self.rocks = true
>        }
>    }
>
>    pub fun createJacob(): Jacob { // there is 1 here
>        let myJacob = Jacob() // there are 2 here
>        return myJacob // there is 1 here
>    }
>}
>```
The modified code is as follows
```
pub contract Test {

    pub resource Jacob {
        pub let rocks: Bool
        init() {
            self.rocks = true
        }
    }

    pub fun createJacob(): @Jacob {
        let myJacob <- create Jacob()
        return <- myJacob
    }
}
```
