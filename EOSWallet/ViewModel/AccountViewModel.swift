//
//  AccountViewModel.swift
//  EOSWallet
//
//  Created by Jonathan Go on 21.02.22.
//

import Foundation
import RxSwift

class AccountViewModel {
    
    enum DisplaySeconds {
        case microseconds
        case milliseconds
        case seconds
    }
    
    private let networkService: NetworkServicing!    
    let title = "EOS"

    init(networkService: NetworkServicing = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func getRepos(accountName: String) -> Observable<Account> {
        return networkService.fetchAccountDetails(accountName: accountName)
    }
    
    
}
