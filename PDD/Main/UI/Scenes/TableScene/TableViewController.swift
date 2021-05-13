//
//  TableViewController.swift
//  PDD
//
//  Created by Anton Rasoha on 12.05.21.
//

import Foundation
import UIKit



class TableViewController: UIViewController, UITableViewDelegate {
    
    var data: Array<Any> = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addCell(_ sender: Any) {
        var array: Array<Any> = []
        let alertController: UIAlertController = UIAlertController(title: "Добавить vin авто", message: "", preferredStyle: .alert)
        alertController.addTextField { (textfield : UITextField) -> Void in
            textfield.placeholder = "Марка авто"
        }
        alertController.addTextField { (textfield : UITextField) -> Void in
            textfield.placeholder = "Vin авто"
        }
        let saveAction = UIAlertAction(title: "Сохранить", style: .default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            array.append(firstTextField.text!)
            array.append(secondTextField.text!)
            self.data.append(array)
            self.tableView.reloadData()
            
        })
        let cancelAction = UIAlertAction(title: "Отменить", style: .default, handler: {
                                            (action : UIAlertAction!) -> Void in
            array.removeAll()
        })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        alertController.preferredAction = saveAction
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomCell")
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CustomCell")
        guard data.count != 0 else {
            return cell
        }
        let textArray = data[indexPath.row] as? Array<Any>
        cell.textLabel?.text = textArray?[0] as? String
        cell.detailTextLabel?.text = textArray?[1] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
            case self.tableView:
                return data.count;
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        print(item)
        
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let modifyAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("delete action ...")
            self.data.remove(at: indexPath.row)
            self.tableView.reloadData()
            success(true)
        })
        modifyAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let modifyAction = UIContextualAction(style: .normal, title:  "Check", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("check action ...")
            guard self.data.count != 0 else {
                return
            }
            let textArray = self.data[indexPath.row] as? Array<Any>
            let text1 = textArray?[0] as? String
            let text2 = textArray?[1] as? String
            if (text1?.lowercased().range(of:"opel") != nil) {
                let alertController: UIAlertController = UIAlertController(title: "Штрафы", message: "Штраф не найден", preferredStyle: .alert)
                let saveAction = UIAlertAction(title: "ОК", style: .default, handler: { alert -> Void in
                })

                alertController.addAction(saveAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                if (text2?.lowercased().range(of:"1") != nil) {
                    let alertController: UIAlertController = UIAlertController(title: "Штрафы", message: "1. Скорость: превышение на 9 км/ч. - 23.11", preferredStyle: .alert)
                    let saveAction = UIAlertAction(title: "ОК", style: .default, handler: { alert -> Void in
                    })
                    
                    alertController.addAction(saveAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                else {
                    let alertController: UIAlertController = UIAlertController(title: "Штрафы", message: "1. Скорость: превышение на 9 км/ч.\n2. Нарушение: пересечение сплошной - 22.12", preferredStyle: .alert)
                    let saveAction = UIAlertAction(title: "ОК", style: .default, handler: { alert -> Void in
                    })
                    
                    alertController.addAction(saveAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
            success(true)
        })
        modifyAction.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    
    func checkFail() {
        
    }
}
