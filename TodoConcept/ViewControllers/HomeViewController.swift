//
//  HomeViewController.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/18/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet weak var cardCollectionView: UICollectionView!
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var taskCount: UILabel!
  @IBOutlet weak var lblDate: UILabel!
  var user = User()
  var allCards: [Card] = []
  
  @IBAction func logOutAction(_ sender: UIBarButtonItem) {
    do {
      try Auth.auth().signOut()
    }
    catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let initial = storyboard.instantiateInitialViewController()
    UIApplication.shared.keyWindow?.rootViewController = initial
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionViewFlowLayout.minimumLineSpacing = 10
    createCard()
    setData()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destinationVC = segue.destination as? CardViewController {
      let indexPaths : Array = cardCollectionView.indexPathsForSelectedItems! as Array
      let indexPath : IndexPath = indexPaths[0]
      let card = self.allCards[indexPath.row]
      destinationVC.card = card
    }
  }
  
  func setData(){
    
    self.lblName.text = "Hello, " + user.name
    var totalTaskCount = 0
    for card in allCards{
      totalTaskCount += card.tasks.count
    }
    self.taskCount.text = "You have " + String(totalTaskCount) + " tasks to do today."
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    let dateString = dateFormatter.string(from: date)
    
    self.lblDate.text = "TODAY: " + dateString
  }
  
  func createCard() {

    let personalCard = Card(title: "Personal", imageName: "personalIcon")
    let homeCard = Card(title: "Home", imageName: "homeIcon")
    let workCard = Card(title: "Work", imageName: "workIcon")
    
    let task = Task(title: "Meet clients")
    workCard.tasks.append(task)
    allCards.append(personalCard)
    allCards.append(workCard)
    allCards.append(homeCard)
    
  }
  
  func getTaskProgress(tasks: [Task] ) -> Float{
    
    if tasks.count == 0 {
      return 0
    }
    
    var completedTasks = 0
    
    for task in tasks {
      if task.check == true {
        completedTasks += 1
      }
    }
    return Float(completedTasks/tasks.count)
  }

  
  
  //////CollectionView////////
  
  private var indexOfCellBeforeDragging = 0
  private var collectionViewFlowLayout: UICollectionViewFlowLayout {
    return cardCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
  }
  
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    configureCollectionViewLayoutItemSize()
  }
  
  func calculateSectionInset() -> CGFloat {
    return 40
  }
  
  private func configureCollectionViewLayoutItemSize() {
    let inset: CGFloat = calculateSectionInset()
    collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: inset, bottom: 10, right: inset)
    collectionViewFlowLayout.itemSize = CGSize(width: cardCollectionView.collectionViewLayout.collectionView!.frame.size.width - inset * 2, height: cardCollectionView.collectionViewLayout.collectionView!.frame.size.height - inset/2)
    
    collectionViewFlowLayout.minimumInteritemSpacing = 10
    collectionViewFlowLayout.minimumLineSpacing = 10
  }
  
  private func indexOfMajorCell() -> Int {
    let itemWidth = collectionViewFlowLayout.itemSize.width
    let proportionalOffset = self.cardCollectionView.collectionViewLayout.collectionView!.contentOffset.x / itemWidth
    let index = Int(round(proportionalOffset))
    let numberOfItems = self.cardCollectionView.numberOfItems(inSection: 0)
    let safeIndex = max(0, min(numberOfItems - 1, index))
    return safeIndex
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    indexOfCellBeforeDragging = indexOfMajorCell()
  }
  
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    // Stop scrollView sliding:
    targetContentOffset.pointee = scrollView.contentOffset
    
    let indexOfMajorCell = self.indexOfMajorCell()
    
    let dataSourceCount = collectionView(cardCollectionView!, numberOfItemsInSection: 0)
    let swipeVelocityThreshold: CGFloat = 0.5
    let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < dataSourceCount && velocity.x > swipeVelocityThreshold
    let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging - 1 >= 0 && velocity.x < -swipeVelocityThreshold
    let majorCellIsTheCellBeforeDragging = indexOfMajorCell == indexOfCellBeforeDragging
    let didUseSwipeToSkipCell = majorCellIsTheCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)
    
    if didUseSwipeToSkipCell {
      
      let snapToIndex = indexOfCellBeforeDragging + (hasEnoughVelocityToSlideToTheNextCell ? 1 : -1)
      let toValue = collectionViewFlowLayout.itemSize.width * CGFloat(snapToIndex)
      UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity.x, options: .allowUserInteraction, animations: {
        scrollView.contentOffset = CGPoint(x: toValue, y: 0)
        scrollView.layoutIfNeeded()
      }, completion: nil)
    } else {
      let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
      cardCollectionView.collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
  }
  
  var taskGroups = [1,2,3] {
    didSet {
      cardCollectionView?.reloadData()
    }
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return taskGroups.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else {
      return UICollectionViewCell()
    }
    let card = self.allCards[indexPath.row]
    
    cell.cardTitle.text = card.title
    cell.cardTaskCount.text = String(card.tasks.count) + " Tasks"
    cell.progressView.progress = getTaskProgress(tasks: card.tasks)
    cell.cardIcon.image = UIImage(named: card.imageName)
    cell.taskPercentage.text = String(cell.progressView.progress) + " %"
    
    return cell
  }
  
  
  
}

