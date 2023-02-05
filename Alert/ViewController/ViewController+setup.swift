//
//  ViewController + setup.swift
//  Alert
//
//  Created by Александр Борисов on 19.12.2022.
//

import Foundation
import SnapKit


extension ViewController {

    func setupConstraints() {

        [nameLabel, numberLabel, sumButton, guessTheNumberButton].forEach{box in
            view.addSubview(box)
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(NameLabelConstraints.leading.rawValue)
            make.height.equalTo(NameLabelConstraints.height.rawValue)
            make.top.equalToSuperview().offset(NameLabelConstraints.top.rawValue)
        }

        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(NumberLabelConstraints.top.rawValue)
            make.height.equalTo(NumberLabelConstraints.height.rawValue)
            make.leading.trailing.equalToSuperview().inset(NumberLabelConstraints.leading.rawValue)
            make.centerX.equalToSuperview()
        }

        sumButton.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(SumButtonConstraints.top.rawValue)
            make.height.equalTo(SumButtonConstraints.height.rawValue)
            make.width.equalTo(SumButtonConstraints.width.rawValue)
            make.centerX.equalToSuperview()
        }

        guessTheNumberButton.snp.makeConstraints { make in
            make.top.equalTo(sumButton.snp.bottom).offset(GuessTheNumberButtonConstraints.top.rawValue)
            make.height.equalTo(GuessTheNumberButtonConstraints.height.rawValue)
            make.width.equalTo(GuessTheNumberButtonConstraints.width.rawValue)
            make.centerX.equalToSuperview()
        }


    }
}
