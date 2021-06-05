import Foundation

final class FillWithColor {
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        if image.count == 0 || row < 0 || column < 0 || row >= image.count {
            return image
        }
        if  column >= image[0].count {
            return image
        }
        let originalColor = image[row][column]
        var newImage = image
        var queue = [Point]()
        queue.append(Point(row: row, column: column))
        newImage[row][column] = newColor
        while queue.count != 0 {
            let currentPoint = queue.remove(at: 0)
            if let left = currentPoint.left(), newImage[left.row][left.column] == originalColor {
                newImage[left.row][left.column] = newColor
                queue.append(left)
            }
            if let right = currentPoint.right(max: image[0].count), newImage[right.row][right.column] == originalColor {
                newImage[right.row][right.column] = newColor
                queue.append(right)
            }
            if let up = currentPoint.up(), newImage[up.row][up.column] == originalColor {
                newImage[up.row][up.column] = newColor
                queue.append(up)
            }
            if let down = currentPoint.down(max: image.count), newImage[down.row][down.column] == originalColor {
                newImage[down.row][down.column] = newColor
                queue.append(down)
            }
        }
        
        return newImage
    }
}


struct Point {
    let row: Int
    let column: Int
    
    func left() -> Point?{
        if column == 0 {
            return nil
        }
        else
        {
            return Point(row: row, column: column-1)
        }
    }
    
    func right(max: Int) -> Point? {
        if column == max - 1 {
            return nil
        }
        else
        {
            return Point(row: row, column: column+1)
        }
    }
    
    func up() -> Point? {
        if row == 0 {
            return nil
        }
        else
        {
            return Point(row: row - 1, column: column)
        }
    }
    
    func down(max: Int) -> Point? {
        if row == max - 1 {
            return nil
        }
        else
        {
            return Point(row: row+1, column: column)
        }
    }
}
