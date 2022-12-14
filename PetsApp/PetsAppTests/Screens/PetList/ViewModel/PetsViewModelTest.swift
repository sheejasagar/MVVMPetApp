//
//  PetsViewModelTest.swift
//  PetsAppTests
//
//  Created by Sheeja Sagar on 12/14/22.
//

import XCTest

@testable import PetsApp

class PetsViewModelTest: XCTestCase {

    private var petsViewModelTest: PetsViewModel!
    
    override func setUp() {
        super.setUp()
        petsViewModelTest = PetsViewModel()
    }

    override func tearDown() {
        petsViewModelTest = nil
        super.tearDown()
    }

    func testPetsViewModelTest_getPetsData() {
        petsViewModelTest.getPetsData()
        XCTAssert(true)
    }
    
    func testPetsViewModelTest_isValidateWorkHours() {
        let isvalid = petsViewModelTest.isValidateWorkHours()
        XCTAssertNotNil(isvalid, "Nil value")
    }
    
}
