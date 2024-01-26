//
//  ProgressCell.swift
//  ProgressBar
//
//  Created by Michael Campbell on 1/25/24.
//

import UIKit

class ProgressCell: UICollectionViewCell {
    static let identifier = "ProgressCell"
    
    var pip: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemRed
        return label
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureView()
        configureLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - Setup and layout
    private func configureView() {
        contentView.addSubview(pip)
        pip.layer.borderColor = UIColor.white.cgColor
        pip.backgroundColor = .yellow
        pip.layer.borderWidth = 0.6
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            pip.topAnchor.constraint(equalTo: contentView.topAnchor),
            pip.widthAnchor.constraint(equalToConstant: 25.0),
            pip.heightAnchor.constraint(equalToConstant: 10.0)
        ])
    }
    
    //MARK: - Methods
    func setPipColor(to color: UIColor) {
        pip.backgroundColor = color
    }
    
    func resetPipColor() {
        pip.backgroundColor = .clear
    }
}
