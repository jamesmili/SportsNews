# SportsNews
![app](https://i.imgur.com/bbP23lE.png)
## Description

SportsNews is an iOS application that curates twitter posts from both r/NBA and r/NFL subreddits. Each individual tweet can be viewed by tapping on the post.

## How it works

By adding .json to the reddit URL before the query allows all the information on that page to be displayed in JSON format. 

Example:
```https://www.reddit.com/r/nba/search.json?q=url%3Atwitter&restrict_sr=on&sort=new&t=week```

Uses JSONDecoder to decode and stores JSON values in an array of TweetViewModel structures. 
```
class TweetsViewModel: ObservableObject{
    @Published var nba = [TweetViewModel]()
    @Published var nfl = [TweetViewModel]()

    init(){
        TweetsManager().getNBAPost { tweet in
            if let tweet = tweet {
                self.nba = tweet.map(TweetViewModel.init)
            }
        }
        TweetsManager().getNFLPost { tweet in
            if let tweet = tweet {
                self.nfl = tweet.map(TweetViewModel.init)
            }
        }
    }
}

struct TweetViewModel: Identifiable{
    var tweet: Child
    init(tweet: Child){
        self.tweet = tweet
    }
    var id: String{
        return self.tweet.data.id
    }
    var title: String{
        return self.tweet.data.title
    }
    
    var url: String{
        return self.tweet.data.url
    }
    var utc: Double{
        return self.tweet.data.created_utc
    }
}
```
The ContentView calls on the TweetsViewModel class to get its values and displays it.
## How to install

1. Clone repo ```git clone git@github.com:jamesmili/SportsNews.git```.
2. Open ```SportsNews.xcodeproj``` on Xcode.
3. Run the app.

## System Requirements
* Xcode Version 11.0
* macOS 10.15+ (for SwiftUI)

## License
* <a target="_blank" href="https://icons8.com/icons/set/basketball">Basketball</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
* <a target="_blank" href="https://icons8.com/icons/set/sport">Sport</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>