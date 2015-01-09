//
//  RACAlamofireTests.swift
//  RACAlamofireTests
//
//  Created by Rogério Pereira Araújo on 08/01/15.
//  Copyright (c) 2015 Rogério Pereira Araújo. All rights reserved.
//

import UIKit
import XCTest
import Alamofire
import RACAlamofire

class RACAlamofireTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidation200() {

        let expectation = expectationWithDescription("http://www.google.com should return 200 status code")
        
        var signal:RACSignal = Alamofire.request(.GET, "http://www.google.com")
            .validate(statusCode: 200..<300)
            .rac_response()
        
        signal.subscribeNext { (value) -> Void in
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }
    
    func testValidationJSON() {
        
        let expectation = expectationWithDescription("http://jsonip.com/ must return JSON data")
        
        var signal:RACSignal = Alamofire.request(.GET, "http://jsonip.com")
            .validate(contentType: ["application/json"])
            .rac_responseJSON()
        
        signal.subscribeNext { (value) -> Void in
            expectation.fulfill()
            println(value)
        }
        
        waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }   
    
    func testValidationNotJSON() {
        
        let expectation = expectationWithDescription("http://www.google.com")
        
        var signal:RACSignal = Alamofire.request(.GET, "http://www.google.com")
            .validate(contentType: ["application/json"])
            .rac_response()
        
        signal.subscribeError { (error) -> Void in
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }
    
}
