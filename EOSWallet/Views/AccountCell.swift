//
//  AccountCell.swift
//  EOSWallet
//
//  Created by Jonathan Go on 22.02.22.
//

import UIKit

final class AccountCell: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHeirarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountCell {
    private func setupViews() {
        
    }
    
    private func setupHeirarchy() {
        
    }
    
    private func setupLayout() {
        
    }
}
