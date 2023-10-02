//
//  ViewController.swift
//  cafeMiniApp
//
//  Created by MYKAELA WALLEN on 9/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuOutlet: UILabel!
    
    @IBOutlet weak var cartOutlet: UILabel!
    
    @IBOutlet weak var foodTextOutlet: UITextField!
    
    @IBOutlet weak var quantityTextOutlet: UITextField!
    
    @IBOutlet weak var errorOutlet: UILabel!
    
    @IBOutlet weak var wrongPasswordOutlet: UILabel!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    
    @IBOutlet weak var foodAddOutlet: UITextField!
    
    @IBOutlet weak var addPriceOutlet: UITextField!
    
     var add = false
    
    
    var thing : [String] = ["Croissant", "Macarons", "Baguettes", "EClair", "Cake"]
    var price : [Double] = [3.00, 1.01, 6.08, 100.00, 15.0]
    var realMenu = ""
    var realCart = ""
    var cartDict = [String : Int]()
    var total = 0.00
    
    @IBOutlet weak var totalOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< thing.count {
            realMenu += "\(thing[i]) -------- \(price[i]) \n"
            
        }
        menuOutlet.text = realMenu
        
        
    }
    
    @IBAction func addToCart(_ sender: Any) {
        add = false
       var food = foodTextOutlet.text
        var number = Int(quantityTextOutlet.text!)
        if let f = food{
            if let n = number{
                
                for i in 0 ..< thing.count{
                    if(food == thing[i]){
                        
                        add = true
                        cartDict["\(thing[i])"] = number
                        
                        realCart += "\(cartDict[thing[i]]!)  \(thing[i])'s \n"
                        cartOutlet.text = realCart
                        total += price[i] * Double(number!)
                        totalOutlet.text = "Total: $\(total)"
                        errorOutlet.text = ""
                        
                    }
                    if(add == false){
                        errorOutlet.text = "Invalid Input"
                    }
                    
                }
            }
            else{
                errorOutlet.text = "Invalid Input"
            }
        }
        else{
            errorOutlet.text = "Invalid Input"
        }
        
        
        

        
 }
    
    
    
    @IBAction func addAction(_ sender: UIButton) {
        if (passwordOutlet.text == "Seaver"){
            thing.append(foodAddOutlet.text!)
            price.append(Double(addPriceOutlet.text!)!)
            menuOutlet.text = ""
            realMenu = ""
            
            for i in 0 ..< thing.count {
                realMenu += "\(thing[i]) -------- \(price[i]) \n"
                
            }
            menuOutlet.text = realMenu
            
        }
        else {
            wrongPasswordOutlet.text = "wrong password stupid"
            
        }
        
        
    }
    
    
}

