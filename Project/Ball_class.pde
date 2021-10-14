class Ball {
  PVector position;    // Position of the ball.
  PVector velocity;    // Amount it moves on each redraw.
  float radius;        // Radius of ball.
  color colour;        // Colour of ball.

  float speedScale;

  boolean wonBlue;
  boolean wonRed;

  color colour1;
  color colour2;




  Ball() {
    position = new PVector(width/2, height/2);
    //velocity = new PVector(random(-5, 5), random(-5, 5));
    velocity = new PVector(-3, 3);
    radius = 10;
    colour1 = color (255, 0, 0);
    colour2 = color (0, 0, 255);
    colour   = color(colour1);
    speedScale = 1.05;

    wonBlue = false;
    wonRed = false;
  }


  void draw() {

    // Draw the ball.

    fill(colour);
    circle(position.x, position.y, radius*2);

    if (wonBlue) {
      background(0);
      textSize(40);
      fill(0, 0, 255);
      text("Red lost!", (width/2)-70, height/2);
    } else if (wonRed) {
      background(0);
      textSize(40);
      fill(255, 0, 0);
      text("Red won!", (width/2)-70, height/2);
    }
  }

  void move() {
    // Update the ball position according to the velocity values.
    position.x = position.x + velocity.x;
    position.y = position.y + velocity.y;

    if (position.x - radius < 0 && velocity.x < 0)
    {
      // Escaping to the left, start moving right.
      if (checkCol()) {

        velocity.x = -1*velocity.x*speedScale;

        velocity.y = velocity.y*random(-1, 1)+random(-5, 5);
        colour   = color(random(255), random(255), random(255));
      } else {

        wonBlue = true;
      }
    } else if (position.x + radius > width && velocity.x > 0)
    {


      // Escaping to the right, start moving left.
      if (mode != 1 || checkCol()) {

        velocity.x = -1*velocity.x*speedScale;
        velocity.y = velocity.y*random(-1, 1)+random(-5, 5);
        
        players[0].score += 1;

        colour   = color(random(255), random(255), random(255));
      } else {

        wonRed = true;
      }
    }

    if (position.y - radius < 0 && velocity.y < 0)
    {
      // Escaping upwards, start moving down.
      velocity.y = -1*velocity.y;
    } else if (position.y + radius > height && velocity.y > 0)
    {
      // Escaping downwards, start moving up.
      velocity.y = -1*velocity.y;
    }
  }


  boolean checkCol() {

    return players[0].inRect(position.x, position.y) || players[1].inRect(position.x, position.y);
  }
}
