//
//  UploadPostView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 2.08.2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var caption = ""
    @State private var imagePickerPresented = false
   // @State private var photoItem: PhotosPickerItem? // çünkü foto seçilmemiş de olabilir
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    var body: some View {
        VStack{
            // action toolbar
            HStack{
                Button{
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0
                }label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            // post ve açıklaması
            HStack{
                if let image = viewModel.postImage{
                    image
                        .resizable()
                        .scaledToFit()
                       // .scaledToFill()
                        .clipped()
                        .frame(width: 100, height: 100)
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical) // metin uzayınca alta geçsin diye
            }
            Spacer()
        }
        .onAppear(){
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
