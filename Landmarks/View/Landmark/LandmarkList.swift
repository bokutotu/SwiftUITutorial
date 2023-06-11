//
//  LandmarkList.swift
//  Landmarks
//
//  Created by HikaruKondo on 2023/06/09.
//

import SwiftUI

// q: this struct looks inherit from View. what is View?
// a: View is a protocol that describes the view's content and layout.
//    this struct is a view.
struct LandmarkList: View {
    // q: what is @EnvironmentObject?
    // a: @EnvironmentObject is a property wrapper type that reads a value from the environment.
    //    this property wrapper type is used to read the model data.
    // q: where is stored environment? and which class initialize the environment?
    // a: the environment is stored in the environment variable.
    //    the environment is initialized by the system.
    // q: could environment be ObservableObject?
    // a: yes, it could be.
    // q: when is the environment initialized?
    // a: the environment is initialized when the app is launched.
    // q: ObservableObject is useState in React and Environment is useContext in React?
    // a: yes, it is.
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show Favorite Only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
