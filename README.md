<h1>IOS http call example in swift 3</h1>

<h2>GET</h2>

```swift
let url = URL(string: "0.0.0.0")
let task = URLSession.shared.dataTask(with: url!) { data, response, error in
  guard error == nil else {
    //on error
    return
  }
  guard let data = data else {
    //on empty answer
    return
  }
            
  DispatchQueue.main.async { //to show the answer async
    self.answerField.text = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String?
  }
}
task.resume()
```

<h2>POST</h2>

```swift
var request = URLRequest(url: URL(string: ".0.0.0.0")!)
request.httpMethod = "POST"
let postString = "Post body"
request.httpBody = postString?.data(using: .utf8)
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data, error == nil else {
      DispatchQueue.main.async {
         self.answerField.text = error! as? String
      }
      return
    }
    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
      DispatchQueue.main.async {
         self.answerField.text = String(httpStatus.statusCode)
      }
      return
    }
    DispatchQueue.main.async {
      self.answerField.text = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String?
    }
            
}
task.resume()
```

<h2>PUT</h2>

```swift
var request = URLRequest(url: URL(string: ".0.0.0.0")!)
request.httpMethod = "PUT"
let postString = "Put body"
request.httpBody = postString?.data(using: .utf8)
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data, error == nil else {
      DispatchQueue.main.async {
         self.answerField.text = error! as? String
      }
      return
    }
    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
      DispatchQueue.main.async {
         self.answerField.text = String(httpStatus.statusCode)
      }
      return
    }
    DispatchQueue.main.async {
      self.answerField.text = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String?
    }
            
}
task.resume()
```
