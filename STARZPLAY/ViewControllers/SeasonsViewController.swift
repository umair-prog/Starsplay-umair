import UIKit

protocol SeasonsVCHeightDelegate: AnyObject {
    func seasonsViewControllerDidChangeContent(size: CGSize)
}

protocol SeasonsViewControllerDelegate: AnyObject {
    func SeasonsViewController(didSelectEpisode episode: Episodes, inSeason season: SeasonsDetail)
}

class SeasonsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var seasonTitleCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    
    //MARK: - Properties
    var viewModel: SeasonsViewModel?
    weak var collectionViewHeightDelegate: SeasonsVCHeightDelegate?
    weak var delegate: SeasonsViewControllerDelegate?
    
    private var selectedSeasonIndex: IndexPath? {
        didSet {
            guard let indexPath = selectedSeasonIndex else {
                return
            }
            let indexPaths = oldValue != nil ? [oldValue!, indexPath] : [indexPath]
            DispatchQueue.main.async { [weak self] in
                self?.seasonTitleCollectionView.reloadItems(at: indexPaths)
                self?.seasonTitleCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }
    }
    
    //MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViews()
        defaultSetup()
    }
    
    //MARK: - Helper Methods
    
    private func defaultSetup(){
        let zeroIndexPath = IndexPath(row: 0, section: 0)
        selectedSeasonIndex = zeroIndexPath
        fetchSeasonDetail(for: zeroIndexPath) { isSuccessful in
//            self.resizeForIndexPath(indexPath: zeroIndexPath)
//            self.preloadData(currentIndexpath: zeroIndexPath)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.resizeForIndexPath(indexPath: zeroIndexPath)
            }
        }
    }
    
    private func setupCollectionViews(){
        seasonTitleCollectionView.register(UINib(nibName: "SeasonsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeasonsCollectionViewCell")
        bottomCollectionView.register(UINib(nibName: "SeasonsDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeasonsDetailCollectionViewCell")
        
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        seasonTitleCollectionView.delegate = self
        seasonTitleCollectionView.dataSource = self
        
        if let topFlowLayout = seasonTitleCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            topFlowLayout.scrollDirection = .horizontal
            topFlowLayout.minimumLineSpacing = 0
            topFlowLayout.minimumInteritemSpacing = 0
        }
        
        
        bottomCollectionView.collectionViewLayout = TopAlignedFlowLayout()
        if let bottomFlowLayout = bottomCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            bottomFlowLayout.scrollDirection = .horizontal
            bottomFlowLayout.minimumLineSpacing = 0
            bottomFlowLayout.minimumInteritemSpacing = 0
        }
    }
    
    
    private func fetchSeasonDetail(for indexPath: IndexPath, completion: ((_ successful: Bool) -> Void)? = nil ){
        guard let season = viewModel?.seasons[indexPath.row] else {
            return
        }
        
        viewModel?.requestSeasonDetails(season: season, success: { seasonDetail in
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    completion?(false)
                    return
                }
                
                self.bottomCollectionView.reloadItems(at: [indexPath])
                completion?(true)
                
                
            }
            
        }, failure: { errorMessage in
            print(errorMessage)
            completion?(false)
        })
    }
    
    
    private func resizeForIndexPath(indexPath: IndexPath){
        let epidsodeData = viewModel?.seasonsDetail[indexPath.row].episodes ?? []
        let titleCollectionViewHeight = seasonTitleCollectionView.frame.height
        let height: CGFloat = CGFloat(EpisodeListTableViewCell.cellHeight * epidsodeData.count) + titleCollectionViewHeight
        let size = CGSize(width: bottomCollectionView.frame.width, height: height)
        self.collectionViewHeightDelegate?.seasonsViewControllerDidChangeContent(size: size)
    }
    
}


// MARK: - UI Collection View
extension SeasonsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK:  UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.seasons.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == seasonTitleCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasonsCollectionViewCell", for: indexPath) as! SeasonsCollectionViewCell
            
            cell.seasonsTitle.text = "SEASON " + "\(indexPath.row + 1)"
            if indexPath == selectedSeasonIndex {
                cell.seasonsTitle.textColor = UIColor.white
                cell.selectedView.isHidden = false
            } else {
                cell.seasonsTitle.textColor = UIColor.lightGray
                cell.selectedView.isHidden = true
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasonsDetailCollectionViewCell", for: indexPath) as! SeasonsDetailCollectionViewCell
            let season = viewModel?.seasonsDetail[indexPath.row]
            cell.configure(season: season)
            cell.delegate = self
            return cell
        }
    }
    
    // MARK:  UICollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == seasonTitleCollectionView {
            selectedSeasonIndex = indexPath
            self.bottomCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            let bottomCollectionViewIndexpath = IndexPath(row: indexPath.row, section: 0)
            
            bottomCollectionView.isPagingEnabled = false // there's a bug if pagging is enabled then scrollToItem may not work properly
            bottomCollectionView.scrollToItem(at: bottomCollectionViewIndexpath, at: .centeredHorizontally, animated: true)
            bottomCollectionView.isPagingEnabled = true
            resizeForIndexPath(indexPath: bottomCollectionViewIndexpath)
            
//            fetchSeasonDetail(for: indexPath) { isSuccessful in
//                self.resizeForIndexPath(indexPath: indexPath)
//                self.preloadData(currentIndexpath: indexPath)
//            }
        }
    }
    
    func preloadData(currentIndexpath: IndexPath){
//        self.fetchSeasonDetail(for: nextIndexPath)
//        self.fetchSeasonDetail(for: previousIndexPath)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == seasonTitleCollectionView {
            let width = collectionView.bounds.width / 3
            let height = collectionView.bounds.height
            return CGSize(width: width, height: height)
        } else {
            let width = collectionView.bounds.width
            //            let episodeData = viewModel?.seasonsDetail?.episodes [indexPath.row]
            let episodeData = viewModel?.seasonsDetail[indexPath.row].episodes ?? []
            let titleCollectionViewHeight = seasonTitleCollectionView.frame.height
            let height: CGFloat = CGFloat(EpisodeListTableViewCell.cellHeight * episodeData.count) + titleCollectionViewHeight
            return CGSize(width: width, height: height)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
            if self.bottomCollectionView == scrollView {
                guard let indexPath = self.bottomCollectionView.centerIndexPath() else {
                    return
                }
                
                self.bottomCollectionView.visibleCells.forEach { cell in
                    print(self.bottomCollectionView.indexPath(for: cell)!)
                }
                
                self.selectedSeasonIndex = IndexPath(row: indexPath.row, section: 0)
                self.resizeForIndexPath(indexPath: indexPath)
//                self?.fetchSeasonDetail(for: indexPath) { isSuccessful in
                    self.resizeForIndexPath(indexPath: indexPath)
//                    self?.preloadData(currentIndexpath: indexPath)
//                }
            }
        
    }
}

extension SeasonsViewController: SeasonsDetailCollectionViewCellDelegate {
    
    func seasonsDetailCollectionViewCell(didSelectEpisodeIndex indexpath: IndexPath, atCell cell: SeasonsDetailCollectionViewCell) {
        guard let seasonIndexPath = self.bottomCollectionView.indexPath(for: cell),
        let season = viewModel?.seasonsDetail[seasonIndexPath.row],
         let episode =  season.episodes?[indexpath.row] else {
            return
        }
        
        
        delegate?.SeasonsViewController(didSelectEpisode: episode, inSeason: season)
    }
    
    
}
