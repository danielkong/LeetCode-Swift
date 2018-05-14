//
//  Movie.swift
//  koa
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//
/**
 {
 "wrapperType": "track",
 "kind": "feature-movie",
 "artistId": 909253,
 "trackId": 333728932,
 "artistName": "Jack Johnson",
 "trackName": "Jack Johnson: En Concert",
 "trackCensoredName": "Jack Johnson: En Concert",
 "artistViewUrl": "https://itunes.apple.com/us/artist/jack-johnson/909253?uo=4",
 "trackViewUrl": "https://itunes.apple.com/us/movie/jack-johnson-en-concert/id333728932?uo=4",
 "previewUrl": "http://video.itunes.apple.com/apple-assets-us-std-000001/Video128/v4/be/ef/af/beefaffe-6278-4336-07a1-de180ddaeaf8/mzvf_1177979557611386379.640x468.h264lc.U.p.m4v",
 "artworkUrl30": "https://is2-ssl.mzstatic.com/image/thumb/Video/v4/b7/f6/89/b7f6899e-354c-c502-5d6f-9c4a12f9dffb/source/30x30bb.jpg",
 "artworkUrl60": "https://is2-ssl.mzstatic.com/image/thumb/Video/v4/b7/f6/89/b7f6899e-354c-c502-5d6f-9c4a12f9dffb/source/60x60bb.jpg",
 "artworkUrl100": "https://is2-ssl.mzstatic.com/image/thumb/Video/v4/b7/f6/89/b7f6899e-354c-c502-5d6f-9c4a12f9dffb/source/100x100bb.jpg",
 "collectionPrice": 12.99,
 "trackPrice": 12.99,
 "releaseDate": "2009-01-01T08:00:00Z",
 "collectionExplicitness": "notExplicit",
 "trackExplicitness": "notExplicit",
 "trackTimeMillis": 4773648,
 "country": "USA",
 "currency": "USD",
 "primaryGenreName": "Concert Films",
 "contentAdvisoryRating": "NR",
 "shortDescription": "Jack Johnson:: En Concert A Live Film and Album. Words by Emmett Malloy (filmmaker) I began making",
 "longDescription": "Jack Johnson:: En Concert A Live Film and Album. Words by Emmett Malloy (filmmaker) I began making films about 10 years ago with Jack. We became good friends right away, and seemed to be into the same sort of films, but both of us did not know a whole lot about the process. So we started with what we knew best.making surf films. We made a couple of films together, and it wasn't long before Jack figured out making music was his real calling. So I lost my favorite cinematographer in Jack, but gained a new favorite musician. Now several years later, I have been lucky enough to be able to document the last decade of Jack's music career. This past summer, a couple of friends and I went to Europe with Jack and his band for a tour supporting his last record, Sleep Through the Static. We brought a couple of cameras and microphones because it seemed like a great tour to capture. Jack Johnson::En Concert was the result of that decision. There was a point in the middle of the European tour where I was on stage behind Jack as he sang one of his most intimate love songs, \"Better Together\". Looking through my lens I focused in on Jack standing alone in front of 20,000 fans. Lighters and cell phones lit up the crowd, illuminating most all of the audience that was singing along. It was the biggest backup vocal section I had ever witnessed, and it looked and sounded beautiful. As I focused my camera on the crowd, I began to see all the details of the fans. What went through my head was that we were in Paris, France, and suddenly the language barrier had no restrictions. Everyone knew the translation for Jack's simple message, that \"it's so much better when we're together.\" This connection with the fans continued to happen in every country we traveled to around the world. These simple messages and testaments of love and family are what make Jack's music so popular around the globe. As the filmmaker I really enjoyed being able to document the honest relationship between an artist and his fans. No matter where we were in the world that year, it was clear that everyone understood and believed in what Jack was singing about. Jack Johnson:: En Concert is a documentation of Jack and his band playing some of the most historic venues throughout Europe, and everything interesting they did in between shows. Jack really does not like to be on the other side of the lens. Getting a shot of him is kind of similar to getting a shot of the Loch Ness Monster; it's a rare occurrence. Surprisingly, he let our cameras really join him on this tour. I just knew that I better keep a guitar or surfboard in his hands, because with either of those weapons he seemed to never know we were there. Enjoy the film. Emmett Malloy JACK JOHNSON EN CONCERT"
 }
 */

import Foundation

struct Movie: Codable, Hashable {
    var hashValue: Int {
        return trackId.hashValue
    }
    
    let wrapperType: String?
    let kind: String?
    let artistId: Int?
    let trackId: Int32
    let artistName: String?
    let trackName: String?
    let trackCensoredName: String?
    let artistViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl30: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let trackPrice: Double?
    let releaseDate: String?
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let trackTimeMillis: Int32?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let contentAdvisoryRating: String?
    let shortDescription: String?
    let longDescription: String?
    
    // transforming data
    var releaseYear: String? {
        let arr = releaseDate?.split(separator: "-")
        if let arr = arr, let year = arr.first {
            return String(year)
        }
        return ""
    }
    
    var durationTime: String? {
        if let millis = trackTimeMillis {
            let minutes = millis/60000
            return String(minutes) + (minutes > 1 ? " mins":" min")
        }
        return ""
    }
}
