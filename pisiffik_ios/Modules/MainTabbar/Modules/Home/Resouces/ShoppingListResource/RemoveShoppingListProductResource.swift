//
//  RemoveShoppingListProductResource.swift
//  pisiffik_ios
//
//  Created by Haider Ali on 29/07/2022.
//  Copyright © 2022 softwareAlliance. All rights reserved.
//

import Foundation

struct RemoveShoppingListProductResource{
    
    private let endPoint : String = "/shoppoingList/removeProduct"
    
    func removeProductFromList(request: RemoveProductRequest, completion: @escaping (_ result: RemoveProductResponse?,_ statusCode: Int?) -> Void){
        
        do{
            
            let param = try request.asDictionary()
            
            NetworkManager.postRequest(endPoint: endPoint, params: param, dataModel: RemoveProductResponse.self) { results, statusCode in
                completion(results, statusCode)
            }
            
        }catch let error{
            debugPrint(error.localizedDescription)
            completion(nil,nil)
        }
        
    }
    
}