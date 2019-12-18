//
//  ViewController.swift
//  test_walkthrough_UIScroll
//
//  Created by tessy0901 on 2019/12/18.
//  Copyright © 2019 tessy0901. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBAction func onButtonTapped(_ sender: Any) {
        let contentSize: CGSize = self.pageScrollView.contentSize
        let currentPage: Int = pageControl.currentPage
        pageScrollView.setContentOffset(CGPoint(x: floor(contentSize.width/3 * CGFloat(currentPage + 1)), y: 0), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageScrollView.delegate = self
    }


}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView:UIScrollView) {
        let pageControlNumber = pageScrollView.contentOffset.x / pageScrollView.frame.size.width
        if pageControlNumber.truncatingRemainder(dividingBy: 1) == 0 {
            pageControl.currentPage = Int(pageControlNumber)
        }

    }
}
