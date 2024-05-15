//
//  UserInfoViewControllerTest.swift
//  LoginUserAppTests
//
//  Created by Tatiana G on 9/22/21.
//

import XCTest
@testable import LoginUserApp

class UserInfoViewControllerTest: XCTestCase {
    private var sut: UserInfoViewController!
    
    override func setUp() {
        sut = UserInfoViewController()
        sut.user = User.getUserInfo()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testUserInfoViewController() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.user)
    }
}
