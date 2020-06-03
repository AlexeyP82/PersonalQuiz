//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
  
  // 2. Определить наиболее часто встречающийся тип животного
  
  @IBOutlet weak var animalLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var answers: [Answer]!
  
  private var animalTypeCounts = [AnimalType.dog: 0,
                     AnimalType.cat: 0,
                     AnimalType.rabbit: 0,
                     AnimalType.turtle: 0]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.hidesBackButton = true
    
    calculateAnimalTypes()
    
    let result = answerDefinition()
    
    animalLabel.text = "Вы - \(result.rawValue)"
    descriptionLabel.text = result.definition
  }
  
  private func answerDefinition() -> AnimalType {
    var animal = AnimalType.dog
    var animalCount = 0
    
    for pet in animalTypeCounts {
      if pet.value > animalCount {
        animal = pet.key
        animalCount = pet.value
      }
    }
    
    return animal
  }
  
  private func calculateAnimalTypes() {
    for answer in answers {
      switch answer.type {
      case .dog:
        increaseCount(for: .dog)
      case .cat:
        increaseCount(for: .cat)
      case .rabbit:
        increaseCount(for: .rabbit)
      case .turtle:
        increaseCount(for: .turtle)
      }
    }
  }
  
  private func increaseCount(for animal: AnimalType) {
    if animalTypeCounts[animal] != nil {
      animalTypeCounts[animal]! += 1
    }
  }
  
  deinit {
    print("ResultsViewController has been dealocated")
  }
  
}
