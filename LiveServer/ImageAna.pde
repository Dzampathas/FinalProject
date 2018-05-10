int imageAna(PImage input){
  int value = 0;
  int bucketSize = 40;
  int max = 0;
  int bucket[] = new int[bucketSize];
  input.loadPixels();
  for(int i = 0; i < input.pixels.length; i ++){
    bucket[int(map(hue(input.pixels[i]),0,360,0,bucketSize-1))] ++;
  }
  for(int i = 1; i < bucket.length; i ++){
    if(bucket[i] > max){
      max = bucket[i];
      value = i;
    }
  }
  return int(map(value,0,bucketSize-1,0,360));
}
