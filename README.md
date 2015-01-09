# Alamofire-RACExtensions
Alamofire extension with support to ReactiveCocoa signals

## Features

Currently you can only subscribe to request signal

## Requirements

- iOS 8.0+ / Mac OS X 10.9+
- Xcode 6.1

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/alamofire). (Tag 'racalamofire')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/racalamofire).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

### Cocoapods

``` 
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

pod 'ReactiveCocoa', '~> 2.4'
pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire', :tag => '1.1.3'
pod 'RACAlamofire', :git => 'https://github.com/ararog/Alamofire-RACExtensions', :tag => '0.0.4'
```

---

## Usage

### Creating a signal for a Request

```swift
import Alamofire
import RACAlamofire

var signal:RACSignal = Alamofire.request(.GET, "http://www.google.com")
       .validate(statusCode: 200..<300)
	.rac_response()
        
signal.subscribeNext { (value) -> Void in
	println(value)
}
```