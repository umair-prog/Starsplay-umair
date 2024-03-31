import UIKit

protocol SeasonsDetailCollectionViewCellDelegate: AnyObject {
    func seasonsDetailCollectionViewCell(didSelectEpisodeIndex indexpath: IndexPath, atCell cell: SeasonsDetailCollectionViewCell)
}


class SeasonsDetailCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {

    
    //MARK: - Outlets
    @IBOutlet weak var episodeListTableView: UITableView!

    var seasonDetail: SeasonsDetail?
    weak var delegate: SeasonsDetailCollectionViewCellDelegate?
    
    //MARK: - Life cycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set the data source and delegate for the table view
        episodeListTableView.dataSource = self
        episodeListTableView.delegate = self
        
        // Register custom cell if needed
        episodeListTableView.register(UINib(nibName: "EpisodeListTableViewCell", bundle: nil), forCellReuseIdentifier: "EpisodeListTableViewCell")

    }
    
    //MARK: - Methods
    
    func configure(season: SeasonsDetail?){
        self.seasonDetail = season
        self.episodeListTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonDetail?.episodes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeListTableViewCell", for: indexPath) as! EpisodeListTableViewCell
        let episode = seasonDetail?.episodes?[indexPath.row]
        cell.episodeNameLable.text = episode?.name
        let imageURLStr = NetworkConstants.imageBaseUrl + (episode?.still_path ?? "")
        guard let url = URL(string: imageURLStr) else {
            print("invalid image url")
            return cell
        }
        cell.episodeImage.loadImage(from: url)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.seasonsDetailCollectionViewCell(didSelectEpisodeIndex: indexPath, atCell: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 120 // Set the height of the cell
       }
    
}
