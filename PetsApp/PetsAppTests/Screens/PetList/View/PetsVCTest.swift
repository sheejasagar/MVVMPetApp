//
//  PetsVCTest.swift
//  PetsAppUITests
//
//  Created by Sheeja Sagar on 12/13/22.
//

import XCTest

@testable import PetsApp 

class PetsVCTest: XCTestCase {
    
    private var petsVCTest: PetsViewController!
    private var petsViewModelTest: PetsViewModel!
    
    override func setUp() {
        super.setUp()
        // Arrange
        let id = "PetsViewControllerId"
        let name = "Main"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: id) as? PetsViewController else {
            XCTAssert(false)
            return
        }
        petsViewModelTest = PetsViewModel()
        petsVCTest = vc
        _ = petsVCTest.view
    }
    
    override func tearDown() {
        petsViewModelTest = nil
        petsVCTest = nil
        super.tearDown()
    }
    
    func testPetsVC_isViewLoaded() {
        let view = petsVCTest.view
        XCTAssertNotNil(view, "Can't find View instance")
    }
    
    func testPetsVC_tableView_Exist() {
        let tableView = petsVCTest.tableView
        XCTAssertNotNil(tableView, "Table View is nil")
    }
    
    func testPetsVC_tableViewHasDelegate() {
        XCTAssertNotNil(petsVCTest.tableView.delegate, "TableView delegate cannot be nil")
    }
    
    func testPetsVC_displayAlert() {
        petsVCTest.displayAlert()
        XCTAssert(true)
    }
    
    func testPetsVC_loadPetDetailView() {
        petsVCTest.loadPetDetailView(self.getPet())
        XCTAssert(true)
    }
    
    func testPetsVC_initView() {
        petsVCTest.initView()
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
