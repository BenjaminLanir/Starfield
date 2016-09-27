//your code here
NormalParticle [] particles;
void setup()
{
	//your code here
	size(1024, 1024);
	particles = new NormalParticle [500];
	for (int i = 0; i < particles.length; i++)
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
	}
	void show()
	{
		fill(myColor);
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
	OdballParticle()
	{
		myX = 512;
		myY = 512;
		myColor = color(255, 0, 127);
	}
	void show()
	{
		fill(myColor);
		rect(myX, myY, 10, 10);
	}
	void move()
	{
		myX = myX + (int) (Math.random() * 10 - 5);
		myY = myY + (int) (Math.random() * 50 - 25);
	}
}
class JumboParticle //uses inheritance
{
	//your code here
}

