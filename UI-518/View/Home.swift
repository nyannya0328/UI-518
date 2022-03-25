//
//  Home.swift
//  UI-518
//
//  Created by nyannyan0328 on 2022/03/25.
//

import SwiftUI

struct Home: View {
    @State var currentType : String = "Popular"
    @State var _albums : [Album] =  albums
    @Namespace var animation
    
    @State var headerOffsets : (CGFloat,CGFloat) = (0,0)
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack{
                
                
                HeaderView()
                
                
                LazyVStack(pinnedViews: .sectionHeaders) {
                    
                    
                   
                    
                    Section {
                        SongList()
                        
                    } header: {
                        
                        PinnedHeaderView()
                            .background(.black)
                            .offset(y: headerOffsets.1 > 0 ? 0 : -headerOffsets.1 / 8)
                            .modifier(OffsetModifier(offset: $headerOffsets.0, returnFromStart: false))
                            .modifier(OffsetModifier(offset: $headerOffsets.1))
                          
                        
                    }

                }
                
            }
        }
        .overlay(content: {
            
            Rectangle()
                .fill(.black)
                .frame(height: 50)
                .frame(maxHeight:.infinity,alignment: .top)
                .opacity(headerOffsets.0 < 5 ? 1 : 0)
            
        })
        .coordinateSpace(name: "SCROLL")
        .ignoresSafeArea(.container, edges: .vertical)
        
    }
    
    @ViewBuilder
    func SongList()->some View{
        
        VStack{
            
            
            ForEach($_albums){$alubum in
                
                HStack(spacing:15){
                    
                    
                    Text("# \(getIndex(album:alubum))")
                    
                    Image(alubum.albumImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
                    
                    VStack(alignment: .leading, spacing: 13) {
                        
                        
                        Text(alubum.albumName)
                            .font(.subheadline)
                        
                        HStack(spacing:14){
                            
                            Image(systemName: "headphones")
                                .font(.system(size: 20, weight: .light))
                            
                            Text("622,555,6666")
                                .font(.caption.weight(.light))
                        }
                        
                    }
                    .frame(maxWidth:.infinity,alignment: .leading)
                    
                    
                    
                    Button {
                        withAnimation{
                            
                            alubum.isLiked.toggle()
                            
                        }
                    } label: {
                        
                        
                        Image(systemName: alubum.isLiked ? "suit.heart.fill" : "suit.heart")
                            .foregroundColor(alubum.isLiked ? .green : .white)
                    }
                    
                    
                    Button {
                        
                    } label: {
                        
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    }


                }
                
            }
        }
        .padding(.top,15)
        .padding(.leading,15)
        .padding(.bottom,150)
        
        
    }
    @ViewBuilder
    func PinnedHeaderView()->some View{
        
        let types: [String] = ["Popular","Albums","Songs","Fans also like","About"]
        
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            
            HStack(spacing:15){
                
                ForEach(types,id:\.self){type in
                    
                    
                    VStack(spacing:15){
                        
                        
                        Text(type)
                            .font(.title3.weight(.thin))
                            .foregroundColor(currentType == type ? .white : .gray)
                            
                        
                        ZStack{
                            
                            if currentType == type{
                                
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 1)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                            else{
                                
                                Rectangle()
                                    .fill(.clear)
                                    .frame(height: 1)
                                
                                
                            }
                        }
                        
                        
                        
                    }
                    
                    .contentShape(Rectangle())
                    .onTapGesture {
                        
                        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)){
                            
                            currentType = type
                        }
                    }
                    
                }
                
                
            }
            .padding(.horizontal)
            .padding(.top,15)
        }
        
        
        
    }
    
    @ViewBuilder
    func HeaderView()->some View{
        
        GeometryReader{proxy in
            
            
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = (size.height + minY)
            
            
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: height > 0 ? height : 0,alignment: .top)
               
                
                .overlay(alignment: .bottom) {
                    
                    
                    ZStack(alignment: .bottom) {
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            
                            Text("Animal")
                                .font(.title2.weight(.medium))
                            
                            HStack(spacing:15){
                                
                                Text("Lion King")
                                    .font(.largeTitle.weight(.black))
                                
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.orange)
                                    .background(
                                    
                                    Circle()
                                        .fill(.blue)
                                        .padding(3)
                                        
                                    
                                    )
                                
                            }
                            
                            
                            Label {
                                
                                Text("Monthly Listerners")
                                    .font(.callout.weight(.thin))
                                    .foregroundColor(.gray)
                                
                            } icon: {
                                
                                Text("622,555,6666")
                                    .font(.footnote.weight(.black))
                                
                            
                            }

                                
                            
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom,8)
                        
                        
                    }
                    
                    
                }
            
                .cornerRadius(10)
                .offset(y: -minY)
        }
        .frame(height:250)
        
        
        
        
    }
    
    func getIndex(album : Album)->Int{
        
        return albums.firstIndex { currentIndex in
            
            album.id == currentIndex.id
            
        } ?? 0
        
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
