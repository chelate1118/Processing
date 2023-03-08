그래프를 plot하기 위해 모든 x좌표에 대한 y좌표를 저장할 수 있는 배열을 생성한다.

```processing
float[] heights = new float[width];
```

mouse의 x좌표를 bell curve의 σ와 대응하되, 각 값의 range가 다르므로 아래와 같이 map함수를 사용하여 선형적으로 변환한다.

```processing
float sd = map(mouseX,0,width,0.4,2);
```

bell curve의 formula는 아래와 같은데,

$$ f(x)={1 \over \sigma \sqrt{2 \pi}}e^{-{1 \over 2}({x-\mu \over \sigma})^2} $$

해당 함숫값을 구하도록 `xcoord`, `sq2pi`, `xmsq`, `sdsq`변수를 정의하고 `heights` 변수의 최종 값을 저장한다.

```processing
  for (int i = 0; i < heights.length; i++) {
    float xcoord = map(i,0,width,-3,3);
    float sq2pi = sqrt(2*PI);                   
    float xmsq = -1*(xcoord-m)*(xcoord-m);      
    float sdsq = sd*sd;                         
    heights[i] = (1 / (sd * sq2pi)) * (pow(e, (xmsq/sdsq)));  
  }
```

그래프를 plot할 스타일을 지정하고, 

```processing
stroke(0);
  strokeWeight(2);
  noFill();
```

`beginShape()`와 `endShape()`함수 사이에 `vertex()`함수를 사용하여 그래프의 각 꼭짓점을 정의한다.

```processing
beginShape();
  for (int i = 0; i < heights.length-1; i++) {
    float x = i; 
    float y = map(heights[i], 0, 1, height-2, 2);
    vertex(x, y);
  }
  endShape();
```

실행화면은 아래와 같다.


![bellcurve](https://user-images.githubusercontent.com/94269897/223738963-32d0f7e2-8eca-4443-9169-c9d411bee358.gif)


