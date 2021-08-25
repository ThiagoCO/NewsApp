//
//  ArticleView.swift
//  NewsApp
//
//  Created by Usertqi on 04/08/21.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 4) {
            if let imgUrl = article.image, let url = URL(string: imgUrl) {
                URLImage(url: url,
                         failure: { error, _ in
                            PlaceHolderImageView()
                         },
                         content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                         })
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else {
                PlaceHolderImageView()
            }
            
            VStack(alignment: .leading, spacing: 2, content: {
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

struct PlaceHolderImageView: View {
    
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
    
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
        PlaceHolderImageView()
            .previewLayout(.sizeThatFits)
    }
}
