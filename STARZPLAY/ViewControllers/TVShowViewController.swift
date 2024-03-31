//
//  ViewController.swift
//  STARZPLAY
//
//  Created by umair on 27/03/2024.
//

import UIKit

class TVShowViewController: UIViewController, SeasonsVCHeightDelegate {
    func seasonsViewControllerDidChangeContent(size: CGSize) {
        // Update the constant of the contentHeight constraint with the new height
        DispatchQueue.main.async {
            self.contentHeight.constant = size.height
            // Animate the constraint change
            UIView.animate(withDuration: 0.3) {
                // Ensure the layout is updated within the animation block
                self.view.layoutIfNeeded()
            }
        }
  
    }
    
    
    
    
    //MARK: - Outlets
    @IBOutlet weak var showPosterImage: UIImageView!
    @IBOutlet weak var tvShowName: UILabel!
    @IBOutlet weak var showYear: UILabel!
    @IBOutlet weak var numberOfSeason: UILabel!
    @IBOutlet weak var tvShowOverview: UILabel!
    @IBOutlet weak var readMoreButtonTitle: UIButton!
    
    
    @IBOutlet weak var episodeListView: UIView!
    @IBOutlet weak var contentHeight: NSLayoutConstraint!
    
    @IBOutlet weak var watchListBtn: UIButton!
    @IBOutlet weak var iLikeItBtn: UIButton!
    @IBOutlet weak var dontLikeBtn: UIButton!
    
    @IBOutlet weak var gradientView: UIView!
    
    let viewModel = TVShowViewModel()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchShowData()
        DispatchQueue.main.async { [weak self] in
            self?.gradientView.addGradient(colors: [
                .black,
                .black.withAlphaComponent(0.5),
                .black.withAlphaComponent(0.2),
                .black.withAlphaComponent(0.1),
                .lightGray.withAlphaComponent(0),
                .lightGray.withAlphaComponent(0),
                .lightGray.withAlphaComponent(0),
                .lightGray.withAlphaComponent(0)
            ],
                                     direction: .bottomToTop)
            
        }
    }
    //MARK: - Actions
    @IBAction func readMoreButton(_ sender: UIButton) {
        tvShowOverview.numberOfLines = sender.isSelected ? 3 : 0
        let title  = sender.isSelected ? "Read more" : "Read less"
        DispatchQueue.main.async { [weak self] in
            self?.readMoreButtonTitle.setTitle(title, for: .normal)
        }
        sender.isSelected.toggle()
    }
    
    @IBAction func playButton() {
        playEpisode()
    }
    
    @IBAction func trailorButton() {
        playEpisode()
    }
    
    //MARK: - Functions
    
    func setupUI() {
        tvShowOverview.text = viewModel.tvShowOverView
        numberOfSeason.text = viewModel.numberOfSeasons + " Seasons"
        tvShowName.text = viewModel.tvShowName
        showYear.text = viewModel.tvShowYear
        if let url = viewModel.tvShowPosterURL {
            showPosterImage.loadImage(from: url, placeholder: UIImage(named: "placeholder"))
        }
    }
    
    
    func fetchShowData() {
        viewModel.requestTVShowDetails(endPoint: NetworkConstants.EndPoints.series_id) { showDetails in
            DispatchQueue.main.async {
                print(showDetails)
                self.viewModel.tvShowModel = showDetails
                DispatchQueue.main.async { [weak self] in
                    self?.loadSeasonsDetailVC()
                    self?.setupUI()
                }
            }
            
        } failure: { error in
            print("\(String(describing: error?.localizedDescription))")
        }
    }
    
    
    private func loadSeasonsDetailVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let childViewController = storyboard.instantiateViewController(withIdentifier: "ScrollableViewController") as? SeasonsViewController else {
            fatalError("Unable to instantiate child view controller")
        }
        childViewController.collectionViewHeightDelegate = self
        guard let seasons = self.viewModel.tvShowModel?.seasons else {
            print("unable to load ScrollableViewController / no seasons found")
            return
        }
        let viewModel = SeasonsViewModel(seasons: seasons)
        childViewController.viewModel = viewModel
        childViewController.delegate = self
        add(childViewController: childViewController, to: episodeListView)
    }
    
    func playEpisode() {
        let videoURLStr = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
        if let url = URL(string: videoURLStr)  {
            let videoPlayerVC = VideoPlayerViewController()
            videoPlayerVC.videoURL = url
            self.present(videoPlayerVC, animated: true, completion: nil)
        }
    }
}


extension TVShowViewController: SeasonsViewControllerDelegate {
    
    func SeasonsViewController(didSelectEpisode episode: Episodes, inSeason season: SeasonsDetail) {
        print("trying to play episode \(episode.name ?? "unknown" ) in season \(season.name ?? "unknown")")
        playEpisode()
    }
    
    
}
