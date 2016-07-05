dialect "objectdraw"
// A program that produces an animation of the sun rising.
// The animation is driven by clicking the mouse button.
// The faster the mouse is clicked, the faster the sun will rise.
object {
    inherits graphicApplication.size (400, 400)
    // starting position of the sun
    def startSun: Point = -20 @ 370
    // Circle that represents the sun
    def sun: Graphic2D = filledOval.at (startSun) size (150, 150) on (canvas)
    sun.color := yellow
    // instructions for the program
    def instructions: Text = text.at (20 @ 20) with ("Let the sun go up motherfuckers !") on (canvas)
    def startRandomText: Point = -30 @ 100 
    def randomText: Text = text.at (startRandomText) with ("hello") on (canvas)
    // Move the sun up a bit each time the mouse is clicked
    
    def startMyRect: Point = 0 @ 0
    def myRect: Graphic2D = framedRect.at (startMyRect) size (50, 100) on (canvas)
    myRect.color :=color.r (255) g (0) b (0)
    
    method onMouseClick (mousePoint) -> Done {
        sun.moveBy (10, -10)
        myRect.moveBy (10, -10)
        randomText.moveBy (10, 10)
        instructions.visible := false
    }
    // Move the sun back to its starting position and redisplay
    method onMouseExit (mousePoint) -> Done {
        sun.moveTo (startSun)
        myRect.moveTo (startMyRect)
        randomText.moveTo (startRandomText)
        instructions.visible := true
    }
    startGraphics
}