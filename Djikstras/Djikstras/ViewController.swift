//
//  ViewController.swift
//  Djikstras
//
//  Created by Jose on 5/28/17.
//  Copyright © 2017 jose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startingCity: UITextField!
    
    @IBOutlet weak var endingCity: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
       
        //rgb for blue image view color  	0, 176, 255    
        //UICOlor for blue image view UIColor(red:0.00, green:0.69, blue:1.00, alpha:1.0)
    
        
        startingCity.attributedPlaceholder = NSAttributedString(string: "Starting City", attributes:[NSForegroundColorAttributeName: UIColor(red:0.00, green:0.69, blue:1.00, alpha:1.0)])
        
        startingCity.textColor = UIColor(red:0.00, green:0.69, blue:1.00, alpha:1.0)
        
        //startingCity.tintColor = UIColor(red:0.00, green:0.69, blue:1.00, alpha:1.0)
        
        endingCity.attributedPlaceholder = NSAttributedString(string: "Ending City", attributes:[NSForegroundColorAttributeName: UIColor(red:0.00, green:0.69, blue:1.00, alpha:1.0)])
        
        endingCity.textColor = UIColor(red:0.00, green:0.69, blue:1.00, alpha:1.0)
        
        //startingCity.backgroundColor = UIColor(red: 50.0 / 255.0, green: 50.0 / 255.0, blue: 50.0 / 255.0, alpha: 1)
        /*
        var bakery = PointOfInterest(name: "Bakery")
        var shopB = PointOfInterest(name: "Shop B")
        var shopC = PointOfInterest(name: "Shop C")
        var shopD = PointOfInterest(name: "Shop D")
         */
        var array = [PointOfInterest]()
        //array.append(PointOfInterest())
        var cities = Neighborhood()
        var middleOfFile = false
        
        if let path = Bundle.main.path(forResource: "map", ofType: "txt"){
            do{
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let lines = data.components(separatedBy: .newlines)
                for line in lines{
                    let words = line.components(separatedBy: " ")
                    //middle of txt file
                    if(Int(words[0]) == 87574){//
                        middleOfFile = true
                    }
                    if(middleOfFile == false){
                        array.append(PointOfInterest(name: words[0], xCoordinate: Int(words[1])!, yCoordinate: Int(words[2])!))
                    }else {

                        let index = array.index(where: {$0["txt"] as! String == words[0]
                        let indexTwo = array.index(where: {$0["txt"] as! String == words[1]
                        print(array[index].getX)

                        var x1 = array[index].xCoordinate
                        var x2 = array[indexTwo].getX

                        /*
                        tempX = Math.abs(cityList.get(startingCity).getX() - cityList.get(destinationCity).getX());
                        tempY = Math.abs(cityList.get(startingCity).getY() - cityList.get(destinationCity).getY());
                        */

                        var tempX = x1 - x2

                        
                        if let index = array.index(where: {$0["txt"] as! String == words[0]}){
                            cities.add(
                                edge: Route( distance: 5, destination : words[1]),
                                from: &words[0]
                            )
                    }
                    
                }//end of else
            }catch{
                print(error)
            }
        }
        //var prenzlauerBerg = Neighborhood()
        /*
        prenzlauerBerg.add(
            edge: Route(distance: 10, destination:shopB),
            from: &bakery
        )
        
        prenzlauerBerg.add(
            edge: Route(distance: 18, destination:shopC),
            from: &bakery
        )
        
        prenzlauerBerg.add(
            edge: Route(distance: 12, destination:shopC),
            from: &shopB
        )
        
        prenzlauerBerg.add(
            edge: Route(distance: 5, destination:shopD),
            from: &shopC
        )
 
 */
        
        if let shortestPath = prenzlauerBerg.shortestPathDijkstra(from: bakery, to: shopD) {
            let fullHistory = history(from: bakery, path: shortestPath)
            print(fullHistory.map { "\($0.destination.id)(\($0.distance))" }) // ["Bakery(0)", "Shop C(18)", "Shop D(23)"]
        }
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

    
    @IBAction func search(sender:AnyObject){
        performSegue(withIdentifier: "search", sender: nil)
    }

 }

}

