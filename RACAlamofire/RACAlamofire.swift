// RACAlamofire.m
//
// Copyright (c) 2014 BMobile (http://www.bmobile.net.br)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import Alamofire
import ReactiveCocoa

// MARK: - Convenience -

private func URLRequest(method: Alamofire.Method, URL: URLStringConvertible) -> NSURLRequest {
    let mutableURLRequest = NSMutableURLRequest(URL: NSURL(string: URL.URLString)!)
    mutableURLRequest.HTTPMethod = method.rawValue
    
    return mutableURLRequest
}

// MARK: - Request

/**
Creates a request using the shared manager instance for the specified method, URL string, parameters, and parameter encoding.

:param: method The HTTP method.
:param: URLString The URL string.
:param: parameters The parameters. `nil` by default.
:param: encoding The parameter encoding. `.URL` by default.

:returns: The created request.
*/

public func request(method: Alamofire.Method, URLString: URLStringConvertible, parameters: [String: AnyObject]? = nil, encoding: ParameterEncoding = .URL) -> RACSignal {
    
    
    return RACSignal.createSignal({ subscriber in
        
        request(encoding.encode(URLRequest(method, URLString), parameters: parameters).0)
            .response({ (request, response, anyObject, error) -> Void in
        
                if(error != nil) {
                    subscriber.sendNext(response)
                    subscriber.sendCompleted()
                }
                else {
                    
                    subscriber.sendError(error)
                }
            })

        return nil
    })
}