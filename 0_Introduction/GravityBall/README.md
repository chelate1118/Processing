# GRAVITY BALL

ballNumber 상수를 정의하였고, Ball 클래스의 배열을 정의하였다. 객체적 특성을 활용하여 모든 Ball의 동작을 for문으로 관리하였다. 자유로운 공의 움직임을 표현하기 위해 Ball의 초기 상태를 random으로 정의하였다.

```java
final int ballNumber = 10;
Ball[] balls = new Ball[ballNumber];

for (int i=0; i<ballNumber; i++) {
    balls[i] = new Ball(i*100 + 100, random(30, 500), random(50, 80));
}

for (Ball ball: balls) {
    ball.display();
    ball.update();
}
```

또한 Ball 클래스에도 이미 구현된 변수 외 여러 속성을 필드로 정의하였다. 자유로운 공의 움직임을 표현하기 위해 x축 속도를 추가하였으며, 색을 나타내는 속성인 rgb값을 부여하였다.

```java
float xSpeed;
float ySpeed;
int r;
int g;
int b;
```

기존에 구현된 코드는 공의 중심을 기준으로 접촉을 판정하기 때문에 어색하다. 따라서 공의 표면을 기준으로 접촉을 판정하도록 코드를 수정하였다. 또한 코드는 공이 바닥에 부딪힐 때마다 0.95배 속도가 감소하는데, 이 때문에 5%의 확률로 공이 바닥에 끼는 오류가 발생할 수 있다. 이 문제를 해결하기 위해 벽에 부딪히는 판정 이후 좌표값을 벽의 위치와 동일하게 하여 벽보다 공이 넘어가는 일이 없도록 하였다.

```java
if (y > height - w/2) { 
    y = height - w/2;
    ySpeed = ySpeed * -0.95;  
} 

if (x < w/2) {
    x = w/2;
    xSpeed = -xSpeed;
}

if (x > width - w/2) {
    x = width - w/2;
    xSpeed = -xSpeed;
}
```
