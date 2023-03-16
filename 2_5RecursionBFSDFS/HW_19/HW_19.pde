int[] startHue = new int[360];
int[][] hue = new int[30000][360];
boolean[] used = new boolean[360];
int cnt = 0;

void setup() {
  frameRate(500);
    size (1000, 1000);
    background(255);

    for (int i=0; i<360; i++) {
        int rand;
        for (rand = (int)random(360); used[rand]; rand = (int)random(360));
        used[rand] = true;
        hue[0][i] = rand;
        startHue[i] = rand;
    }

    mergeSort(startHue, 0, 359);
    
    colorMode(HSB);
    strokeWeight(3);

    drawDisk(0);

    fill(0);
    textSize(20);
    text("Mouse click to merge sort colors", 50, 50);

    noLoop();
}

void draw() {
    background(255);
    fill(0);
    textSize(20);
    text("Mouse click to merge sort colors", 50, 50);
    drawDisk(min(frameCount, cnt));
}

void drawDisk(int x) {
    pushMatrix();
        translate(width*0.5, height*0.5);
        float rad = width*0.9;
        for (int i=0; i<360; i++) {
            rotate(radians(1));
            fill(hue[x][i], 255, 255);
            arc(0, 0, rad, rad, -0.001, radians(1)+0.001);
        }
    popMatrix();
}

void mousePressed() {
    loop();
}

void merge(int array[], int p, int q, int r) {

    int n1 = q - p + 1;
    int n2 = r - q;

    int L[] = new int[n1];
    int M[] = new int[n2];

    for (int i = 0; i < n1; i++)
      L[i] = array[p + i];
    for (int j = 0; j < n2; j++)
      M[j] = array[q + 1 + j];

    int i, j, k;
    i = 0;
    j = 0;
    k = p;

    while (i < n1 && j < n2) {
      if (L[i] <= M[j]) {
        array[k] = L[i];
        i++;
      } else {
        array[k] = M[j];
        j++;
      }
      k++;
      
      cnt++;
      for (int l=0; l<360; l++) {
        hue[cnt][l] = array[l];
      }
    }

    while (i < n1) {
      array[k] = L[i];
      i++;
      k++;
      cnt++;
      for (int l=0; l<360; l++) {
        hue[cnt][l] = array[l];
      }
    }

    while (j < n2) {
      array[k] = M[j];
      j++;
      k++;
      cnt++;
      for (int l=0; l<360; l++) {
        hue[cnt][l] = array[l];
      }
    }
  }

  void mergeSort(int array[], int left, int right) {
    if (left < right) {

      int mid = (left + right) / 2;

      mergeSort(array, left, mid);
      mergeSort(array, mid + 1, right);

      merge(array, left, mid, right);

    }
  }