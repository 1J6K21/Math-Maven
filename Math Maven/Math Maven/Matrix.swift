//
//  Matrix.swift
//  rest
//
//  Created by kalsky_953982 on 2/18/25.
//

import SwiftUI
import CoreML


extension [CGPoint]{
    func containsAny(other: [CGPoint]) -> Bool{
        for element in other{
            if self.contains(where: {$0 == element}){
                return true
            }
        }
        return false
        
    }
}

func drawLine(context: GraphicsContext, line: Line, color: Color = .black){
    
    var path = Path()
    path.move(to: line.points[0])
    
    for point in line.points{
        path.addLine(to: point)
    }
    //        path.closeSubpath()
    //dont want to close it to start
    
    context.stroke(path, with: .color(color), style: StrokeStyle(lineWidth: 4))
    
    
}

func getNumber(line: Line, canvasSize: Int, sample: Bool) async -> ((Int64, Double), (Int64, Double)){
    
    var bestTwo: ((Int64, Double), (Int64, Double)) = ((0,0),(0,0))
    
    do{
        let config = MLModelConfiguration()
        let resourceURL = URLResource(name: "DigitClassifierV7") as URL
//        let resourceURL = Bundle.module.url(forResource: "Resources2/DigitClassifierV7", withExtension: "mlmodelc")!
        let model = try DigitClassifierV7(contentsOf: resourceURL, configuration: config)
        let matrix = await getMatrix(line: line, canvasSize: CGFloat(canvasSize), collectData: sample)
        let predictions = try model.predictions(inputs: [DigitClassifierV7Input(_1x1: Int64(matrix[0][0]),_1x2: Int64(matrix[0][1]),_1x3: Int64(matrix[0][2]),_1x4: Int64(matrix[0][3]),_1x5: Int64(matrix[0][4]),_1x6: Int64(matrix[0][5]),_1x7: Int64(matrix[0][6]),_1x8: Int64(matrix[0][7]),_1x9: Int64(matrix[0][8]),_1x10: Int64(matrix[0][9]),_1x11: Int64(matrix[0][10]),_1x12: Int64(matrix[0][11]),_1x13: Int64(matrix[0][12]),_1x14: Int64(matrix[0][13]),_1x15: Int64(matrix[0][14]),_1x16: Int64(matrix[0][15]),_1x17: Int64(matrix[0][16]),_1x18: Int64(matrix[0][17]),_1x19: Int64(matrix[0][18]),_1x20: Int64(matrix[0][19]),_1x21: Int64(matrix[0][20]),_1x22: Int64(matrix[0][21]),_1x23: Int64(matrix[0][22]),_1x24: Int64(matrix[0][23]),_1x25: Int64(matrix[0][24]),_1x26: Int64(matrix[0][25]),_1x27: Int64(matrix[0][26]),_1x28: Int64(matrix[0][27]),_2x1: Int64(matrix[1][0]),_2x2: Int64(matrix[1][1]),_2x3: Int64(matrix[1][2]),_2x4: Int64(matrix[1][3]),_2x5: Int64(matrix[1][4]),_2x6: Int64(matrix[1][5]),_2x7: Int64(matrix[1][6]),_2x8: Int64(matrix[1][7]),_2x9: Int64(matrix[1][8]),_2x10: Int64(matrix[1][9]),_2x11: Int64(matrix[1][10]),_2x12: Int64(matrix[1][11]),_2x13: Int64(matrix[1][12]),_2x14: Int64(matrix[1][13]),_2x15: Int64(matrix[1][14]),_2x16: Int64(matrix[1][15]),_2x17: Int64(matrix[1][16]),_2x18: Int64(matrix[1][17]),_2x19: Int64(matrix[1][18]),_2x20: Int64(matrix[1][19]),_2x21: Int64(matrix[1][20]),_2x22: Int64(matrix[1][21]),_2x23: Int64(matrix[1][22]),_2x24: Int64(matrix[1][23]),_2x25: Int64(matrix[1][24]),_2x26: Int64(matrix[1][25]),_2x27: Int64(matrix[1][26]),_2x28: Int64(matrix[1][27]),_3x1: Int64(matrix[2][0]),_3x2: Int64(matrix[2][1]),_3x3: Int64(matrix[2][2]),_3x4: Int64(matrix[2][3]),_3x5: Int64(matrix[2][4]),_3x6: Int64(matrix[2][5]),_3x7: Int64(matrix[2][6]),_3x8: Int64(matrix[2][7]),_3x9: Int64(matrix[2][8]),_3x10: Int64(matrix[2][9]),_3x11: Int64(matrix[2][10]),_3x12: Int64(matrix[2][11]),_3x13: Int64(matrix[2][12]),_3x14: Int64(matrix[2][13]),_3x15: Int64(matrix[2][14]),_3x16: Int64(matrix[2][15]),_3x17: Int64(matrix[2][16]),_3x18: Int64(matrix[2][17]),_3x19: Int64(matrix[2][18]),_3x20: Int64(matrix[2][19]),_3x21: Int64(matrix[2][20]),_3x22: Int64(matrix[2][21]),_3x23: Int64(matrix[2][22]),_3x24: Int64(matrix[2][23]),_3x25: Int64(matrix[2][24]),_3x26: Int64(matrix[2][25]),_3x27: Int64(matrix[2][26]),_3x28: Int64(matrix[2][27]),_4x1: Int64(matrix[3][0]),_4x2: Int64(matrix[3][1]),_4x3: Int64(matrix[3][2]),_4x4: Int64(matrix[3][3]),_4x5: Int64(matrix[3][4]),_4x6: Int64(matrix[3][5]),_4x7: Int64(matrix[3][6]),_4x8: Int64(matrix[3][7]),_4x9: Int64(matrix[3][8]),_4x10: Int64(matrix[3][9]),_4x11: Int64(matrix[3][10]),_4x12: Int64(matrix[3][11]),_4x13: Int64(matrix[3][12]),_4x14: Int64(matrix[3][13]),_4x15: Int64(matrix[3][14]),_4x16: Int64(matrix[3][15]),_4x17: Int64(matrix[3][16]),_4x18: Int64(matrix[3][17]),_4x19: Int64(matrix[3][18]),_4x20: Int64(matrix[3][19]),_4x21: Int64(matrix[3][20]),_4x22: Int64(matrix[3][21]),_4x23: Int64(matrix[3][22]),_4x24: Int64(matrix[3][23]),_4x25: Int64(matrix[3][24]),_4x26: Int64(matrix[3][25]),_4x27: Int64(matrix[3][26]),_4x28: Int64(matrix[3][27]),_5x1: Int64(matrix[4][0]),_5x2: Int64(matrix[4][1]),_5x3: Int64(matrix[4][2]),_5x4: Int64(matrix[4][3]),_5x5: Int64(matrix[4][4]),_5x6: Int64(matrix[4][5]),_5x7: Int64(matrix[4][6]),_5x8: Int64(matrix[4][7]),_5x9: Int64(matrix[4][8]),_5x10: Int64(matrix[4][9]),_5x11: Int64(matrix[4][10]),_5x12: Int64(matrix[4][11]),_5x13: Int64(matrix[4][12]),_5x14: Int64(matrix[4][13]),_5x15: Int64(matrix[4][14]),_5x16: Int64(matrix[4][15]),_5x17: Int64(matrix[4][16]),_5x18: Int64(matrix[4][17]),_5x19: Int64(matrix[4][18]),_5x20: Int64(matrix[4][19]),_5x21: Int64(matrix[4][20]),_5x22: Int64(matrix[4][21]),_5x23: Int64(matrix[4][22]),_5x24: Int64(matrix[4][23]),_5x25: Int64(matrix[4][24]),_5x26: Int64(matrix[4][25]),_5x27: Int64(matrix[4][26]),_5x28: Int64(matrix[4][27]),_6x1: Int64(matrix[5][0]),_6x2: Int64(matrix[5][1]),_6x3: Int64(matrix[5][2]),_6x4: Int64(matrix[5][3]),_6x5: Int64(matrix[5][4]),_6x6: Int64(matrix[5][5]),_6x7: Int64(matrix[5][6]),_6x8: Int64(matrix[5][7]),_6x9: Int64(matrix[5][8]),_6x10: Int64(matrix[5][9]),_6x11: Int64(matrix[5][10]),_6x12: Int64(matrix[5][11]),_6x13: Int64(matrix[5][12]),_6x14: Int64(matrix[5][13]),_6x15: Int64(matrix[5][14]),_6x16: Int64(matrix[5][15]),_6x17: Int64(matrix[5][16]),_6x18: Int64(matrix[5][17]),_6x19: Int64(matrix[5][18]),_6x20: Int64(matrix[5][19]),_6x21: Int64(matrix[5][20]),_6x22: Int64(matrix[5][21]),_6x23: Int64(matrix[5][22]),_6x24: Int64(matrix[5][23]),_6x25: Int64(matrix[5][24]),_6x26: Int64(matrix[5][25]),_6x27: Int64(matrix[5][26]),_6x28: Int64(matrix[5][27]),_7x1: Int64(matrix[6][0]),_7x2: Int64(matrix[6][1]),_7x3: Int64(matrix[6][2]),_7x4: Int64(matrix[6][3]),_7x5: Int64(matrix[6][4]),_7x6: Int64(matrix[6][5]),_7x7: Int64(matrix[6][6]),_7x8: Int64(matrix[6][7]),_7x9: Int64(matrix[6][8]),_7x10: Int64(matrix[6][9]),_7x11: Int64(matrix[6][10]),_7x12: Int64(matrix[6][11]),_7x13: Int64(matrix[6][12]),_7x14: Int64(matrix[6][13]),_7x15: Int64(matrix[6][14]),_7x16: Int64(matrix[6][15]),_7x17: Int64(matrix[6][16]),_7x18: Int64(matrix[6][17]),_7x19: Int64(matrix[6][18]),_7x20: Int64(matrix[6][19]),_7x21: Int64(matrix[6][20]),_7x22: Int64(matrix[6][21]),_7x23: Int64(matrix[6][22]),_7x24: Int64(matrix[6][23]),_7x25: Int64(matrix[6][24]),_7x26: Int64(matrix[6][25]),_7x27: Int64(matrix[6][26]),_7x28: Int64(matrix[6][27]),_8x1: Int64(matrix[7][0]),_8x2: Int64(matrix[7][1]),_8x3: Int64(matrix[7][2]),_8x4: Int64(matrix[7][3]),_8x5: Int64(matrix[7][4]),_8x6: Int64(matrix[7][5]),_8x7: Int64(matrix[7][6]),_8x8: Int64(matrix[7][7]),_8x9: Int64(matrix[7][8]),_8x10: Int64(matrix[7][9]),_8x11: Int64(matrix[7][10]),_8x12: Int64(matrix[7][11]),_8x13: Int64(matrix[7][12]),_8x14: Int64(matrix[7][13]),_8x15: Int64(matrix[7][14]),_8x16: Int64(matrix[7][15]),_8x17: Int64(matrix[7][16]),_8x18: Int64(matrix[7][17]),_8x19: Int64(matrix[7][18]),_8x20: Int64(matrix[7][19]),_8x21: Int64(matrix[7][20]),_8x22: Int64(matrix[7][21]),_8x23: Int64(matrix[7][22]),_8x24: Int64(matrix[7][23]),_8x25: Int64(matrix[7][24]),_8x26: Int64(matrix[7][25]),_8x27: Int64(matrix[7][26]),_8x28: Int64(matrix[7][27]),_9x1: Int64(matrix[8][0]),_9x2: Int64(matrix[8][1]),_9x3: Int64(matrix[8][2]),_9x4: Int64(matrix[8][3]),_9x5: Int64(matrix[8][4]),_9x6: Int64(matrix[8][5]),_9x7: Int64(matrix[8][6]),_9x8: Int64(matrix[8][7]),_9x9: Int64(matrix[8][8]),_9x10: Int64(matrix[8][9]),_9x11: Int64(matrix[8][10]),_9x12: Int64(matrix[8][11]),_9x13: Int64(matrix[8][12]),_9x14: Int64(matrix[8][13]),_9x15: Int64(matrix[8][14]),_9x16: Int64(matrix[8][15]),_9x17: Int64(matrix[8][16]),_9x18: Int64(matrix[8][17]),_9x19: Int64(matrix[8][18]),_9x20: Int64(matrix[8][19]),_9x21: Int64(matrix[8][20]),_9x22: Int64(matrix[8][21]),_9x23: Int64(matrix[8][22]),_9x24: Int64(matrix[8][23]),_9x25: Int64(matrix[8][24]),_9x26: Int64(matrix[8][25]),_9x27: Int64(matrix[8][26]),_9x28: Int64(matrix[8][27]),_10x1: Int64(matrix[9][0]),_10x2: Int64(matrix[9][1]),_10x3: Int64(matrix[9][2]),_10x4: Int64(matrix[9][3]),_10x5: Int64(matrix[9][4]),_10x6: Int64(matrix[9][5]),_10x7: Int64(matrix[9][6]),_10x8: Int64(matrix[9][7]),_10x9: Int64(matrix[9][8]),_10x10: Int64(matrix[9][9]),_10x11: Int64(matrix[9][10]),_10x12: Int64(matrix[9][11]),_10x13: Int64(matrix[9][12]),_10x14: Int64(matrix[9][13]),_10x15: Int64(matrix[9][14]),_10x16: Int64(matrix[9][15]),_10x17: Int64(matrix[9][16]),_10x18: Int64(matrix[9][17]),_10x19: Int64(matrix[9][18]),_10x20: Int64(matrix[9][19]),_10x21: Int64(matrix[9][20]),_10x22: Int64(matrix[9][21]),_10x23: Int64(matrix[9][22]),_10x24: Int64(matrix[9][23]),_10x25: Int64(matrix[9][24]),_10x26: Int64(matrix[9][25]),_10x27: Int64(matrix[9][26]),_10x28: Int64(matrix[9][27]),_11x1: Int64(matrix[10][0]),_11x2: Int64(matrix[10][1]),_11x3: Int64(matrix[10][2]),_11x4: Int64(matrix[10][3]),_11x5: Int64(matrix[10][4]),_11x6: Int64(matrix[10][5]),_11x7: Int64(matrix[10][6]),_11x8: Int64(matrix[10][7]),_11x9: Int64(matrix[10][8]),_11x10: Int64(matrix[10][9]),_11x11: Int64(matrix[10][10]),_11x12: Int64(matrix[10][11]),_11x13: Int64(matrix[10][12]),_11x14: Int64(matrix[10][13]),_11x15: Int64(matrix[10][14]),_11x16: Int64(matrix[10][15]),_11x17: Int64(matrix[10][16]),_11x18: Int64(matrix[10][17]),_11x19: Int64(matrix[10][18]),_11x20: Int64(matrix[10][19]),_11x21: Int64(matrix[10][20]),_11x22: Int64(matrix[10][21]),_11x23: Int64(matrix[10][22]),_11x24: Int64(matrix[10][23]),_11x25: Int64(matrix[10][24]),_11x26: Int64(matrix[10][25]),_11x27: Int64(matrix[10][26]),_11x28: Int64(matrix[10][27]),_12x1: Int64(matrix[11][0]),_12x2: Int64(matrix[11][1]),_12x3: Int64(matrix[11][2]),_12x4: Int64(matrix[11][3]),_12x5: Int64(matrix[11][4]),_12x6: Int64(matrix[11][5]),_12x7: Int64(matrix[11][6]),_12x8: Int64(matrix[11][7]),_12x9: Int64(matrix[11][8]),_12x10: Int64(matrix[11][9]),_12x11: Int64(matrix[11][10]),_12x12: Int64(matrix[11][11]),_12x13: Int64(matrix[11][12]),_12x14: Int64(matrix[11][13]),_12x15: Int64(matrix[11][14]),_12x16: Int64(matrix[11][15]),_12x17: Int64(matrix[11][16]),_12x18: Int64(matrix[11][17]),_12x19: Int64(matrix[11][18]),_12x20: Int64(matrix[11][19]),_12x21: Int64(matrix[11][20]),_12x22: Int64(matrix[11][21]),_12x23: Int64(matrix[11][22]),_12x24: Int64(matrix[11][23]),_12x25: Int64(matrix[11][24]),_12x26: Int64(matrix[11][25]),_12x27: Int64(matrix[11][26]),_12x28: Int64(matrix[11][27]),_13x1: Int64(matrix[12][0]),_13x2: Int64(matrix[12][1]),_13x3: Int64(matrix[12][2]),_13x4: Int64(matrix[12][3]),_13x5: Int64(matrix[12][4]),_13x6: Int64(matrix[12][5]),_13x7: Int64(matrix[12][6]),_13x8: Int64(matrix[12][7]),_13x9: Int64(matrix[12][8]),_13x10: Int64(matrix[12][9]),_13x11: Int64(matrix[12][10]),_13x12: Int64(matrix[12][11]),_13x13: Int64(matrix[12][12]),_13x14: Int64(matrix[12][13]),_13x15: Int64(matrix[12][14]),_13x16: Int64(matrix[12][15]),_13x17: Int64(matrix[12][16]),_13x18: Int64(matrix[12][17]),_13x19: Int64(matrix[12][18]),_13x20: Int64(matrix[12][19]),_13x21: Int64(matrix[12][20]),_13x22: Int64(matrix[12][21]),_13x23: Int64(matrix[12][22]),_13x24: Int64(matrix[12][23]),_13x25: Int64(matrix[12][24]),_13x26: Int64(matrix[12][25]),_13x27: Int64(matrix[12][26]),_13x28: Int64(matrix[12][27]),_14x1: Int64(matrix[13][0]),_14x2: Int64(matrix[13][1]),_14x3: Int64(matrix[13][2]),_14x4: Int64(matrix[13][3]),_14x5: Int64(matrix[13][4]),_14x6: Int64(matrix[13][5]),_14x7: Int64(matrix[13][6]),_14x8: Int64(matrix[13][7]),_14x9: Int64(matrix[13][8]),_14x10: Int64(matrix[13][9]),_14x11: Int64(matrix[13][10]),_14x12: Int64(matrix[13][11]),_14x13: Int64(matrix[13][12]),_14x14: Int64(matrix[13][13]),_14x15: Int64(matrix[13][14]),_14x16: Int64(matrix[13][15]),_14x17: Int64(matrix[13][16]),_14x18: Int64(matrix[13][17]),_14x19: Int64(matrix[13][18]),_14x20: Int64(matrix[13][19]),_14x21: Int64(matrix[13][20]),_14x22: Int64(matrix[13][21]),_14x23: Int64(matrix[13][22]),_14x24: Int64(matrix[13][23]),_14x25: Int64(matrix[13][24]),_14x26: Int64(matrix[13][25]),_14x27: Int64(matrix[13][26]),_14x28: Int64(matrix[13][27]),_15x1: Int64(matrix[14][0]),_15x2: Int64(matrix[14][1]),_15x3: Int64(matrix[14][2]),_15x4: Int64(matrix[14][3]),_15x5: Int64(matrix[14][4]),_15x6: Int64(matrix[14][5]),_15x7: Int64(matrix[14][6]),_15x8: Int64(matrix[14][7]),_15x9: Int64(matrix[14][8]),_15x10: Int64(matrix[14][9]),_15x11: Int64(matrix[14][10]),_15x12: Int64(matrix[14][11]),_15x13: Int64(matrix[14][12]),_15x14: Int64(matrix[14][13]),_15x15: Int64(matrix[14][14]),_15x16: Int64(matrix[14][15]),_15x17: Int64(matrix[14][16]),_15x18: Int64(matrix[14][17]),_15x19: Int64(matrix[14][18]),_15x20: Int64(matrix[14][19]),_15x21: Int64(matrix[14][20]),_15x22: Int64(matrix[14][21]),_15x23: Int64(matrix[14][22]),_15x24: Int64(matrix[14][23]),_15x25: Int64(matrix[14][24]),_15x26: Int64(matrix[14][25]),_15x27: Int64(matrix[14][26]),_15x28: Int64(matrix[14][27]),_16x1: Int64(matrix[15][0]),_16x2: Int64(matrix[15][1]),_16x3: Int64(matrix[15][2]),_16x4: Int64(matrix[15][3]),_16x5: Int64(matrix[15][4]),_16x6: Int64(matrix[15][5]),_16x7: Int64(matrix[15][6]),_16x8: Int64(matrix[15][7]),_16x9: Int64(matrix[15][8]),_16x10: Int64(matrix[15][9]),_16x11: Int64(matrix[15][10]),_16x12: Int64(matrix[15][11]),_16x13: Int64(matrix[15][12]),_16x14: Int64(matrix[15][13]),_16x15: Int64(matrix[15][14]),_16x16: Int64(matrix[15][15]),_16x17: Int64(matrix[15][16]),_16x18: Int64(matrix[15][17]),_16x19: Int64(matrix[15][18]),_16x20: Int64(matrix[15][19]),_16x21: Int64(matrix[15][20]),_16x22: Int64(matrix[15][21]),_16x23: Int64(matrix[15][22]),_16x24: Int64(matrix[15][23]),_16x25: Int64(matrix[15][24]),_16x26: Int64(matrix[15][25]),_16x27: Int64(matrix[15][26]),_16x28: Int64(matrix[15][27]),_17x1: Int64(matrix[16][0]),_17x2: Int64(matrix[16][1]),_17x3: Int64(matrix[16][2]),_17x4: Int64(matrix[16][3]),_17x5: Int64(matrix[16][4]),_17x6: Int64(matrix[16][5]),_17x7: Int64(matrix[16][6]),_17x8: Int64(matrix[16][7]),_17x9: Int64(matrix[16][8]),_17x10: Int64(matrix[16][9]),_17x11: Int64(matrix[16][10]),_17x12: Int64(matrix[16][11]),_17x13: Int64(matrix[16][12]),_17x14: Int64(matrix[16][13]),_17x15: Int64(matrix[16][14]),_17x16: Int64(matrix[16][15]),_17x17: Int64(matrix[16][16]),_17x18: Int64(matrix[16][17]),_17x19: Int64(matrix[16][18]),_17x20: Int64(matrix[16][19]),_17x21: Int64(matrix[16][20]),_17x22: Int64(matrix[16][21]),_17x23: Int64(matrix[16][22]),_17x24: Int64(matrix[16][23]),_17x25: Int64(matrix[16][24]),_17x26: Int64(matrix[16][25]),_17x27: Int64(matrix[16][26]),_17x28: Int64(matrix[16][27]),_18x1: Int64(matrix[17][0]),_18x2: Int64(matrix[17][1]),_18x3: Int64(matrix[17][2]),_18x4: Int64(matrix[17][3]),_18x5: Int64(matrix[17][4]),_18x6: Int64(matrix[17][5]),_18x7: Int64(matrix[17][6]),_18x8: Int64(matrix[17][7]),_18x9: Int64(matrix[17][8]),_18x10: Int64(matrix[17][9]),_18x11: Int64(matrix[17][10]),_18x12: Int64(matrix[17][11]),_18x13: Int64(matrix[17][12]),_18x14: Int64(matrix[17][13]),_18x15: Int64(matrix[17][14]),_18x16: Int64(matrix[17][15]),_18x17: Int64(matrix[17][16]),_18x18: Int64(matrix[17][17]),_18x19: Int64(matrix[17][18]),_18x20: Int64(matrix[17][19]),_18x21: Int64(matrix[17][20]),_18x22: Int64(matrix[17][21]),_18x23: Int64(matrix[17][22]),_18x24: Int64(matrix[17][23]),_18x25: Int64(matrix[17][24]),_18x26: Int64(matrix[17][25]),_18x27: Int64(matrix[17][26]),_18x28: Int64(matrix[17][27]),_19x1: Int64(matrix[18][0]),_19x2: Int64(matrix[18][1]),_19x3: Int64(matrix[18][2]),_19x4: Int64(matrix[18][3]),_19x5: Int64(matrix[18][4]),_19x6: Int64(matrix[18][5]),_19x7: Int64(matrix[18][6]),_19x8: Int64(matrix[18][7]),_19x9: Int64(matrix[18][8]),_19x10: Int64(matrix[18][9]),_19x11: Int64(matrix[18][10]),_19x12: Int64(matrix[18][11]),_19x13: Int64(matrix[18][12]),_19x14: Int64(matrix[18][13]),_19x15: Int64(matrix[18][14]),_19x16: Int64(matrix[18][15]),_19x17: Int64(matrix[18][16]),_19x18: Int64(matrix[18][17]),_19x19: Int64(matrix[18][18]),_19x20: Int64(matrix[18][19]),_19x21: Int64(matrix[18][20]),_19x22: Int64(matrix[18][21]),_19x23: Int64(matrix[18][22]),_19x24: Int64(matrix[18][23]),_19x25: Int64(matrix[18][24]),_19x26: Int64(matrix[18][25]),_19x27: Int64(matrix[18][26]),_19x28: Int64(matrix[18][27]),_20x1: Int64(matrix[19][0]),_20x2: Int64(matrix[19][1]),_20x3: Int64(matrix[19][2]),_20x4: Int64(matrix[19][3]),_20x5: Int64(matrix[19][4]),_20x6: Int64(matrix[19][5]),_20x7: Int64(matrix[19][6]),_20x8: Int64(matrix[19][7]),_20x9: Int64(matrix[19][8]),_20x10: Int64(matrix[19][9]),_20x11: Int64(matrix[19][10]),_20x12: Int64(matrix[19][11]),_20x13: Int64(matrix[19][12]),_20x14: Int64(matrix[19][13]),_20x15: Int64(matrix[19][14]),_20x16: Int64(matrix[19][15]),_20x17: Int64(matrix[19][16]),_20x18: Int64(matrix[19][17]),_20x19: Int64(matrix[19][18]),_20x20: Int64(matrix[19][19]),_20x21: Int64(matrix[19][20]),_20x22: Int64(matrix[19][21]),_20x23: Int64(matrix[19][22]),_20x24: Int64(matrix[19][23]),_20x25: Int64(matrix[19][24]),_20x26: Int64(matrix[19][25]),_20x27: Int64(matrix[19][26]),_20x28: Int64(matrix[19][27]),_21x1: Int64(matrix[20][0]),_21x2: Int64(matrix[20][1]),_21x3: Int64(matrix[20][2]),_21x4: Int64(matrix[20][3]),_21x5: Int64(matrix[20][4]),_21x6: Int64(matrix[20][5]),_21x7: Int64(matrix[20][6]),_21x8: Int64(matrix[20][7]),_21x9: Int64(matrix[20][8]),_21x10: Int64(matrix[20][9]),_21x11: Int64(matrix[20][10]),_21x12: Int64(matrix[20][11]),_21x13: Int64(matrix[20][12]),_21x14: Int64(matrix[20][13]),_21x15: Int64(matrix[20][14]),_21x16: Int64(matrix[20][15]),_21x17: Int64(matrix[20][16]),_21x18: Int64(matrix[20][17]),_21x19: Int64(matrix[20][18]),_21x20: Int64(matrix[20][19]),_21x21: Int64(matrix[20][20]),_21x22: Int64(matrix[20][21]),_21x23: Int64(matrix[20][22]),_21x24: Int64(matrix[20][23]),_21x25: Int64(matrix[20][24]),_21x26: Int64(matrix[20][25]),_21x27: Int64(matrix[20][26]),_21x28: Int64(matrix[20][27]),_22x1: Int64(matrix[21][0]),_22x2: Int64(matrix[21][1]),_22x3: Int64(matrix[21][2]),_22x4: Int64(matrix[21][3]),_22x5: Int64(matrix[21][4]),_22x6: Int64(matrix[21][5]),_22x7: Int64(matrix[21][6]),_22x8: Int64(matrix[21][7]),_22x9: Int64(matrix[21][8]),_22x10: Int64(matrix[21][9]),_22x11: Int64(matrix[21][10]),_22x12: Int64(matrix[21][11]),_22x13: Int64(matrix[21][12]),_22x14: Int64(matrix[21][13]),_22x15: Int64(matrix[21][14]),_22x16: Int64(matrix[21][15]),_22x17: Int64(matrix[21][16]),_22x18: Int64(matrix[21][17]),_22x19: Int64(matrix[21][18]),_22x20: Int64(matrix[21][19]),_22x21: Int64(matrix[21][20]),_22x22: Int64(matrix[21][21]),_22x23: Int64(matrix[21][22]),_22x24: Int64(matrix[21][23]),_22x25: Int64(matrix[21][24]),_22x26: Int64(matrix[21][25]),_22x27: Int64(matrix[21][26]),_22x28: Int64(matrix[21][27]),_23x1: Int64(matrix[22][0]),_23x2: Int64(matrix[22][1]),_23x3: Int64(matrix[22][2]),_23x4: Int64(matrix[22][3]),_23x5: Int64(matrix[22][4]),_23x6: Int64(matrix[22][5]),_23x7: Int64(matrix[22][6]),_23x8: Int64(matrix[22][7]),_23x9: Int64(matrix[22][8]),_23x10: Int64(matrix[22][9]),_23x11: Int64(matrix[22][10]),_23x12: Int64(matrix[22][11]),_23x13: Int64(matrix[22][12]),_23x14: Int64(matrix[22][13]),_23x15: Int64(matrix[22][14]),_23x16: Int64(matrix[22][15]),_23x17: Int64(matrix[22][16]),_23x18: Int64(matrix[22][17]),_23x19: Int64(matrix[22][18]),_23x20: Int64(matrix[22][19]),_23x21: Int64(matrix[22][20]),_23x22: Int64(matrix[22][21]),_23x23: Int64(matrix[22][22]),_23x24: Int64(matrix[22][23]),_23x25: Int64(matrix[22][24]),_23x26: Int64(matrix[22][25]),_23x27: Int64(matrix[22][26]),_23x28: Int64(matrix[22][27]),_24x1: Int64(matrix[23][0]),_24x2: Int64(matrix[23][1]),_24x3: Int64(matrix[23][2]),_24x4: Int64(matrix[23][3]),_24x5: Int64(matrix[23][4]),_24x6: Int64(matrix[23][5]),_24x7: Int64(matrix[23][6]),_24x8: Int64(matrix[23][7]),_24x9: Int64(matrix[23][8]),_24x10: Int64(matrix[23][9]),_24x11: Int64(matrix[23][10]),_24x12: Int64(matrix[23][11]),_24x13: Int64(matrix[23][12]),_24x14: Int64(matrix[23][13]),_24x15: Int64(matrix[23][14]),_24x16: Int64(matrix[23][15]),_24x17: Int64(matrix[23][16]),_24x18: Int64(matrix[23][17]),_24x19: Int64(matrix[23][18]),_24x20: Int64(matrix[23][19]),_24x21: Int64(matrix[23][20]),_24x22: Int64(matrix[23][21]),_24x23: Int64(matrix[23][22]),_24x24: Int64(matrix[23][23]),_24x25: Int64(matrix[23][24]),_24x26: Int64(matrix[23][25]),_24x27: Int64(matrix[23][26]),_24x28: Int64(matrix[23][27]),_25x1: Int64(matrix[24][0]),_25x2: Int64(matrix[24][1]),_25x3: Int64(matrix[24][2]),_25x4: Int64(matrix[24][3]),_25x5: Int64(matrix[24][4]),_25x6: Int64(matrix[24][5]),_25x7: Int64(matrix[24][6]),_25x8: Int64(matrix[24][7]),_25x9: Int64(matrix[24][8]),_25x10: Int64(matrix[24][9]),_25x11: Int64(matrix[24][10]),_25x12: Int64(matrix[24][11]),_25x13: Int64(matrix[24][12]),_25x14: Int64(matrix[24][13]),_25x15: Int64(matrix[24][14]),_25x16: Int64(matrix[24][15]),_25x17: Int64(matrix[24][16]),_25x18: Int64(matrix[24][17]),_25x19: Int64(matrix[24][18]),_25x20: Int64(matrix[24][19]),_25x21: Int64(matrix[24][20]),_25x22: Int64(matrix[24][21]),_25x23: Int64(matrix[24][22]),_25x24: Int64(matrix[24][23]),_25x25: Int64(matrix[24][24]),_25x26: Int64(matrix[24][25]),_25x27: Int64(matrix[24][26]),_25x28: Int64(matrix[24][27]),_26x1: Int64(matrix[25][0]),_26x2: Int64(matrix[25][1]),_26x3: Int64(matrix[25][2]),_26x4: Int64(matrix[25][3]),_26x5: Int64(matrix[25][4]),_26x6: Int64(matrix[25][5]),_26x7: Int64(matrix[25][6]),_26x8: Int64(matrix[25][7]),_26x9: Int64(matrix[25][8]),_26x10: Int64(matrix[25][9]),_26x11: Int64(matrix[25][10]),_26x12: Int64(matrix[25][11]),_26x13: Int64(matrix[25][12]),_26x14: Int64(matrix[25][13]),_26x15: Int64(matrix[25][14]),_26x16: Int64(matrix[25][15]),_26x17: Int64(matrix[25][16]),_26x18: Int64(matrix[25][17]),_26x19: Int64(matrix[25][18]),_26x20: Int64(matrix[25][19]),_26x21: Int64(matrix[25][20]),_26x22: Int64(matrix[25][21]),_26x23: Int64(matrix[25][22]),_26x24: Int64(matrix[25][23]),_26x25: Int64(matrix[25][24]),_26x26: Int64(matrix[25][25]),_26x27: Int64(matrix[25][26]),_26x28: Int64(matrix[25][27]),_27x1: Int64(matrix[26][0]),_27x2: Int64(matrix[26][1]),_27x3: Int64(matrix[26][2]),_27x4: Int64(matrix[26][3]),_27x5: Int64(matrix[26][4]),_27x6: Int64(matrix[26][5]),_27x7: Int64(matrix[26][6]),_27x8: Int64(matrix[26][7]),_27x9: Int64(matrix[26][8]),_27x10: Int64(matrix[26][9]),_27x11: Int64(matrix[26][10]),_27x12: Int64(matrix[26][11]),_27x13: Int64(matrix[26][12]),_27x14: Int64(matrix[26][13]),_27x15: Int64(matrix[26][14]),_27x16: Int64(matrix[26][15]),_27x17: Int64(matrix[26][16]),_27x18: Int64(matrix[26][17]),_27x19: Int64(matrix[26][18]),_27x20: Int64(matrix[26][19]),_27x21: Int64(matrix[26][20]),_27x22: Int64(matrix[26][21]),_27x23: Int64(matrix[26][22]),_27x24: Int64(matrix[26][23]),_27x25: Int64(matrix[26][24]),_27x26: Int64(matrix[26][25]),_27x27: Int64(matrix[26][26]),_27x28: Int64(matrix[26][27]),_28x1: Int64(matrix[27][0]),_28x2: Int64(matrix[27][1]),_28x3: Int64(matrix[27][2]),_28x4: Int64(matrix[27][3]),_28x5: Int64(matrix[27][4]),_28x6: Int64(matrix[27][5]),_28x7: Int64(matrix[27][6]),_28x8: Int64(matrix[27][7]),_28x9: Int64(matrix[27][8]),_28x10: Int64(matrix[27][9]),_28x11: Int64(matrix[27][10]),_28x12: Int64(matrix[27][11]),_28x13: Int64(matrix[27][12]),_28x14: Int64(matrix[27][13]),_28x15: Int64(matrix[27][14]),_28x16: Int64(matrix[27][15]),_28x17: Int64(matrix[27][16]),_28x18: Int64(matrix[27][17]),_28x19: Int64(matrix[27][18]),_28x20: Int64(matrix[27][19]),_28x21: Int64(matrix[27][20]),_28x22: Int64(matrix[27][21]),_28x23: Int64(matrix[27][22]),_28x24: Int64(matrix[27][23]),_28x25: Int64(matrix[27][24]),_28x26: Int64(matrix[27][25]),_28x27: Int64(matrix[27][26]),_28x28: Int64(matrix[27][27]))])
        
        print("description: \t" + predictions.description)
        
        predictions.compactMap { output in
            let max = output.labelProbability.max { $0.value < $1.value }
            var without = output.labelProbability
            without.removeValue(forKey: max!.key)
            let secondMax = without.max { $0.value < $1.value }
            bestTwo = ((max!.0, max!.1), (secondMax!.0, secondMax!.1))
        }
        
       
                               
    }catch{
        print(error.localizedDescription)
        return bestTwo
    }
    
    return bestTwo
}


