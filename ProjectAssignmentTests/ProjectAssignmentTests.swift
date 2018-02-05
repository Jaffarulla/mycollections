//
//  ProjectAssignmentTests.swift
//  ProjectAssignmentTests
//
//  Created by apple on 2/3/18.
//  Copyright © 2018 jaffar. All rights reserved.
//

import XCTest
@testable import ProjectAssignment

class ProjectAssignmentTests: XCTestCase {
    
    func testEmailId(){
        
        // success and failure conditions
        let sampleString = "abc@gmail.com"
        _ = "abc@gmsil.com"
        let sampleString3 = "abc@gmail.com"
        XCTAssertEqual(sampleString, sampleString3)
    }
    func testPassword(){
        
        let samplePass = "abc123"
        let samplePass2 = "abc123"
        XCTAssertEqual(samplePass, samplePass2)
    }
    
    func testSuccessfulInit() {
        
        let vc = ViewController()
        XCTAssertFalse((vc.colectionView != nil))

    }
    
    func testApi(){
        let controlApi = ViewController()
        XCTAssertNil(controlApi.apiRequestUrl(), "Getting data from the server is nil")
    }
    
    
 
    
}
