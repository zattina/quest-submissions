>1.Write your own smart contract that contains two state variables: an array of resources, and a dictionary of resources. 
>Add functions to remove and add to each of them. 
>They must be different from the examples above.

```
pub contract TitleMemo {

    pub var arrayOfTitles: @[Title]
    pub var dictionaryOfTitles: @{String: Title}

    pub resource Title {
        pub let idea:String 
        init() {
            self.idea = "CodeGeass"
        }
    }

    pub fun addarrayTitle(title: @Title) {
        self.arrayOfTitles.append(<- title)
    }

    pub fun removeTitle(index: Int): @Title {
        return <- self.arrayOfTitles.remove(at: index)
    }

    pub fun adddictionaryTitle(title: @Title) {
        let key = title.idea
        let oldTitle <- self.dictionaryOfTitles[key] <- title
        destroy oldTitle
    }
    
    //added on May 18 <start from here>  
    pub fun removedictionaryTitle(key: String): @Title {
        let title <- self.dictionaryOfTitles.remove(key: key)!
        return <- title
    }
    //added on May 18 <end>
    
    init() {
        self.arrayOfTitles <- []
        self.dictionaryOfTitles <- {}
    }

}
```
![スクリーンショット (317)](https://user-images.githubusercontent.com/104513005/168465802-44662852-ab3d-4c00-814e-718891c2159c.png)

