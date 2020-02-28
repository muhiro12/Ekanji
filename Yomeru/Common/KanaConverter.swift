//
//  KanaConverter.swift
//  Yomeru
//
//  Created by Hiromu Nakano on 2020/01/22.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import Hydra

enum KanaConverter {
    case hiragana
    case katakana

    func run(with sentence: String) throws -> Promise<String> {
        var api: API
        switch self {
        case .hiragana:
            api = GooAPI.hiragana(sentence: sentence)
        case .katakana:
            api = GooAPI.katakana(sentence: sentence)
        }
        return async(in: .background) { _ in
            do {
                switch try await(api.request()) {
                case .success(let response):
                    return try JSONDecoder().decode(GooAPI.KanaResponse.self,
                                                    from: response.data).converted
                case .failure(let error as Error):
                    throw error
                }
            }
        }
    }
}
