//
//  ViewController.swift
//  PageController
//
//  Created by iFlame on 11/14/17.
//  Copyright © 2017 iflame. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate
{
    var images = ["1.png","2.png","3.png"]
    var titles = ["title 1","title 2","title 3"]
    
    var pageControlObj = UIPageControl()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate = self
        self.dataSource = self
        
        self.setViewControllers([self.getVC(index: 0)], direction: .forward, animated: true, completion: nil)
        
        pageControlObj = UIPageControl(frame: CGRect(x: 0, y: self.view.frame.size.height - 50, width: self.view.frame.size.width, height: 30))
        
        pageControlObj.numberOfPages = self.titles.count
        pageControlObj.currentPage = 0
        pageControlObj.pageIndicatorTintColor = UIColor.gray
        pageControlObj.currentPageIndicatorTintColor = UIColor.black
        
        self.view.addSubview(pageControlObj)
    }
    
    // MARK:- Data source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let obj = viewController as! PageViewController
        var pgIndex = obj.pageIndex
        
        if pgIndex == NSNotFound || pgIndex == 0
        {
            return nil
        }
        pgIndex = pgIndex! - 1
        
        let newObjPageVC = self.getVC(index: pgIndex!)
        return newObjPageVC
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        let obj = viewController as! PageViewController
        var pgIndex = obj.pageIndex
        
        if pgIndex == NSNotFound
        {
            return nil
        }
        pgIndex = pgIndex! + 1
        
        if pgIndex == self.titles.count {
            return nil
        }
        
        let newObjPageVC = self.getVC(index: pgIndex!)
        return newObjPageVC
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getVC(index:Int) -> PageViewController
    {
        let pageContentVC = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! PageViewController
        
        pageContentVC.pageIndex = index
        pageContentVC.strTitle = self.titles[index]
        pageContentVC.imgName = self.images[index]
        
        self.pageControlObj.currentPage = index
        
        return pageContentVC
    }
}

