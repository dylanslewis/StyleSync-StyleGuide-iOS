//
//  TextStyle.swift
//  StyleGuide
//
//  Created by Dylan Lewis on 14/11/2017.
//  Copyright © 2017 Dylan Lewis. All rights reserved.
//

import UIKit

public struct TextStyle {
	let font: UIFont
	let color: UIColor
	let kerning: CGFloat
	let lineHeight: CGFloat
	
	init(
		fontName: String,
		pointSize: CGFloat,
		color: UIColor,
		kerning: CGFloat,
		lineHeight: CGFloat
	) {
		let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize)
		self.font = UIFont(descriptor: fontDescriptor, size: pointSize)
		self.color = color
		self.kerning = kerning
		self.lineHeight = lineHeight
	}
}

extension NSAttributedString {
	private static func attributes(for textStyle: TextStyle) -> [NSAttributedStringKey: Any] {
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.maximumLineHeight = textStyle.lineHeight
		return [
			.font: textStyle.font,
			.foregroundColor: textStyle.color,
			.kern: textStyle.kerning,
			.paragraphStyle: paragraphStyle
		]
	}
	
	public convenience init(string: String, textStyle: TextStyle) {
		let attributes = NSAttributedString.attributes(for: textStyle)
		self.init(string: string, attributes: attributes)
	}
}