//Get the 2D matrix of a line's x and y
func getMatrix(line: Line, canvasSize: CGFloat, collectData: Bool = false) async -> [[Int]] {
    
    let matrixSize = 28
    let reductionFactor = CGFloat(matrixSize-1)/canvasSize
    var Matrix: [[Int]] = []
    var xSumFloat = CGFloat(0)
    var ySumFloat = CGFloat(0)
    var xMin = Int(canvasSize)+1 //some number out of range
    var xMax = -1
    var yMin:Int = Int(canvasSize)+1 //some number out of range
    var yMax = -1
    
    for _ in 1...matrixSize {
        Matrix.append(Array(repeating: 0, count: matrixSize))
    }
    
    
    
    for var point in line.points{
        point = checkAndClipBounds(point: point, canvasSize: canvasSize)
        let i = reflectAndRotatePoint(point: point, canvasSize: canvasSize)
        let x = (Int)(i.x * reductionFactor)
        let y = (Int)(i.y * reductionFactor)
        xSumFloat += i.x; ySumFloat += i.y
        
        yMin = min(yMin, y)
        yMax = max(yMax, y)
        xMin = min(xMin, x)
        xMax = max(xMax, x)
        
        Matrix[x][y] = 255
        
        
    }
    
    
    
    //print matrix
    for i in 0...27{
        for j in 0...27{
            print(Matrix[i][j], terminator: " ")
        }
        print()
    }
    print()
    
    
    let xOffsetFloat = (canvasSize/CGFloat(2) - xSumFloat/CGFloat(line.points.count))*reductionFactor
    let yOffsetFloat = (canvasSize/CGFloat(2) - ySumFloat/CGFloat(line.points.count))*reductionFactor
    let xOffset = Int(xOffsetFloat)
    let yOffset = Int(yOffsetFloat)
    let width = max(1, xMax - xMin)
    let height = max(1, yMax - yMin)
    let xDiff = ((matrixSize-1)/2) - (xMin + width/2)
    let yDiff = ((matrixSize-1)/2) - (yMin + height/2)
    
    //Center and Resize
    var resizeFactor = Int(min(26/width, 26/height) / 2)
    resizeFactor = max(resizeFactor, 1)
    //new matrix to not read an overlap from the write of new pixels
    var centeredMatrix: [[Int]] = []
    
    for _ in 1...matrixSize {
        centeredMatrix.append(Array(repeating: 0, count: matrixSize))
    }
    
    // left of expected center to right of expected center
    for ix in ((matrixSize-1)/2 - width/2) ... ((matrixSize-1)/2 + width/2) {
        
        //top of expected center to bottom of expected center
        for iy in ((matrixSize-1)/2 - height/2) ... ((matrixSize-1)/2 + height/2){
            
            
            let xOff = ix - matrixSize/2
            let yOff = iy - matrixSize/2
            let newX = xOff*resizeFactor + 14
            let newY = yOff*resizeFactor + 14
            
            centeredMatrix[newX][newY] = Matrix[ix-xDiff][iy-yDiff]
            
            
            
            
        }
        
    }
    let uncenteredMatrix = Matrix
    Matrix = centeredMatrix
    
    
    
    //print matrix
    for i in 0...27{
        for j in 0...27{
            print(Matrix[i][j], terminator: " ")
        }
        print()
    }
    
    print(Matrix.description.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: ""))
    
    if collectData{
        @AppStorage("lastTestingLabel") var testingLabel = 0
        writeToFile(label: Int64(testingLabel), Matrix: Matrix, fileName: "Sampling Data")
        writeToFile(label: Int64(testingLabel), Matrix: uncenteredMatrix, fileName: "Sampling Data Uncentered")
    }
    return Matrix
    
}


