void setup() {
  size(80, 60);
  AnalysImage[] imageList = new AnalysImage[31];
  int n = 31;
  for (int i = 0; i < n; i++) {
    imageList[i] = new AnalysImage("sample"+int(1+i)+".JPG");
    imageList[i].AutoCorrelation();
  }
  for (int i = 0; i < n; i++) {
    imageList[i].Save();
  }

}
