import SwiftUI

// The main view for the app
struct ContentView: View {
    
    // State variable to track if the die is currently rolling or not
    // Changes in this variable will trigger a UI update
    @State var isRolling = false
    
    // State variable to hold the number (1 through 6) generated by the dice roll
    @State private var rollNum = 1
    
    // State variable to hold the current rotation angle for the die
    // The die will rotate by this angle whenever we "roll" it
    @State var rotationAngle: Angle = .degrees(360)
    
    // The body of the view, which contains all the UI elements
    var body: some View {
        
        // VStack arranges elements vertically
        VStack {
            
            // Title text
            Text("Roll the die!!!")
                .font(.title)                           // Set the font size to title
                .bold()                                 // Make the text bold
                .padding([.top, .horizontal])           // Add some space around the text
            
            // Adds flexible space between the title and the die
            Spacer()
            
            // A VStack that displays the die image
            VStack {
                
                // Switch statement that changes the die image based on the rollNum value
                switch rollNum {
                case 1:
                    Image(systemName: "die.face.1")  // Show face with 1 dot
                        .resizable()  // Allows the image to be resized
                case 2:
                    Image(systemName: "die.face.2")  // Show face with 2 dots
                        .resizable()
                case 3:
                    Image(systemName: "die.face.3")  // Show face with 3 dots
                        .resizable()
                case 4:
                    Image(systemName: "die.face.4")  // Show face with 4 dots
                        .resizable()
                case 5:
                    Image(systemName: "die.face.5")  // Show face with 5 dots
                        .resizable()
                case 6:
                    Image(systemName: "die.face.6")  // Show face with 6 dots
                        .resizable()
                default:
                    Image(systemName: "questionmark")  // Fallback in case of an error
                        .resizable()
                }
            }
            
            // Style the die image: set the color, size, and apply rotation
            .foregroundStyle(isRolling ? Color.green : Color.red)
            .frame(width: 150, height: 150)
            .rotationEffect(rotationAngle)
            .padding()
            
                // Display the result of the roll below the die
                Text("You rolled a \(rollNum)")
                    .padding(.bottom, 200)  // Add space at the bottom of the text
                    .font(.caption)
            // Button to roll the die
            Button() {} label: {
                Text("Roll")    // Text on the button
                    .padding()
                
                    // Change color based on isRolling state
                    .background(isRolling ? Color.green : Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(.top, 40)
                    
                    // when the button is tapped
                    .onTapGesture {
                        
                        // Animate the changes inside this block
                        withAnimation {
                            
                            // Toggle the isRolling state (switch between true and false)
                            isRolling.toggle()
                            
                            // Increase the rotation angle by 360 degrees each time the button is clicked
                            rotationAngle += .degrees(360)
                            
                            // Call the function to get a random number for the die
                            rollNum = RollDie()
                        }
                    }
            }
            // Add space around the button
            .padding()
        }
    }
    
    // Function to roll the die and return a random number between 1 and 6
    func RollDie() -> Int {
        return Int.random(in: 1...6)  // Randomly select a number between 1 and 6
    }
}

#Preview {
    ContentView()  // Preview the ContentView in Xcode's canvas
}
