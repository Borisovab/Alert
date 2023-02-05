//
//  ViewController.swift
//  Alert
//
//  Created by Александр Борисов on 19.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var game = Game()
    var maxGuess = 3

    var nameLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .yellow
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.black
//        label.text = "ФИО"
        return label
    }()

    var numberLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .green
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = UIColor.black
//        label.text = "NUMBER"
        return label
    }()

    var sumButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.setTitle("Sum numbers", for: .normal)
        return button
    }()

    var guessTheNumberButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.setTitle("Guess the number", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        sumButtonAction()
        guessTheNumberButtonAction()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        askPlayerNameByAlert()
    }

}

