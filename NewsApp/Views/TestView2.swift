//
//  TestView2.swift
//  NewsApp
//
//  Created by Usertqi on 24/08/21.
//

import SwiftUI
import URLImage

struct TestView2: View {
    
    let article: Article
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            if let imgUrl = article.image, let url = URL(string: imgUrl) {
                URLImage(url: url,
                    failure: { _, _ in
                        PlaceHolderImageView2()
                },
                    content: { image, _ in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
            } else {
                PlaceHolderImageView2()
            }
            
            VStack(alignment: .leading, spacing: 5, content: {
                Text(article.title)
                    .foregroundColor(.blue)
                    .font(.system(size: 16, weight: .black))
                Text(article.source)
                    .foregroundColor(.gray)
                    .font(.footnote)
            })
        }
    }
}

struct PlaceHolderImageView2: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.gray)
            .background(Color.white)
            .font(.system(size: 100, weight: .heavy))
    }
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2(article: Article.dummyData)
    }
}
