//your code here
Particle [] particles;
void setup()
{
	//your code here
	size(1024, 1024);
	particles = new Particle [500];
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
		speed = (Math.random() * 10);
	}
	void move()
	{
		myX = (myX + Math.cos(angle) * speed);
		myY = (myY + Math.sin(angle) * speed);
		if (myX > 1024 || myY > 1024 || myX < 0 || myY < 0)
		{
			myX = 512;
			myY = 512;
		}
	}
	void show()
	{
		fill(myColor);
		stroke(myColor);
		line((float)myX, (float)myY, 512, 512);
		ellipse((float)myX, (float)myY, 10, 10);
	}
}
interface Particle
{
	//your code here
	public void show();
	public void move();
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
		rect(myX, myY, 50, 50);
	}
	void move()
	{
	  	myX = myX + (int) (Math.random() * 10 - 5);
		myY = myY + (int) (Math.random() * 50 - 25);
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

