//
//  CollectionReusableView.swift
//  RUM Mobile Demo App
//
//  Created by Akash Patel on 10/01/22.
//

import Foundation
import UIKit

class ProductDetailsHeader: UICollectionReusableView {
    
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductDescription: UILabel!
    @IBOutlet weak var txtQty: UITextField!
    @IBOutlet weak var btnAddToCart: UIButton!
    let quantityArray = ["1","2","3","4","5","10"]
    var qtyPickerView = UIPickerView()
    var qtyUpdatedCallBack: ((_ qty: String) -> Void)?
    
    override func awakeFromNib() {
        qtyPickerView.delegate = self
        qtyPickerView.dataSource = self
        txtQty.inputView = qtyPickerView
    }
    
}

extension ProductDetailsHeader: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quantityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return quantityArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtQty.text = quantityArray[row]
        qtyUpdatedCallBack?(quantityArray[row])
    }

}
