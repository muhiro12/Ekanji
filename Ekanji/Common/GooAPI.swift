//
//  GooAPI.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/22.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import Moya
import Result
import Hydra

protocol API: TargetType {
    func request() -> Promise<Result<Response, MoyaError>>
}

enum GooAPI {
    case hiragana(sentence: String)
    case katakana(sentence: String)
}

extension GooAPI: API {

    func request() -> Promise<Result<Response, MoyaError>> {
        return Promise<Result<Response, MoyaError>> { resolve, _, _ in
            let provider = MoyaProvider<GooAPI>()
            provider.request(self) { result in
                resolve(result)
            }
        }
    }

}

extension GooAPI: TargetType {

    var baseURL: URL {
        return URL(string: "https://labs.goo.ne.jp")!
    }

    var path: String {
        switch self {
        case .hiragana, .katakana:
            return "/api/hiragana"
        }
    }

    var method: Moya.Method {
        switch self {
        case .hiragana, .katakana:
            return .post
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .hiragana(let sentence):
            let parameter = KanaRequest(app_id: Environment.appID,
                                        request_id: nil,
                                        sentence: sentence,
                                        output_type: "hiragana")
            return .requestJSONEncodable(parameter)
        case .katakana(let sentence):
            let parameter = KanaRequest(app_id: Environment.appID,
                                        request_id: nil,
                                        sentence: sentence,
                                        output_type: "katakana")
            return .requestJSONEncodable(parameter)
        }
    }

    var headers: [String: String]? {
        return nil
    }

}

extension GooAPI {
    struct KanaRequest: Encodable {
        let app_id: String
        let request_id: String?
        let sentence: String
        let output_type: String
    }

    struct KanaResponse: Decodable {
        let request_id: String
        let output_type: String
        let converted: String
    }
}
