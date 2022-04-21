//
//  SignUpViewModel.swift
//  REC-ON (SUI)
//
//  Created by Miguel Tor on 4/5/22.
//

/*import Foundation
import Combine

enum SignUpState {
    case successfull
    case failed(error: Error)
    case na
}


protocol SignUpViewModel {
    
    func signUp()
    var service: SignUpService { get }
    var state: SignUpState { get }
    var userDetails: SignUpDetails { get }
    init(service: SignUpService)
}


final class SignUpViewModelImpl: ObservableObject, SignUpViewModel {
    
    let service: SignUpService
    
    var state: SignUpState = .na
    
    var userDetails: SignUpDetails = SignUpDetails.new
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: SignUpService) {
        self.service = service
    }
    
    func signUp() {
        
        service
            .signUp(with: userDetails)
            .sink { [weak self] res in
                
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
                
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subscriptions)
    }
}
*/
