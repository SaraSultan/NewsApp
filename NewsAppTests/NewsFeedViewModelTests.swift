//
//  NewsFeedViewModelTests.swift
//  NewsAppTests
//
//  Created by Sara Sultan on 03/03/2022.
//

import XCTest
@testable import NewsApp

class NewsFeedViewModelTests: XCTestCase {
    var newsFeedStoreSuccess: NewsFeedStoreProtocol?
    var newsFeedStoreFail: NewsFeedStoreProtocol?
    
    var viewModel: NewsFeedsViewModel?
    
    override func setUpWithError() throws {
        newsFeedStoreSuccess = NewsFeedStoreSuccess()
        newsFeedStoreFail = NewsFeedStoreFail()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccess() {
        viewModel = NewsFeedsViewModel(newsFeedStore: newsFeedStoreSuccess!)
        XCTAssertNotNil(viewModel)
        
        viewModel?.loadNewsFeedsPage(withSuccess: { XCTAssertTrue(true) } , withFailure: { (errorString) in })

    }
    
    func testFail() {
        viewModel = NewsFeedsViewModel(newsFeedStore: newsFeedStoreFail!)
        XCTAssertNotNil(viewModel)
        
        viewModel?.loadNewsFeedsPage(withSuccess: {}, withFailure: { errorString in
            XCTAssertTrue(errorString != "")
        })

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
