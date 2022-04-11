//
//  ViewController.swift
//  PaperScissorStone
//
//  Created by kevin on 2022/4/8.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameFieldch: UITextField!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var userSelectSegment: UISegmentedControl!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var mySelectLabel: UILabel!
    @IBOutlet var pcSelectLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startBtnClick(_ sender: Any) {
        
        if (nameFieldch.text != "") {
            nameLabel.text = String(format: "名字\n%@",nameFieldch.text!)
            
            let myIndex = userSelectSegment.selectedSegmentIndex
            
            let mySelect = getSelectBy(index:myIndex)
            mySelectLabel.text = String(format: "我方出拳\n%@",mySelect)
            
            let pcIndex = Int.random(in: 0...2)
            
            let pcSelect = getSelectBy(index: pcIndex)
            pcSelectLabel.text = String(format: "電腦出拳\n%@", pcSelect)
            showWinnerBy(myIndex: myIndex, pcIndex: pcIndex)
        }
        else{
            textLabel.text = "請輸入您的姓名"
        }
    }
    
    func getSelectBy(index: Int)->String{
        //index = 0 剪刀 , 1 石頭 , 2 布
        return userSelectSegment.titleForSegment(at: index)!
    }
    
    func showWinnerBy(myIndex: Int, pcIndex: Int){
        //判斷勝負
        if(myIndex == pcIndex){
            textLabel.text = "平手，再試一次"
            winnerLabel.text = "勝利者\n平手"
        }
        else if((myIndex == 0 && pcIndex == 2) || (myIndex == 1 && pcIndex == 0) || (myIndex == 2 && pcIndex == 1)){
            textLabel.text = "你贏了！！！"
            winnerLabel.text = String(format: "勝利者\n%@", nameFieldch.text!)
        }
        else{
            textLabel.text = "可惜，電腦獲勝"
            winnerLabel.text = "勝利者\n電腦"
        }
    }
    
}

