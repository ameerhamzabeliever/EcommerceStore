//
//  AddToSoppingListResource.swift
//  pisiffik_ios
//
//  Created by Haider Ali on 28/07/2022.
//  Copyright © 2022 softwareAlliance. All rights reserved.
//

import Foundation

struct AddToSoppingListResource{
    
    private let endPoint : String = "/shoppoingList/addProducts"
    
    func addToShoppingList(request: AddToShoppingProductRequest,completion: @escaping (_ result: AddPisiffikProductToShoppingResponse?, _ status: Int?) -> Void){
        
        do{
            
            let param = try request.asDictionary()
            
            NetworkManager.postRequest(endPoint: endPoint, params: param, dataModel: AddPisiffikProductToShoppingResponse.self) { results, statusCode in
                completion(results, statusCode)
            }
            
        }catch let error{
            debugPrint(error.localizedDescription)
            completion(nil,nil)
        }
        
        
    }
    
    
}
