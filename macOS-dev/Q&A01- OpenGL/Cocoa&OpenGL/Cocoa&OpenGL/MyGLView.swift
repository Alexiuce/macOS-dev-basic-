//
//  MyGLView.swift
//  Cocoa&OpenGL
//
//  Created by Alexcai on 2018/5/6.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

import GLUT

fileprivate let LightTag: Int = 0
fileprivate let ThetaTag: Int = 1
fileprivate let RadiusTag: Int = 2

class MyGLView: NSOpenGLView {

    @IBOutlet var sliderMatrix: NSMatrix!
    
    fileprivate var lightX: CGFloat = 0
    fileprivate var theta: CGFloat = 0
    fileprivate var radius: CGFloat = 0
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
//        prepare()
    }
    
    
    
    @IBAction fileprivate func changeParameter(slider: NSMatrix){
        
        
    }
}


extension MyGLView{
    fileprivate func prepare(){
        openGLContext?.makeCurrentContext()
        guard let ctx =  openGLContext?.cglContextObj else { return  }
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
