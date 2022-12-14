//
//  PetDetailVCTest.swift
//  PetsAppTests
//
//  Created by Sheeja Sagar on 12/14/22.
//

import XCTest
import WebKit

@testable import PetsApp

class PetDetailVCTest: XCTestCase {
    
    private var petDetailVCTest: PetDetailViewController!
    private var petsViewModelTest: PetsViewModel!
    
    override func setUp() {
        super.setUp()
        // Arrange
        let id = "PetDetailViewControllerId"
        let name = "Main"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: id) as? PetDetailViewController else {
            XCTAssert(false)
            return
        }
        petsViewModelTest = PetsViewModel()
        petDetailVCTest = vc
        _ = petDetailVCTest.view
    }
    
    override func tearDown() {
        petsViewModelTest = nil
        petDetailVCTest = nil
        super.tearDown()
    }
    
    func testPetDetailVC_isViewLoaded() {
        let view = petDetailVCTest.view
        XCTAssertNotNil(view, "Can't find View instance")
    }
    
    func testPetDetailVC_webview_Exist() {
        let tableView = petDetailVCTest.webView
        XCTAssertNotNil(tableView, "Webview View is nil")
    }
    
    func testPetDetailVC_webviewHasDelegate() {
        XCTAssertNotNil(petDetailVCTest.webView.navigationDelegate, "Webview delegate cannot be nil")
    }
    
    func testPetDetailVC_showActivityIndicator_000() {
        petDetailVCTest.showActivityIndicator(show: true)
        XCTAssert(true)
    }
    
    func testPetDetailVC_showActivityIndicator_001() {
        petDetailVCTest.showActivityIndicator(show: false)
        XCTAssert(true)
    }
    
    func testPetDetailVC_loadData() {
        petDetailVCTest.pet =  getPet()
        petDetailVCTest.loadData()
        XCTAssert(true)
    }
    
    private func getPet() -> PetData {
        let pet = PetData(imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Cat_poster_1.jpg/1200px-Cat_poster_1.jpg",
                          title: "Cat",
                          contentURL: "https://en.wikipedia.org/wiki/Cat",
                          dateAdded: "2018-06-02T03:27:38.027Z")
        return pet
    }
    
}
