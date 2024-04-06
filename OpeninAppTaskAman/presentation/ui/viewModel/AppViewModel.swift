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
    
    // MARK: API usecase
    private let getRecentLinkUseCase = GetRecentLinkUseCase(linkRepository: LinkRepositoryImpl(linkRemoteDataSource: LinkRemoteDataSourceImpl()))
    private let getTopLinkUseCase = GetTopLinkUseCase(linkRepository: LinkRepositoryImpl(linkRemoteDataSource: LinkRemoteDataSourceImpl()))
    
    func getRecentLinkList() async {
        isLoading = true
        do {
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
}
