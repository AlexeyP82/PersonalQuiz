//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
  
  @IBOutlet weak var animalLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var answers: [Answer]!
  
  private var animalTypeCounts = [AnimalType: Int]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.hidesBackButton = true
    
    prepareForResultDefinition()
    
    if let result = answerDefinition() {
      animalLabel.text = "Вы - \(result.rawValue)"
      descriptionLabel.text = result.definition
    } else {
      animalLabel.text = ""
      descriptionLabel.text = ""
    }
  }
  
  private func prepareForResultDefinition() {
    for answer in answers {
      if animalTypeCounts[answer.type] != nil {
        animalTypeCounts[answer.type]! += 1
      } else {
        animalTypeCounts[answer.type] = 1
      }
    }
  }
  
  private func answerDefinition() -> AnimalType? {
    if !animalTypeCounts.isEmpty {
      var animal = animalTypeCounts.first!.key
      var animalCount = animalTypeCounts.first?.value
      
      for pet in animalTypeCounts {
        if pet.value > animalCount! {
          animal = pet.key
          animalCount = pet.value
        }
      }
      
      return animal
    } else {
      return nil
    }
  }
  
  deinit {
      print("ResultViewController has been dealocated")
  }
}
