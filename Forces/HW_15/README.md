상수를 아래와 같이 정의하였다.

```processing
final float theta = 0.3;
final float c = 0.1;
final float mu = 0.1;
```

각도에 따른 중력은 수직항력을 상쇄한 결과로 정하였고, 따라서 크기는 `0.3*sin(theta)`이고 각도가 `theta`인 벡터로 힘을 지정하였다.

```processing
PVector gravity = new PVector(-0.3*sin(theta)*cos(theta),0.3*sin(theta)*sin(theta));
gravity.mult(mybox.m);
```

마찰력은 마찰계수에 수직항력을 곱한 값으로, 수직항력이 `0.3*cos(theta)`이므로 마찰력의 크기는 `mu*0.3*cos(theta)`, 각도는 `theta`가 된다.

```processing
PVector friction = new PVector(-mu*-0.3*cos(theta),-mu*0.3*sin(theta));
friction.mult(mybox.m);
```
