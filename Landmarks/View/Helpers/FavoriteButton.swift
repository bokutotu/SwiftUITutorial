//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by HikaruKondo on 2023/06/10.
//

import SwiftUI

struct FavoriteButton: View {
    // q: what is @Binding?
    // a: A binding is a reference to a mutable state.
    @Binding var isSet: Bool

    var body: some View {
        Button {
            // q: please explain what toggle method is?
            // a: toggle() method is change the value of isSet.
            // q: toggle method is implemented to bool type only?
            // a: I think, yes.
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        // q: what is .constant?
        // a: A constant value.
        // q: constant is mutable or immutable?
        // a: immutable.
        // q: if immutable, why use constant? becase any one cannot change this value, 
        //    what is the difference between normal val?
        // a: I think, if use constant, we can know this value is immutable.
        // q: start from "." is syntax sugar which omit the name of class?
        // a: I think, yes.
        FavoriteButton(isSet: .constant(true))
    }
}
