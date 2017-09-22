//
//  MakeOrderPresenter.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/22/2560 BE.
//  Copyright (c) 2560 Issarapong Poesua. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MakeOrderPresentationLogic {
  func presentSomething(response: MakeOrder.RequestTicker.Response)
}

class MakeOrderPresenter: MakeOrderPresentationLogic {
  weak var viewController: MakeOrderDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: MakeOrder.RequestTicker.Response) {
    
    

    let displayPairing = response.tickersList.flatMap { (ticker) -> MakeOrder.RequestTicker.ViewModel.TickerList? in
        if (ticker.primaryCurrency == "THB") {
            return MakeOrder.RequestTicker.ViewModel.TickerList(primary: ticker.primaryCurrency,
                                                                secondary: ticker.secondaryCurrency,
                                                                price: ticker.lastPrice)
        }
        return nil
        
    }
    let viewModel = MakeOrder.RequestTicker.ViewModel(displayTickers: displayPairing)
    viewController?.displaySomething(viewModel: viewModel)
  }
}