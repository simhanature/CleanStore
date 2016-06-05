//
//  ShowOrderPresenter.swift
//  CleanStore
//
//  Created by Raymond Law on 2/17/16.
//  Copyright (c) 2016 Raymond Law. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ShowOrderPresenterInput
{
  func presentOrder(response: ShowOrder.GetOrder.Response)
}

protocol ShowOrderPresenterOutput: class
{
  func displayOrder(viewModel: ShowOrder.GetOrder.ViewModel)
}

class ShowOrderPresenter: ShowOrderPresenterInput
{
  weak var output: ShowOrderPresenterOutput!
  
  let dateFormatter: NSDateFormatter = {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .ShortStyle
    dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
    return dateFormatter
  }()
  
  let currencyFormatter: NSNumberFormatter = {
    let currencyFormatter = NSNumberFormatter()
    currencyFormatter.numberStyle = .CurrencyStyle
    return currencyFormatter
  }()
  
  // MARK: - Fetch order
  
  func presentOrder(response: ShowOrder.GetOrder.Response)
  {
    let order = response.order
    
    let date = dateFormatter.stringFromDate(order.date)
    let total = currencyFormatter.stringFromNumber(order.total)!
    let displayedOrder = ShowOrder.GetOrder.ViewModel.DisplayedOrder(id: order.id!, date: date, email: order.email, name: "\(order.firstName) \(order.lastName)", total: total)
    
    let viewModel = ShowOrder.GetOrder.ViewModel(displayedOrder: displayedOrder)
    output.displayOrder(viewModel)
  }
}
