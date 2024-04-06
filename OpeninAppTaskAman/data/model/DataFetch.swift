//
//  DataFetch.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

struct DataFetch: Decodable {
    let status: Bool
    let statusCode: Int
    let message: String
    let support_whatsapp_number: String
    let extra_income: Double
    let total_links: Int
    let total_clicks: Int
    let today_clicks: Int
    let top_source: String
    let top_location: String
    let startTime: String
    let links_created_today: Int
    let applied_campaign: Int
    let data: DataClass
}

struct LinkData: Codable, Identifiable {
    var id: Int { url_id }
    let url_id: Int
    let web_link: String
    let smart_link: String
    let title: String
    let total_clicks: Int
    let original_image: String
    let thumbnail: String?
    let times_ago: String
    let created_at: String
    let domain_id: String
    let url_prefix: String?
    let url_suffix: String
    let app: String
    let is_favourite: Bool
    
    static var sampleExample: LinkData = LinkData(
        url_id: 146110,
        web_link: "https://inopenapp.com/estt3",
        smart_link: "inopenapp.com/estt3",
        title: "Dailyhunt",
        total_clicks: 100,
        original_image: "https://m.dailyhunt.in/assets/img/apple-touch-icon-72x72.png?mode=pwa&ver=2.0.76",
        thumbnail: nil,
        times_ago: "1 yr ago",
        created_at: "2023-03-09T08:00:05.000Z",
        domain_id: "inopenapp.com/",
        url_prefix: nil,
        url_suffix: "estt3",
        app: "dailyhunt",
        is_favourite: false
    )
}

struct DataClass: Codable {
    let recent_links: [LinkData]
    let top_links: [LinkData]
    let favourite_links: [String]
    let overall_url_chart: [String: Int]
}
