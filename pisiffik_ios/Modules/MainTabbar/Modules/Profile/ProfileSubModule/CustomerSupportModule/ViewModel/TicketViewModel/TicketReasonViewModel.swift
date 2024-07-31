//
//  TicketReasonViewModel.swift
//  pisiffik_ios
//
//  Created by Haider Ali on 22/08/2022.
//  Copyright © 2022 softwareAlliance. All rights reserved.
//

import Foundation

protocol TicketReasonViewModelDelegate : BaseProtocol {
    func didReceiveTicketReason(response: TicketReasonResponse)
    func didReceiveAddTicketListResponseWithWith(errorMessage: [String]?,statusCode: Int?)
}

struct TicketReasonViewModel {
    
    private let resource = TicketReasonResource()
    var delegate : TicketReasonViewModelDelegate?
    
    func getNewTicketReason(){
        
        resource.getReasons { result, statusCode in
            
            DispatchQueue.main.async {
                
                guard let statusCode = statusCode else { return }
                
                switch statusCode{
                    
                case 401:
                    self.delegate?.didReceiveUnauthentic(error: [PisiffikStrings.sessionExpired()])
                    
                case 500...599:
                    self.delegate?.didReceiveServer(error: [PisiffikStrings.somethingWentWron()],type: APIType.homeAPI,indexPath: 0)
                    
                default:
                    
                    guard let result = result else {
                        self.delegate?.didReceiveAddTicketListResponseWithWith(errorMessage: [PisiffikStrings.somethingWentWron()], statusCode: statusCode)
                        return
                    }
                    
                    if result.error != nil{
                        self.delegate?.didReceiveAddTicketListResponseWithWith(errorMessage: result.error, statusCode: statusCode)
                    }else{
                        self.delegate?.didReceiveTicketReason(response: result)
                    }
                    
                }
                
            }
            
        }
        
    }
    
}