//
//  ViewController.swift
//  EOSWallet
//
//  Created by Jonathan Go on 21.02.22.
//

import RxSwift
import UIKit

class ViewController: UIViewController {

    let viewModel = AccountViewModel(networkService: NetworkService.shared)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "myBackground")
        
        setupViews()
        
        viewModel.getRepos(accountName: "genialwombat").subscribe(onNext: { account in
            print(account)
        }).disposed(by: disposeBag)
    }

    private func setupViews() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
    }
}

