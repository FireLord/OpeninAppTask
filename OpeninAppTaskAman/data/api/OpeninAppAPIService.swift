//
//  OpeninAppAPIService.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

final class OpeninAppAPIService {
    static let shared = OpeninAppAPIService()
    static let baseURL = "https://api.inopenapp.com/api/v1/"
    private let newDashboard = baseURL + "dashboardNew"
    private let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    func getAllRecentData() async throws ->  [LinkData] {
        guard let url = URL(string: newDashboard) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodeResponse = try decoder.decode(DataFetch.self, from: data)
            return decodeResponse.data.recent_links
        } catch {
            throw APIError.invalidData
        }
    }
    
    func getAllTopData() async throws ->  [LinkData] {
        guard let url = URL(string: newDashboard) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodeResponse = try decoder.decode(DataFetch.self, from: data)
            return decodeResponse.data.top_links
        } catch {
            throw APIError.invalidData
        }
    }
}
