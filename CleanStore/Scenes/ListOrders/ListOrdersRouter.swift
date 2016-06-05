//
//  ListOrdersRouter.swift
//  CleanStore
//
//  Created by Raymond Law on 10/31/15.
//  Copyright (c) 2015 Raymond Law. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ListOrdersRouterInput
{
}

class ListOrdersRouter: ListOrdersRouterInput
{
  weak var viewController: ListOrdersViewController!
  
  // MARK: - Navigation
  
  // MARK: - Communication
  
  func passDataToNextScene(segue: UIStoryboardSegue)
  {
    if segue.identifier == "ShowCreateOrderScene" {
      passDataToCreateOrderScene(segue)
    } else if segue.identifier == "ShowShowOrderScene" {
      passDataToShowOrderScene(segue)
    }
  }
  
  func passDataToCreateOrderScene(segue: UIStoryboardSegue)
  {
  }
  
  func passDataToShowOrderScene(segue: UIStoryboardSegue)
  {
    if let selectedIndexPath = viewController.tableView.indexPathForSelectedRow {
      if let selectedOrder = viewController.output.orders?[selectedIndexPath.row] {
        let showOrderViewController = segue.destinationViewController as! ShowOrderViewController
        showOrderViewController.output.order = selectedOrder
      }
    }
  }
}
