
import UIKit
import QuartzCore

class MainViewController: UIViewController {

    var label = UILabel()
    var lineChart: LineChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var views: [String: AnyObject] = [:]
        let data: [CGFloat] = [234, 267, 212, 223, 254, 234,213, 280, 235, 221,230,213]
        
        lineChart = LineChart()
        lineChart.addLine(data)
        lineChart.backgroundColor = UIColor(red: 232/255.0, green: 233/255.0, blue: 237/255.0, alpha: 1)
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[chart(==150)]", options: [], metrics: nil, views: views))
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
