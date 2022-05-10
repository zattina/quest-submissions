>1.In a script, initialize an array (that has length == 3) of your favourite people, represented as Strings, and log it.
```
pub fun main(){
    let people: [String] = ["Harry", "Ron", "Harmione"]
    log(people)
}
```

>2.In a script, initialize a dictionary that maps the Strings Facebook, Instagram, Twitter, YouTube, Reddit, and LinkedIn to a UInt64 that represents the order in which you use them from most to least.
>For example, YouTube --> 1, Reddit --> 2, etc. If you've never used one before, map it to 0!
```
pub fun main(){
    let Tools: {String: UInt64} = 
    {"Facebook":5, "Instagram":4, "Twitter":1, "YouTube":2, "Reddit":0, "LinkedIn":0}
}
```

>3.Explain what the force unwrap operator ! does, with an example different from the one I showed you (you can just change the type).
When accessing value fo a dictionary, always have the optional returned.
But when you want the actual one, you need using the force-unwrap operator "!".

```
pub fun main() : String {
    let Tools: {String: String} = 
    {"Facebook":"Meta", "Instagram":"Meta", "Twitter":"Tesla", "YouTube":"Alphabet", "Reddit":"Wired Digital", "LinkedIn":"Microsoft"}
    return Tools["Facebook"]!
}
'''
![スクリーンショット (309)](https://user-images.githubusercontent.com/104513005/167625783-4292e128-78fa-4515-9806-4b1faff5bee6.png)

>4.Using this picture below, explain...
<img width="1361" alt="wrongcode" src="https://user-images.githubusercontent.com/104513005/167626091-37432158-b9f2-49ec-9ae7-9d509277e718.png">

> What the error message means
It was expecting a "String" return value, but it got a different type.

> Why we're getting this error
Returned type is optional, but main() define "String".
So it is mismatch

> How to fix it
thing[0x03] → thing[0x03]!
