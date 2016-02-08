//
//  ViewController.swift
//  p02-ozdemir 2048
//
//  Created by Utku Dora on 28/01/16.
//  Copyright © 2016 Utku Dora Ozdemir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var array: [[Int]] = [[2,2,2,2],[0,2,2,0],[2,2,0,2],[0,0,2,0]]
    var labelArray :[UILabel]?
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var label00: UILabel!
    @IBOutlet weak var label01: UILabel!
    @IBOutlet weak var label02: UILabel!
    @IBOutlet weak var label03: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label20: UILabel!
    @IBOutlet weak var label21: UILabel!
    @IBOutlet weak var label22: UILabel!
    @IBOutlet weak var label23: UILabel!
    @IBOutlet weak var label30: UILabel!
    @IBOutlet weak var label31: UILabel!
    @IBOutlet weak var label32: UILabel!
    @IBOutlet weak var label33: UILabel!
    
    
    @IBAction func SwipeLeftAction(sender: AnyObject) {
        for _ in 0...3{ // to slide the numbers to corners and have them move through 0's
            for xIndex in 0...3{
                for yIndex in 0...2 {
                
                    if (array[xIndex][yIndex] == 0)&&(array[xIndex][yIndex+1] != 0)
                    {
                        array[xIndex][yIndex] = array[xIndex][yIndex+1]
                        array[xIndex][yIndex+1] = 0
                    }
    
                }
            
            }
        }
        
        
        for xIndex in 0...3{// summary happens here it will slide the following blocks if there is a summary
            for yIndex in 0...2 {
                
                if (array[xIndex][yIndex] == array[xIndex][yIndex+1])
                {
                    array[xIndex][yIndex] = array[xIndex][yIndex+1]*2
                    if yIndex == 2 {
                        array[xIndex][yIndex+1] = 0
                        }
                    else{
                        for ySlider in yIndex...1{
                            array[xIndex][ySlider+1] = array[xIndex][ySlider+2]
                            
                        }
                        array[xIndex][3] = 0
                        
                    }
                }
                
            }
            
        }
        generateRandomNumbers()
        updateLabels()
    }

    
    @IBAction func SwipeUpAction(sender: AnyObject) {
        
        
        
        
        for _ in 0...3{ // to slide the numbers to corners and have them move through 0's
            for yIndex in 0...3  {
                for xIndex in 0...2 {
                    
                    if (array[xIndex][yIndex] == 0)&&(array[xIndex+1][yIndex] != 0)
                    {
                        array[xIndex][yIndex] = array[xIndex+1][yIndex]
                        array[xIndex+1][yIndex] = 0
                    }
                    
                }
                
            }
        }
        
        
        for yIndex in 0...3{// summary happens here it will slide the following blocks if there is a summary
            for xIndex in 0...2 {
                
                if (array[xIndex][yIndex] == array[xIndex+1][yIndex])
                {
                    array[xIndex][yIndex] = array[xIndex+1][yIndex]*2
                    if xIndex == 2 {
                        array[xIndex+1][yIndex] = 0
                    }
                    else{
                        for xSlider in xIndex...1{
                            array[xSlider+1][yIndex] = array[xSlider+2][yIndex]
                            
                        }
                        array[3][yIndex] = 0
                        
                    }
                }
                
            }
            
        }
        
        
        
        generateRandomNumbers()
        
        updateLabels()

        
        
        
        
    }
    
    
    
    
    
    @IBAction func SwipeDownAction(sender: AnyObject) {
        
        
        
        
        
        
        for _ in 0...3{ // to slide the numbers to corners and have them move through 0's
            for yIndex in 0...3  {
                for xIndex in 0...2 {
                    
                    if (array[xIndex+1][yIndex] == 0)&&(array[xIndex][yIndex] != 0)
                    {
                        array[xIndex+1][yIndex] = array[xIndex][yIndex]
                        array[xIndex][yIndex] = 0
                    }
                    
                }
                
            }
        }
 
        for yIndex in 0...3{// summary happens here, it will slide the following blocks if there is a summary
            for xIndex in (1...3).reverse() {
                
                if (array[xIndex][yIndex] == array[xIndex-1][yIndex])
                {
                    array[xIndex][yIndex] = array[xIndex][yIndex]*2
                    if xIndex == 1 {
                        
                        array[xIndex-1][yIndex] = 0
                        
                    }
                    else{
                        for xSlider in (2...xIndex).reverse(){
                            array[xSlider-1][yIndex] = array[xSlider-2][yIndex]
                            
                        }
                        array[0][yIndex] = 0
                        
                    }
                }
                
            }
            
        }
        
        
        generateRandomNumbers()
        
        updateLabels()

        
        
        
        
    }
    
    
    @IBAction func SwipeRightAction(sender: AnyObject) {
        
        
        
        for _ in 0...3{ // to slide the numbers to corners and have them move through 0's
            for xIndex in 0...3{
                for yIndex in 0...2 {
                    
                    if (array[xIndex][yIndex+1] == 0)&&(array[xIndex][yIndex] != 0)
                    {
                        array[xIndex][yIndex+1] = array[xIndex][yIndex]
                        array[xIndex][yIndex] = 0
                    }
                    
                }
                
            }
        }
        
        
        for xIndex in 0...3{// summary happens here, it will slide the following blocks if there is a summary
            for yIndex in (1...3).reverse() {
                
                if (array[xIndex][yIndex] == array[xIndex][yIndex-1])
                {
                    array[xIndex][yIndex] = array[xIndex][yIndex]*2
                    if yIndex == 1 {
                       
                        array[xIndex][yIndex-1] = 0
                        
                    }
                    else{
                        for ySlider in (2...yIndex).reverse(){
                            array[xIndex][ySlider-1] = array[xIndex][ySlider-2]
                        
                        }
                        array[xIndex][0] = 0
                        
                    }
                }
                
            }
            
        }
        
        generateRandomNumbers()
        updateLabels()
        
    }
    
    
    func generateRandomNumbers()
    {
        for xIndex in 0...3{
            for yIndex in 0...3  {
                if array[xIndex][yIndex] == 0 {
                    let time = UInt32(NSDate().timeIntervalSinceReferenceDate)
                    srand(time)
                    
                    if arc4random()%10 > 7  {
                        
                        array[xIndex][yIndex] = 2
                        
                    }
                    
                }
                
                
            }
        }
        
        
    }
    
    func setBackgroundColor(number:Int)-> UIColor{
    
        switch number{
        case 0:
            return UIColor.lightGrayColor()
        case 2:
            return UIColor.greenColor()
        case 4:
            return UIColor.blueColor()
        case 8:
            return UIColor.purpleColor()
        case 16:
            return UIColor.orangeColor()
        case 32:
            return UIColor.yellowColor()
        case 64:
            return UIColor.redColor()
        default:
            return UIColor.redColor()
        }
        
    
    
    
    
    
    
    
    
    
    }

    func updateLabels(){
     
        
        let maxElement = array.map({ $0.maxElement()!}).maxElement()!
        scoreLabel.text = "\(maxElement)"
        scoreLabel.backgroundColor = setBackgroundColor(maxElement)
        var count = 0
        for xIndex in 0...3{
            for yIndex in 0...3  {
                labelArray![count].text = "\(array[xIndex][yIndex])"
                labelArray![count].backgroundColor = setBackgroundColor(array[xIndex][yIndex])
                count++
            }
        }

        
        
        
        
//        label00.text = "\(array[0][0])"
//        label01.text = "\(array[0][1])"
//        label02.text = "\(array[0][2])"
//        label03.text = "\(array[0][3])"
//        label10.text = "\(array[1][0])"
//        label11.text = "\(array[1][1])"
//        label12.text = "\(array[1][2])"
//        label13.text = "\(array[1][3])"
//        label20.text = "\(array[2][0])"
//        label21.text = "\(array[2][1])"
//        label22.text = "\(array[2][2])"
//        label23.text = "\(array[2][3])"
//        label30.text = "\(array[3][0])"
//        label31.text = "\(array[3][1])"
//        label32.text = "\(array[3][2])"
//        label33.text = "\(array[3][3])"
//        
//        label00.backgroundColor = setBackgroundColor(array[0][0])
//        label01.backgroundColor = setBackgroundColor(array[0][1])
//        label02.backgroundColor = setBackgroundColor(array[0][2])
//        label03.backgroundColor = setBackgroundColor(array[0][3])
//        label10.backgroundColor = setBackgroundColor(array[1][0])
//        label11.backgroundColor = setBackgroundColor(array[1][1])
//        label12.backgroundColor = setBackgroundColor(array[1][2])
//        label13.backgroundColor = setBackgroundColor(array[1][3])
//        label20.backgroundColor = setBackgroundColor(array[2][0])
//        label21.backgroundColor = setBackgroundColor(array[2][1])
//        label22.backgroundColor = setBackgroundColor(array[2][2])
//        label23.backgroundColor = setBackgroundColor(array[2][3])
//        label30.backgroundColor = setBackgroundColor(array[3][0])
//        label31.backgroundColor = setBackgroundColor(array[3][1])
//        label32.backgroundColor = setBackgroundColor(array[3][2])
//        label33.backgroundColor = setBackgroundColor(array[3][3])
        

    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
         labelArray = [label00,label01,label02,label03,label10,label11,label12,label13,label20,label21,label22,label23,label30,label31,label32,label33, ]
        updateLabels()
        
        
//        for xIndex in 0...3{
//            for yIndex in 0...3 {
//            
//            array[xIndex][yIndex] = 0
//                
//            }
//        
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

