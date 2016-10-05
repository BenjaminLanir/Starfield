//your code here
Particle [] particles;
boolean forward = false;
Player1 player;
void setup()
{
	//your code here
	size(1024, 1024);
	player = new Player1();
	particles = new Particle [1000];
	particles [0] = new OddballParticle();
	particles [1] = new JumboParticle();
	for (int i = 2; i < particles.length; i++)
	{
		particles [i] = new NormalParticle();
	}
}
void draw()
{
	//your code here
	background(0);
	for (int j = 0; j < particles.length; j++)
	{
		particles[j].show();
		particles[j].move();
	}
	player.move();
	player.show();
}
class NormalParticle implements Particle
{
	//your code here
	double myX, myY;
	int myColor;
	double angle, speed;
	NormalParticle()
	{
		myX = 512;//(int) (Math.random() * 1024);
		myY = 512;//(int) (Math.random() * 1024);
		myColor = color((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
		angle = (Math.random() * 2 * Math.PI);
		speed = (int) (Math.random() * 10);
	}
	void move()
	{
		myX = (myX + Math.cos(angle) * speed);
		myY = (myY + Math.sin(angle) * speed);
		if (myX > 1024 || myY > 1024 || myX < 0 || myY < 0)
		{
			myX = mouseX;
			myY = mouseY;
			angle = Math.abs(180 - angle);
		}
	}
	void show()
	{
		fill(myColor);
		stroke(myColor);
		//line((float)myX, (float)myY, 512, 512);
		ellipse((float)myX, (float)myY, 10, 10);
		//ellipse((float)myX, (float)myY, (int) (Math.sqrt(mouseX * mouseX + myX * myX)), (int) (Math.sqrt(mouseY * mouseY + myY * myY)));
	}
}
interface Particle
{
	//your code here
	public void show();
	public void move();
}
class Player1
{
	float myX, myY, angle, speed;
	boolean alive;
	Player1()
	{
		myX = 50;
		myY = 50;
		angle = 0;
		alive = true;
		speed = 0;
	}
	void move()
	{
		if (forward == true)
		{
			if (speed == 10)
			{
				myX = (float)(myX + Math.cos(angle) * speed);
				myY = (float)(myY + Math.sin(angle) * speed);
			}
			else
			{
					speed = speed + 0.25;
					myX = (float)(myX + Math.cos(angle) * speed);
					myY = (float)(myY + Math.sin(angle) * speed);
			}
		}
		/*else if
		{
			if (speed = -10)
			{
				myX = (myX + Math.cos(angle) * speed);
				myY = (myY + Math.sin(angle) * speed);
			}
			else
			{
				for (int j = 0; j < 200; j++)
				{
					speed = speed - 0.025;
					myX = (myX + Math.cos(angle) * speed);
					myY = (myY + Math.sin(angle) * speed);
				}
			}
		}*/
	}
	void show()
	{
		fill (0, 255, 0);
		rect(myX, myY, 10, 10);
		triangle(myX, myY, myX + 10, myY + 10, myX - 10, myY - 20);
	}
}
class OddballParticle implements Particle //uses an interface
{
	//your code here
	int myX, myY, myColor;
	OddballParticle()
	{
		myX = 512;
	    myY = 512;
		myColor = color(255, 0, 127);
	}
	void show()
	{
		fill(myColor);
		stroke(myColor);
		//rect(myX, myY, 50, 50);
		ellipse((float)myX, (float)myY, 10, 10);
	}
	void move()
	{
	  	myX = myX + (int) (Math.sqrt(mouseX * mouseX + myX * myX));//(int) (Math.random() * 10 - 5);
		myY = myY + (int) (Math.sqrt(mouseY * mouseY + myY * myY));//(int) (Math.random() * 50 - 25);
		//myY = Math.sqrt(200 - Math.sq(myX));
	}
}
class JumboParticle extends NormalParticle//uses inheritance
{
	void show()
	{
		fill(255);
		ellipse((float) myX, (float) myY, 50, 50);
	}
	//your code here
}
void mousePressed()
{
	forward = true;
}
void mouseReleased() 
{
forward = false;
player.speed = 0;	
}