//
//  ShowOrderViewControllerTests.swift
//  CleanStore
//
//  Created by Raymond Law on 2/17/16.
//  Copyright (c) 2016 Raymond Law. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import CleanStore
import XCTest

class ShowOrderViewControllerTests: XCTestCase
{
  // MARK: - Subject under test
  
  var sut: ShowOrderViewController!
  var window: UIWindow!
  
  // MARK: - Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupShowOrderViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: - Test setup
  
  func setupShowOrderViewController()
  {
    let bundle = NSBundle.mainBundle()
    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
    sut = storyboard.instantiateViewControllerWithIdentifier("ShowOrderViewController") as! ShowOrderViewController
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    NSRunLoop.currentRunLoop().runUntilDate(NSDate())
  }
  
  // MARK: - Test doubles
  
  class ShowOrderViewControllerOutputSpy: ShowOrderViewControllerOutput
  {
    var order: Order!
    
    // MARK: Method call expectations
    var getOrderCalled = false
    
    // MARK: Spied methods
    func getOrder(request: ShowOrder.GetOrder.Request)
    {
      getOrderCalled = true
    }
  }
  
  // MARK: - Tests
  
  func testShouldShowOrderWhenViewIsLoaded()
  {
    // Given
    let showOrderViewControllerOutputSpy = ShowOrderViewControllerOutputSpy()
    sut.output = showOrderViewControllerOutputSpy
    
    // When
    loadView()
    
    // Then
    XCTAssert(showOrderViewControllerOutputSpy.getOrderCalled, "Should show order when the view is loaded")
  }
  
  func testDisplayOrderShouldUpdateLabelText()
  {
    // Given
    let showOrderViewControllerOutputSpy = ShowOrderViewControllerOutputSpy()
    sut.output = showOrderViewControllerOutputSpy
    
    let displayedOrder = ShowOrder.GetOrder.ViewModel.DisplayedOrder(id: "asdf1234", date: "2000-01-01", email: "steve.jobs@clean-swift.com", name: "Steve Jobs", total: "1,000,000")
    let viewModel = ShowOrder.GetOrder.ViewModel(displayedOrder: displayedOrder)
    
    // When
    loadView()
    sut.displayOrder(viewModel)
    
    // Then
    XCTAssertEqual(sut.orderIDLabel.text, "asdf1234", "Displaying an order should update the order ID label")
    XCTAssertEqual(sut.orderDateLabel.text, "2000-01-01", "Displaying an order should update the order date label")
    XCTAssertEqual(sut.orderEmailLabel.text, "steve.jobs@clean-swift.com", "Displaying an order should update the order email label")
    XCTAssertEqual(sut.orderNameLabel.text, "Steve Jobs", "Displaying an order should update the order name label")
    XCTAssertEqual(sut.orderTotalLabel.text, "1,000,000", "Displaying an order should update the order total label")
  }
}