//Drawn Line Object Properties
public struct Line {
    
    //coordinates on the drawing canvas
    var points: [CGPoint]
}

func reflectAndRotatePoint(point: CGPoint, canvasSize: CGFloat)->CGPoint{
    let x = point.x
    let y = point.y
    let center = CGPoint(x: canvasSize/2, y: canvasSize/2)
    
    //reflect
    var yNew = canvasSize - y
    
    //rotation matrix
    // [[cosø, -sinø], * [[x,
    //  [sinø, cosø]]      y]]
    
    //rotate about any point:
    //x' = x_p + (x-x_p)cosø - (y-y_p)sinø
    //y' = y_p - (x-x_p)sinø + (y-y_p)cosø
    
    //-90 degrees about origin:
//    let angle = -Double.pi / 2
//    xNew = yNew
//    yNew = -xNew
    
    //-90 degrees about center
//    xNew = canvasSize/2 + (yNew - canvasSize/2)
//    yNew = canvasSize/2 - (xNew - canvasSize/2)
    
    //+90 degrees about center
    let xNew = center.x - (yNew - center.y)
    yNew = center.y + (x - (center.x))
    
    
    return CGPoint(x: xNew, y: yNew)
}

//point set to max/min bound if it escapes it
func checkAndClipBounds(point: CGPoint, canvasSize: CGFloat) -> CGPoint{
    var x: Double = point.x
    var y: Double = point.y
    if(y > canvasSize){
        y = canvasSize
    }
    else if(y < 0){
        y = 0
    }
    if(x > canvasSize){
        x = canvasSize
    }
    else if(x < 0){
        x = 0
    }
    
    return CGPoint(x: x, y: y)
}



