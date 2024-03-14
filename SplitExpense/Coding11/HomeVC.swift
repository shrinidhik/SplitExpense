//
//  ViewController.swift
//  Coding11
//
//  Created by Shrinidhi on 14/03/24.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var addBalanceVC: AddBalanceVC?
    var viewBalancesVC: ViewBalancesVC?

    override func viewDidLoad() {
        super.viewDidLoad()
        showAddBalancesScreen()
    }


    @IBAction func didChangeSegment(_ sender: Any) {
        addBalanceVC?.view.removeFromSuperview()
        viewBalancesVC?.view.removeFromSuperview()
        if segmentedControl.selectedSegmentIndex == 0 {
            showAddBalancesScreen()
        } else {
            showViewBalancesScreen()

        }
    }
    
    
    private func showAddBalancesScreen() {
        if addBalanceVC == nil {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: AddBalanceVC.self)) as? AddBalanceVC  else {
                return
            }
            addBalanceVC = vc
        }
        if let addBalanceVC = addBalanceVC {
            addBalanceVC.view.frame = containerView.bounds
            containerView.addSubview(addBalanceVC.view)
            containerView.bringSubviewToFront(addBalanceVC.view)
        }
    }
    
    private func showViewBalancesScreen() {
        if viewBalancesVC == nil {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: ViewBalancesVC.self)) as? ViewBalancesVC  else {
                return
            }
            viewBalancesVC = vc
        }
        if let viewBalancesVC = viewBalancesVC {
            viewBalancesVC.view.frame = containerView.bounds
            containerView.addSubview(viewBalancesVC.view)
            containerView.bringSubviewToFront(viewBalancesVC.view)
        }
    }
}

