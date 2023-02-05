//
//  ViewController+.swift
//  Alert
//
//  Created by Александр Борисов on 20.12.2022.
//

import Foundation
import SnapKit

extension ViewController: UITextFieldDelegate {

    //MARK: - Alert. Игра "угадай число"

    // обнуление поля при новой попытке в alert
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }

    func guessTheNumberButtonAction() {
        guessTheNumberButton.addTarget(self, action: #selector(guessTheNumber), for: .touchUpInside)
    }

    @objc func guessTheNumber() {
        var tempGuesValue = self.maxGuess

        let alert = UIAlertController(title: "Mystery", message: "Guess the number from 1 to 10 \n you have \(tempGuesValue) tries", preferredStyle: .alert)
        alert.addTextField { (textField) in

            textField.delegate = self
        }

        alert.addAction(UIAlertAction(title: "Guess", style: .default, handler: { [weak self] (_) in
            guard let self = self
            else {return}
            let answerValue = alert.textFields?[0].text
            self.game.answerNumber = Int(answerValue ?? "0") ?? 0

            //TODO: alert, когда введенное число меньше
            if self.game.answerNumber < self.game.secretNumber {
                tempGuesValue -= 1
                let less = UIAlertController(title: "your number is less", message: "", preferredStyle: .alert)
                if tempGuesValue > 0 {
                    less.addAction(UIAlertAction(title: "One more time", style: .default, handler: { [weak self] (_) in
                        guard let self = self
                        else {return}

                        alert.message = "Guess the number from 1 to 10 \n you have \(tempGuesValue) tries"
                        self.present(alert, animated: true, completion: nil)
                        print(tempGuesValue)
                    }))
                } else {
                    let lose = UIAlertController(title: "You lose", message: "", preferredStyle: .alert)
                    lose.addAction(UIAlertAction(title: "Play again", style: .default, handler: { [weak self](_) in
                        guard let self = self
                        else {return}

                        self.game.secretNumber = Int.random(in: 1...10)
                        self.present(alert, animated: true, completion: nil)
                    }))
                    lose.addAction(UIAlertAction(title: "Home", style: .default, handler: nil))
                    self.present(lose, animated: true)
                    tempGuesValue = self.maxGuess
                }
                self.present(less, animated: true)
            }

            //TODO:  alert, когда введенное число больше
            if self.game.answerNumber > self.game.secretNumber {
                tempGuesValue -= 1
                let more = UIAlertController(title: "your number is higher", message: "", preferredStyle: .alert)
                if tempGuesValue > 0 {
                    more.addAction(UIAlertAction(title: "One more time", style: .default, handler: { [weak self] (_) in
                        guard let self = self
                        else {return}

                        alert.message = "Guess the number from 1 to 10 \n you have \(tempGuesValue) tries"
                        self.present(alert, animated: true, completion: nil)
                        print(tempGuesValue)
                    }))
                } else {
                    let lose = UIAlertController(title: "You lose", message: "", preferredStyle: .alert)
                    lose.addAction(UIAlertAction(title: "Play again", style: .default, handler: { [weak self](_) in
                        guard let self = self
                        else {return}


                        self.game.secretNumber = Int.random(in: 1...10)
                        alert.message = "Guess the number from 1 to 10 \n you have \(tempGuesValue) tries"
                        self.present(alert, animated: true, completion: nil)
                    }))
                    lose.addAction(UIAlertAction(title: "Home", style: .default, handler: nil))
                    self.present(lose, animated: true)
                    tempGuesValue = self.maxGuess
                }

                self.present(more, animated: true)
            }

            //TODO: alert, когда введенное число равно загаданному
            if self.game.answerNumber == self.game.secretNumber {
                let win = UIAlertController(title: "You WIN!!!", message: "", preferredStyle: .alert)

                win.addAction(UIAlertAction(title: "Play again", style: .default, handler: { [weak self](_) in
                    guard let self = self
                    else {return}

                    self.game.secretNumber = Int.random(in: 1...10)
                    alert.message = "Guess the number from 1 to 10 \n you have \(tempGuesValue) tries"
                    self.present(alert, animated: true, completion: nil)
                }))
                win.addAction(UIAlertAction(title: "Home", style: .default, handler: nil))
                self.present(win, animated: true)
                tempGuesValue = self.maxGuess
            }
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


    //MARK: - Alert. Запрос имени игрока.
    func askPlayerNameByAlert() {
        let alert = UIAlertController(title: "Authorization", message: "Please enter your name", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = "Player: "
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] (_) in
            self?.nameLabel.text = alert.textFields?[0].text
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    //MARK: - Alert. Запрос цифр для их суммирования.
    func sumButtonAction() {
        sumButton.addTarget(self, action: #selector(sumAddedNumbers), for: .touchUpInside)
    }

    @objc func sumAddedNumbers() {
        let alert = UIAlertController(title: "Sum numbers", message: "Add two numers", preferredStyle: .alert)
        alert.addTextField { (textField1) in
            textField1.text = ""
        }

        alert.addTextField { (textField2) in
            textField2.text = ""
        }

        alert.addAction(UIAlertAction(title: "Press to sum", style: .default, handler: { [weak self] (_) in
            guard let self = self
            else {return}

            var value1 = ""
            var value2 = ""

            value1 = alert.textFields?[0].text ?? "3"
            value2 = alert.textFields?[1].text ?? "3"
            let sumNumbers = (Int(value1) ?? 0) + (Int(value2) ?? 0)
            self.numberLabel.text = String(sumNumbers)
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}




