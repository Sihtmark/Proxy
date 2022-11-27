//
//  DetailViewController.swift
//  Proxy
//
//  Created by Sergei Poluboiarinov on 2022-11-27.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let url = URL(string: "https://picsum.photos/400/600")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }
    
    func loadImage() {
        let imageService = LoadImageService()
        let proxy = Proxy(service: imageService)
        
        proxy.loadImage(url: url) { [weak self] (data, responce, error) in
            guard let self = self, let data = data, error == nil else {return}
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        cacheData = nil
        imageView.image = nil
        loadImage()
    }
    
}
