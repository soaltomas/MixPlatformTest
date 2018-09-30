import UIKit

class VideoViewController: UITableViewController {
    
    let cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        self.tableView.separatorColor = .black
        self.tableView.allowsSelection = false
        
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = Constants.video
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 2.5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! VideoTableViewCell
        return cell
    }
}

