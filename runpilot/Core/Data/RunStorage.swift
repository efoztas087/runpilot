//
//  RunStorage.swift
//  runpilot
//
//  Created by Efe Oztas on 05/11/2025.
//

import Foundation

final class RunStorage {
    private let key = "savedRuns"
    
    func saveRun(_ run: Run) {
        var allRuns = loadRuns()
        allRuns.append(run)
        if let data = try? JSONEncoder().encode(allRuns) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func loadRuns() -> [Run] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let runs = try? JSONDecoder().decode([Run].self, from: data)
        else { return [] }
        return runs
    }
}
