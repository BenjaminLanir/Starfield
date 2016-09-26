//your code here
NormalParticle [] particles;
void setup()
{
	//your code here
	size(1024, 1024);
	particles = new NormalParticle [100];
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
class NormalParticle
{
	//your code here
	int myX, myY, myColor;
	double angle, speed;
	NormalParticle()
	{
		myX = (int) (Math.random() * 1024);
		myY = (int) (Math.random() * 1024);
		myColor = color((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
		angle = Math.random() * 2 * Math.PI;
		speed = Math.random() * 10;
	}
	void move()
	{
		myX = ((int) (myX + Math.cos(angle) * speed));
		myY = ((int) (myY + Math.sin(angle) * speed));
	}
	void show()
	{
		fill(myColor);
		ellipse(myX, myY, 10, 10);
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

