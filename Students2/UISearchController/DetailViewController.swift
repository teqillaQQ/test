
import UIKit

class DetailViewController: UIViewController {
    
    var student: Students!

    @IBOutlet var studentImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = student.name
        studentImage.image = UIImage(named: student.name)
    }
}
