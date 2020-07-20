//
//  Header.swift
//  Flower-Delivery
//
//  Created by Avisa Poshtkouhi on 7/20/20.
//  Copyright © 2020 Avisa Poshtkouhi. All rights reserved.
//

import SwiftUI

class Header: UICollectionReusableView {
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.text = "Category"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
}
