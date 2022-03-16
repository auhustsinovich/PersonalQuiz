//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        
        gettingAnimalResult()
    }
    
    func gettingAnimalResult() {
        var frequencyOfAnswers: [Animal: Int] = [:]
        let answerTypes = answers.map { $0.animal }
        
        for answer in answerTypes {
            frequencyOfAnswers[answer] = (frequencyOfAnswers[answer] ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {
            (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.first?.key
        
        resultAnswerLabel.text = "Вы - \(mostCommonAnswer!.rawValue)"
        resultDescriptionLabel.text = mostCommonAnswer?.definition
    }
}
