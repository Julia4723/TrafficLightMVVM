//
//  ViewController.swift
//  TrafficLightMVVM
//
//  Created by user on 27.06.2024.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Private Property
    private let redLabel = UILabel()
    private let orangeLabel = UILabel()
    private let greenLabel = UILabel()
    
    private let button = UIButton()
    
    private var viewModel: MainViewModelProtocol
    
    
    //MARK: - Initialization
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        setupView()
        
        redLabel.alpha = viewModel.lightIsOff
        orangeLabel.alpha = viewModel.lightIsOff
        greenLabel.alpha = viewModel.lightIsOff

    }
    
    
    //MARK: - Private Methods
    private func updateView() {
        redLabel.alpha = viewModel.alphaForLight(.off)
        redLabel.alpha = viewModel.alphaForLight(.red)
        orangeLabel.alpha = viewModel.alphaForLight(.yellow)
        greenLabel.alpha = viewModel.alphaForLight(.green)
        
    }
    
    @objc
    private func changeColor() {
        if button.currentTitle == "Get" {
            button.setTitle("Next", for: .normal)
        }
        
        viewModel.updateLightState()
        updateView()
    }
}


//MARK: - Setting View
extension MainViewController {
    func setupView() {
        view.backgroundColor = .systemFill
        
        addAction()
        addSubView()
        
        setupLabel()
        setupButton()
        
        setupLayout()
        
    }
}


//MARK: - Setting
extension MainViewController {
    
    func addSubView() {
        view.addSubview(redLabel)
        view.addSubview(orangeLabel)
        view.addSubview(greenLabel)
        
        view.addSubview(button)
    }
    
    func addAction() {
        button.addTarget(
            self,
            action: #selector(changeColor),
            for: .touchUpInside
        )
    }
    
    func setupLabel() {
        redLabel.backgroundColor = .red
        redLabel.layer.cornerRadius = 50
        redLabel.layer.masksToBounds = true
        
        
        orangeLabel.backgroundColor = .orange
        orangeLabel.layer.cornerRadius = 50
        orangeLabel.layer.masksToBounds = true
        
        greenLabel.backgroundColor = .green
        greenLabel.layer.cornerRadius = 50
        greenLabel.layer.masksToBounds = true
        
    }
    
    func setupButton() {
        button.setTitle("Get", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
    }
    
    
}

//MARK: - Layout
extension MainViewController {
    
    func setupLayout() {
        
        [redLabel, orangeLabel, greenLabel, button].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            redLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            redLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redLabel.widthAnchor.constraint(equalToConstant: 100),
            redLabel.heightAnchor.constraint(equalToConstant: 100),
            
            
            orangeLabel.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: 40),
            orangeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orangeLabel.widthAnchor.constraint(equalToConstant: 100),
            orangeLabel.heightAnchor.constraint(equalToConstant: 100),
            
            
            greenLabel.topAnchor.constraint(equalTo: orangeLabel.bottomAnchor, constant: 40),
            greenLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenLabel.widthAnchor.constraint(equalToConstant: 100),
            greenLabel.heightAnchor.constraint(equalToConstant: 100),
            
            
            button.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: 100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 70)
        ])
        
    }
    
}



