//
//  ViewController.swift
//  ProgressBar
//
//  Created by Michael Campbell on 1/25/24.
//

import UIKit

class ViewController: UIViewController {

    var progressView: ProgressView = {
        let view = ProgressView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.layer.cornerCurve = .continuous
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureLayout()
        configureActions()
    }
    
    
    //MARK: - Setup and layout
    private func configureView() {
        view.backgroundColor = UIColor(red: 231/255, green: 235/255, blue: 228/255, alpha: 1.0)
        [nextButton, progressView].forEach { view.addSubview($0)}
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150.0),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            progressView.widthAnchor.constraint(equalToConstant: Screen.width - 10.0),
            progressView.heightAnchor.constraint(equalToConstant: 15.0),
            
            nextButton.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40.0),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 150.0),
            nextButton.heightAnchor.constraint(equalToConstant: 35.0)
        ])
    }
    
    private func configureActions() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped(sender:)), for: .touchUpInside)
    }
    
    
    //MARK: - Methods
    @objc func nextButtonTapped(sender: UIButton) {
        print("nextButtonTapped")
        progressView.setPipColor()
        progressView.currentIndex += 1
    }
}

