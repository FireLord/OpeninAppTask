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
}
