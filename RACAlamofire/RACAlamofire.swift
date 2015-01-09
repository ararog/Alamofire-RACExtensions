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

// MARK: - ReactiveCocoa

extension Request {

    /**
    Creates a ReactiveCoca signal for standard response.
    
    
    :returns: The created signal.
    */
    
    public func rac_response() -> RACSignal {
        
        return RACSignal.createSignal({ subscriber in
            
            self.response({ (request, response, anyObject, error) -> Void in
                    
                if(error == nil) {
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
    
    /**
    Creates a ReactiveCoca signal for string response.
    
    
    :returns: The created signal.
    */
    
    public func rac_responseString() -> RACSignal {
        
        return RACSignal.createSignal({ subscriber in
            
            self.responseString({ (request, response, string, error) -> Void in
                
                if(error == nil) {
                    subscriber.sendNext(string)
                    subscriber.sendCompleted()
                }
                else {
                    
                    subscriber.sendError(error)
                }
            })
            
            return nil
        })
    }
    
    /**
    Creates a ReactiveCoca signal for JSON response.
    
    
    :returns: The created signal.
    */
    
    public func rac_responseJSON() -> RACSignal {
        
        return RACSignal.createSignal({ subscriber in
            
            self.responseJSON({ (request, response, JSON, error) -> Void in
                
                if(error == nil) {
                    subscriber.sendNext(JSON)
                    subscriber.sendCompleted()
                }
                else {
                    
                    subscriber.sendError(error)
                }
            })
            
            return nil
        })
    }
}
