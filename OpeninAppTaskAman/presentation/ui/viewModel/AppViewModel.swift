//
//  AppViewModel.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

@MainActor
final class AppViewModel: ObservableObject {
    // MARK: API variables
    @Published var linkDataList: [LinkData] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isTopLinkSelected = true
    @Published var sourceDataList = Source.sampleExample
    @Published var plotDataList: [PlotData] = []
    
    // MARK: API usecase
    private let getRecentLinkUseCase = GetRecentLinkUseCase(linkRepository: LinkRepositoryImpl(linkRemoteDataSource: LinkRemoteDataSourceImpl()))
    private let getTopLinkUseCase = GetTopLinkUseCase(linkRepository: LinkRepositoryImpl(linkRemoteDataSource: LinkRemoteDataSourceImpl()))
    private let getSourceDataUseCase = GetSourceDataUseCase(linkRepository: LinkRepositoryImpl(linkRemoteDataSource: LinkRemoteDataSourceImpl()))
    
    func getRecentLinkList() async {
        isLoading = true
        do {
            // MARK: We can call the getSourceDataUseCase like this getSourceDataUseCase.execute().data.recent_links
            // MARK: but im making it different for future use like calling another api url
            linkDataList = try await getRecentLinkUseCase.execute()
            var consolidatedData = [Int: Double]()
            for item in linkDataList {
                if let month = getMonthIndex(from: item.created_at) {
                    let value = Double(item.total_clicks)
                    if let existingValue = consolidatedData[month] {
                        consolidatedData[month] = existingValue + value
                    } else {
                        consolidatedData[month] = value
                    }
                }
            }
            
            plotDataList = []
            plotDataList = consolidatedData.map { PlotData(month: $0.key, value: $0.value) }
                .sorted { $0.month < $1.month }
            print("PlotdataRecentList: \(plotDataList)")
            isLoading = false
        } catch {
            print("\(error.localizedDescription)")
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            } else if let scError = error as? APIError {
                switch scError {
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                case .invalidData:
                    alertItem = AlertContext.invalidData
                }
            }
            isLoading = false
        }
    }
    
    func getTopLinkList() async {
        isLoading = true
        do {
            linkDataList = try await getTopLinkUseCase.execute()
            var consolidatedData = [Int: Double]()
            for item in linkDataList {
                if let month = getMonthIndex(from: item.created_at) {
                    let value = Double(item.total_clicks)
                    if let existingValue = consolidatedData[month] {
                        consolidatedData[month] = existingValue + value
                    } else {
                        consolidatedData[month] = value
                    }
                }
            }
            
            plotDataList = []
            plotDataList = consolidatedData.map { PlotData(month: $0.key, value: $0.value) }
                .sorted { $0.month < $1.month }
            print("PlotdataTopList: \(plotDataList)")
            isLoading = false
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            } else if let scError = error as? APIError {
                switch scError {
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                case .invalidData:
                    alertItem = AlertContext.invalidData
                }
            }
            isLoading = false
        }
    }
    
    func getSourceData() async {
        isLoading = true
        do {
            let sourceData = try await getSourceDataUseCase.execute()
            sourceDataList = [
                Source(name: "\(sourceData.today_clicks)", iconName: "arrow", description: "Today's clicks"),
                Source(name: sourceData.top_location, iconName: "map", description: "Top Location"),
                Source(name: sourceData.top_source, iconName: "globe", description: "Top Source")
            ]
            isLoading = false
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            } else if let scError = error as? APIError {
                switch scError {
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                case .invalidData:
                    alertItem = AlertContext.invalidData
                }
            }
            isLoading = false
        }
    }
    
    func getMonthIndex(from dateString: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        
        return month
    }
}
