//
//  ViewController.swift
//  Exam
//
//  Created by Master on 02/07/2020.
//  Copyright © 2020 Master. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = textForText
    }

    @IBOutlet weak var textView: UITextView!
    var textForText:String!
}

