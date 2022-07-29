//
//  FPPhone.swift
//  Workruta
//
//  Created by The KING on 07/07/2022.
//

import SwiftUI

struct FPPhone: View {
    
    let this: ForgotPassViewController
    let that: ForgotPassUIView
    @State var phoneNumber = ""
    
    var body: some View {
        ZStack {
            Colors.white
            VStack(spacing: 0) {
                ZStack{
                    HStack {
                        HStack(spacing: 0){
                            Image("usa")
                                .resizable()
                                .frame(width: 17, height: 17)
                            Text(Strings._1)
                                .foregroundColor(Colors.black)
                                .font(.system(size: 17))
                        }
                        TextField("", text: $phoneNumber){
                            UIApplication.shared.hideKeyboard(hide: false)
                        }
                        .modifier(PlaceholderStyle(show: phoneNumber.isEmpty, text: Strings._508_712_3456))
                        .foregroundColor(Colors.black)
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity)
                        .keyboardType(UIKeyboardType.numberPad)
                        .disabled(that.requesting)
                    }
                    .padding(10)
                    .background(Colors.white).cornerRadius(10)
                    .foregroundColor(Colors.black)
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 7.0).stroke(Colors.mainColor, lineWidth: 1.0))
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 20)
                HStack(alignment: .center) {
                    Button {
                        that.gotoFragment(index: 1)
                    } label: {
                        Text(Strings.get_code_through_e_mail)
                            .foregroundColor(Colors.mainColor)
                            .font(.system(size: 14))
                    }
                    .padding(10)
                    Spacer()
                    Button {
                        if !that.requesting {
                            that.getVerificationCode(value: phoneNumber)
                        }
                    } label: {
                        Text(Strings.get_code)
                            .foregroundColor(Colors.white)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 20)
                            .font(.system(size: 18))
                            .cornerRadius(7.0)
                    }
                    .background(Colors.mainColor)
                    .cornerRadius(7.0)
                }
                .padding(10)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}
