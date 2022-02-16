//
//  NetworkManger.swift
//  AniWall
//
//  Created by Adam O. on 2/15/22.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    @Published var imageModel: ImageModel?
    var cancellables: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://api.waifu.pics/sfw/waifu")!
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ImageModel.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                 print("Details: \(error.localizedDescription)")
                }
            }, receiveValue: { [unowned self] image in
                imageModel = image
            })
            .store(in: &cancellables)
    }
}
