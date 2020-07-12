//
//  TableViewController.swift
//  Exam
//
//  Created by Master on 02/07/2020.
//  Copyright © 2020 Master. All rights reserved.
//

import UIKit
class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad() //шаблонная функция Apple, тут пишется код, который происходит при первой загрузке приложения
         readFromFile() //считывает путь с файла и производит поиск
    }
    //MARK: - Настройка отображения таблицы
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //!
        //Возвращает количество секций в таблице
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return textArray.count //выводит текстовый файл
    }
    var textArray = [String]() //() - пустой массив
    func readFromFile(){
        if let pathToFile = Bundle.main.path(forResource: "text", ofType: "txt"){
           //путь к файлу
            let numbers = textArray.flatMap(NumberFormatter().number(from:))
         //заполнение массива тектом из текстового файла
            if let text = try? String(contentsOfFile: pathToFile){
                textArray=text.components(separatedBy: "\n\n") //количество столбцов таблицы
                var numbersResult: String?
                let numbersOperation = BlockOperation {
                    numbersResult = text.reduce("") { $1.isNumber ? $0 + String($1) : $0 } // находит числа
                }
                numbersOperation.start()
                print(numbersResult!)
                
                var letterResult: String?
                let letterOperation = BlockOperation {
                    letterResult = text.reduce("") { $1.isLetter ? $0 + String($1) : $0
                                       //находит буквы
                } //letterResult
            } //letterOperation
                letterOperation.start()
                print(letterResult!)
            } //if let text
            
    }// if let path to file
}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text="Исходный текст \(indexPath.row)"  //для отображения номера
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if  let indexPath = tableView.indexPathForSelectedRow{
            let viewControllerDestination = segue.destination as! ViewController
            viewControllerDestination.textForText = textArray[indexPath.row]
        }
    }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
