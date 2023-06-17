//
//  MenuUseCase.swift
//  CloneFacebook
//
//  Created by TungLT on 6/13/23.
//

import Foundation
protocol MenuUseCaseProtocol {
    func didTapLogOutButton(completion: @escaping () -> Void, error: @escaping (Error) -> Void)
}
