//
//  JsonDataManager.swift
//  
//
//  Created by etudiant on 15/06/2023.
//

import Foundation
import UCAverageData
import UCAverageModel

public class JsonDataManager: DataManagerProtocol {

    public init(withFilename filename: String) {
        self.filename = filename
    }
    
    public private(set) var filename: String
    
    
    private func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent(filename)
    }
    
    public func load() async throws -> [Block] {
        let task = Task<[Block], Error> {
            let fileURL = try self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let blocks = try JSONDecoder().decode([Block].self, from: data)
            return blocks
        }
        let blocks = try await task.value
        return blocks
    }
    
    public func save(_ blocks: [Block]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(blocks)
            let outfile = try self.fileURL()
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
}
