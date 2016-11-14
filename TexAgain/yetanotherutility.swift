//
//  yetanotherutility.swift
//  TexAgain
//
//  Created by Dude Guy on 11/10/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

func appendDict<T1, T2>(_ dict: [T1: T2], key: T1, value: T2) -> [T1: T2] {
    var newDict = dict
    newDict[key] = value
	return newDict
}


  let s = "-"
  let d = "D:"
  let l = "*"
  let c = "::"
	let n = "\n"

var gLines = 0; func wait(_ clear: Bool = false) {
	_=readLine();	if clear { for i in 0...gLines { print("") } }
}; func clear() { for i in 0...gLines { print("") } }
