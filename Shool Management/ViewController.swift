//
//  ViewController.swift
//  Shool Management
//
//  Created by Apit on 6/13/17.
//  Copyright © 2017 Apit. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var sideMenuView: UIView!
    
    var isShow = false
    var sideItem = ["Profil", "Info Pembayaran", "Absen Barcode", "Pengajuan Sakit", "Jadwal Pelajaran", "Info Nilai"]
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuView.isHidden = true
        isShow = true
    
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        swipeGesture.direction = UISwipeGestureRecognizerDirection.left
        let secondSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        secondSwipeGesture.direction = UISwipeGestureRecognizerDirection.right
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        self.view.addGestureRecognizer(swipeGesture)
        self.view.addGestureRecognizer(secondSwipeGesture)
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideItem.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nextArrow = UIImageView(frame: CGRect(x:231, y:12, width:20, height:20))
        nextArrow.image = UIImage(named: "next_arrow")
        nextArrow.contentMode = UIViewContentMode.scaleAspectFit
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SideMenuTableViewCell
        cell.item.text = sideItem[indexPath.row]
        cell.addSubview(nextArrow)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func handleSwipe(gesture: UIGestureRecognizer) {
        if isShow {
            self.isShow = false
            sideMenuView.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.sideMenuView.frame = CGRect(x: 0, y: 64, width: 272, height: 603)
            }
        }else{
            self.isShow = true
            UIView.animate(withDuration: 0.5) {
                self.sideMenuView.frame = CGRect(x: -272, y: 64, width: 272, height: 603)
            }
        }
    }

    @IBAction func sideMenu(_ sender: Any) {
        if isShow {
            self.isShow = false
            sideMenuView.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.sideMenuView.frame = CGRect(x: 0, y: 64, width: 272, height: 603)
            }
        }else{
            self.isShow = true
            UIView.animate(withDuration: 0.5) {
                self.sideMenuView.frame = CGRect(x: -272, y: 64, width: 272, height: 603)
            }
        }
    }

}

