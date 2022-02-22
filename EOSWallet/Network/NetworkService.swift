//
//  NetworkService.swift
//  EOSWallet
//
//  Created by Jonathan Go on 21.02.22.
//

import Foundation
import RxSwift

protocol NetworkServicing {
    func fetchAccountDetails(accountName: String) -> Observable<Account>
}
       
final class NetworkService: NetworkServicing {
    // MARK: - Properties
    static let shared = NetworkService()
    private init() {}
    
    // MAKR: - Method
    func fetchAccountDetails(accountName: String) -> Observable<Account> {
        
        let parameter: [String: String] = ["account_name": accountName]
        
        guard let url = URL(string: "https://eos.greymass.com/v1/chain/get_account") else { preconditionFailure("invalid endpoint") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return Observable.create { observer -> Disposable in
            let task = URLSession.shared.dataTask(with: request) { data, _, _ in
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                
                do {
                    let account = try jsonDecoder.decode(Account.self, from: data)
                    observer.onNext(account)
                } catch {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
