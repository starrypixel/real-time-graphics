//
//  ViewController.swift
//  mRenderer
//
//  Created by Thy Tran on 11/2/24.
//

import Cocoa
import Foundation
import Metal
import QuartzCore



class ViewController: NSViewController {
    
    var device: MTLDevice!
    var metalLayer: CAMetalLayer!
    var vertexBuffer: MTLBuffer!
    var pipelineState: MTLRenderPipelineState!
    
    let vertexData: [Float] = [
            0.0,  1.0, 0.0,  // Top vertex
           -1.0, -1.0, 0.0,  // Bottom left vertex
            1.0, -1.0, 0.0   // Bottom right vertex
        ]
        var dataSize: Int {
            return vertexData.count * MemoryLayout<Float>.size
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        device = MTLCreateSystemDefaultDevice()

        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .bgra8Unorm
        metalLayer.isOpaque = true
        metalLayer.frame = view.bounds
        view.layer?.addSublayer(metalLayer)
        // Do any additional setup after loading the view.
        
        vertexBuffer = device.makeBuffer(bytes: vertexData, length: dataSize, options: [])
        
        let defaultLibrary = device.makeDefaultLibrary()!
        let vertexFunction = defaultLibrary.makeFunction(name: "basic_vertex")!
        let fragmentFunction = defaultLibrary.makeFunction(name: "basic_fragment")!

        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexFunction
        pipelineStateDescriptor.fragmentFunction = fragmentFunction
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = metalLayer.pixelFormat

        do {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
        } catch let error {
            print("Failed to create pipeline state, error \(error)")
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func render() {
        guard let drawable = metalLayer.nextDrawable() else { return }
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable.texture
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(red: 0.5, green: 0.5, blue: 0.8, alpha: 1.0)

        let commandQueue = device.makeCommandQueue()!
        let commandBuffer = commandQueue.makeCommandBuffer()!
        let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)!
        commandEncoder.setRenderPipelineState(pipelineState)
        commandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        commandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3)
        commandEncoder.endEncoding()

        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        render()
    }

}










