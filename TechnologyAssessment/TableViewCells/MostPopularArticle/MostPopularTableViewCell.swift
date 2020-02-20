//
//  MostPopularTableViewCell.swift
//  TechnologyAssessment
//
//  Created by MACBOOK on 20/02/2020.
//  Copyright © 2020 MACBOOK. All rights reserved.
//

import Foundation
import UIKit

class ArticleCell : UITableViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblArticleAbstract: UILabel!
    @IBOutlet weak var lblArticleByline: UILabel!
    @IBOutlet weak var lblArticlePublishedDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(object: APIResults) {
        lblArticleTitle.text = object.abstract
        lblArticleAbstract.text = object.title
        lblArticleByline.text = object.byline
        lblArticlePublishedDate.text = object.published_date
        let imageURL : String? = object.media?.first?.media_metadata?.first?.url
        if let url = URL(string: imageURL ?? "") {
            articleImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "avatar"), options: [], completed: nil)
        }
    }
}
