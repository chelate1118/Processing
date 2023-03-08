# Noise 2D

다음과 같은 세 개의 상수를 정의하였다.

```processing
float increment = 0.01;
int frameRateVal = 30;
float frequency = 0.5;
```

increment는 실제 좌표가 noise의 인자로 들어갈 때 변환되는 scale을 의미하고, frameRateVal을 통해 애니메이션을 얼마나 자연스럽게 연출할지 결정하도록 했다.
frequency는 noise함수의 z좌표 인자가 1초에 얼마나 증가하는지를 의미한다.

```processing
float bright = noise(xoff, yoff, frameCount/(float)frameRateVal*frequency)*255;
```

위 코드와 같이 frameRate가 변화하더라도 애니메이션의 재생 속도는 변하지 않도록 설정하였으며, 속도는 오로지 frequency에 의존하게 된다.

```processing
noiseDetail(10,0.65f);
```

noiseDetail 함수의 첫 번째 인자는 얼마나 조밀한 간격으로 noise를 연산할 것인지 결정한다. 만약 이 값이 너무 크다면 연산속도가 느리게 되고, 이 값이 작으면 noise의 계단 현상이 크게 나타날 것이다.

![noise2d](https://user-images.githubusercontent.com/94269897/223732567-cd0551cd-6f0e-4c52-9865-440ecd3e2e6d.gif)

위 결과 화면에서 볼 수 있듯이 noise함수를 활용하면 random으로 pixel을 조정할 때와 달리 조금 더 자연스러운 무작위 음영을 생성해낼 수 있다.
