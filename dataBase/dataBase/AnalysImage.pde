PImage I;
class AnalysImage{
    // field
    String imageName;
    // 画像全体の平均，標準偏差
    float holeAve = 0; double holeSD = 0;
    // 9区分の平均，標準偏差
    double[] ave = new double[9];
    double[] SD = new double[9];
    int[] widPoint = new int[]{0, 27, 54, 80};
    int[] heiPoint = new int[]{0, 20, 40, 60};
    double[][] AC = new double[9][4];
    int[][][] RGB = new int[80][60][3];
    int[][] L = new int[80][60];

    // constructor
    AnalysImage(String imageName){
        this.imageName = imageName;
        I = loadImage(this.imageName);
        I.resize(80, 60);

        // culculate all RGB & Brightness scores
        for(int y = 0; y < I.height; y++){
            for(int x = 0; x < I.width; x++){
                this.RGB[x][y][0] = (int)red(I.get(x, y)); 
                this.RGB[x][y][1] = (int)green(I.get(x, y)); 
                this.RGB[x][y][2] = (int)blue(I.get(x, y));
                for(int z = 0; z < 3; z++){
                    this.L[x][y] += this.RGB[x][y][z]; // 1ピクセル中のRGBを合計
                }
                this.L[x][y] = this.L[x][y]/3;
                holeAve += L[x][y];
                holeSD += (double)pow(L[x][y], 2);
            }
        }
        holeAve = holeAve / I.width / I.height;
        holeSD = (double)sqrt((float)holeSD / (I.width*I.height) - pow(holeAve, 2));
    }
    void Print(){
        String[] ACSets = new String[]{"Hor", "Verti", "RU", "RD"};
        String[] sections = new String[]{"","s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9"};
        String[] image = split(this.imageName, ".");
        
        for(int i = 0; i < 10; i++){print(sections[i]);if(i<9){print("\t");}}
        println();
        for(int s = 0; s < 4; s++){
            print(ACSets[s]);
            for(int i = 0; i < 9; i++){
                print("\t");
                print(String.format("%.3f  ", AC[i][s]));
            }
            println();
        }
    }
    // save AC to csv file
    void Save(){
        String[] ACSets = new String[]{"Horizon", "Vertical", "RightUp", "RightDown"};
        String[] sections = new String[]{"","s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9"};
        PrintWriter file;
        String[] image = split(this.imageName, ".");
        file = createWriter("ACResult/" + image[0] + ".csv");
        for(int i = 0; i < 10; i++){file.print(sections[i]);if(i<9){file.print(",");}}
        file.println();
        for(int s = 0; s < 4; s++){
            file.print(ACSets[s]);
            for(int i = 0; i < 9; i++){
                file.print(",");
                file.print(String.format("%.3f  ", AC[i][s]));
            }
            file.println();
        }
        file.flush();
        file.close();
    }

    // main method
    void AutoCorrelation(){
        ExportAveSD();
        int cnt = 0;
        for(int y = 0; y < heiPoint.length-1; y++){
            for(int x = 0; x < widPoint.length-1; x++){
                AC[cnt][0] = this.Horizon(cnt, widPoint[x], heiPoint[y], widPoint[x+1], heiPoint[y+1]);
                AC[cnt][1] = this.Vertical(cnt, widPoint[x], heiPoint[y], widPoint[x+1], heiPoint[y+1]);
                AC[cnt][2] = this.RightUp(cnt, widPoint[x], heiPoint[y], widPoint[x+1], heiPoint[y+1]);
                AC[cnt][3] = this.RightDown(cnt, widPoint[x], heiPoint[y], widPoint[x+1], heiPoint[y+1]);
                cnt += 1;
            }
        }
    }

    // culculate horizontal -> dx:-1, dy:0
    double Horizon(int s, int x1, int y1, int x2, int y2){
        double AC = 0;
        int xWidth=x2-x1; int yHeight=y2-y1;
        for (int y = y1; y < y2; y++) {
            for (int x = x1+1; x < x2; x++) {
                AC += (double)((L[x][y]-this.ave[s]) * (L[x-1][y]-this.ave[s]));
            }
        }
        AC = AC/(xWidth-1)/yHeight/this.SD[s]/this.SD[s];
        return AC;
    }

    // culculate right up -> dx:-1, dy:1
    double RightUp(int s, int x1, int y1, int x2, int y2){
        double AC = 0;
        int xWidth=x2-x1; int yHeight=y2-y1;
        for (int y = y1; y < y2-1; y++) {
            for (int x = x1+1; x < x2; x++) {
                AC += (double)((L[x][y]-this.ave[s]) * (L[x-1][y+1]-this.ave[s]));
            }
        }
        AC = AC/(xWidth-1)/(yHeight-1)/this.SD[s]/this.SD[s];
        return AC;
    }

    // culculate right down -> dx:1, dy:1
    double RightDown(int s, int x1, int y1, int x2, int y2){
        double AC = 0;
        int xWidth=x2-x1; int yHeight=y2-y1;
        for (int y = y1; y < y2-1; y++) {
            for (int x = x1; x < x2-1; x++) {
                AC += (double)((L[x][y]-this.ave[s]) * (L[x+1][y+1]-this.ave[s]));
            }
        }
        AC = AC/(xWidth-1)/(yHeight-1)/this.SD[s]/this.SD[s];
        return AC;
    }

    // culculate vertical -> dx:0, dy:1
    double Vertical(int s, int x1, int y1, int x2, int y2){
        double AC = 0;
        int xWidth=x2-x1; int yHeight=y2-y1;
        for (int y = y1; y < y2-1; y++) {
            for (int x = x1; x < x2; x++) {
                AC += (double)((L[x][y]-this.ave[s]) * (L[x][y+1]-this.ave[s]));
            }
        }
        AC = AC/xWidth/(yHeight-1)/this.SD[s]/this.SD[s];
        return AC;
    }

    void ExportAveSD(){
        int cnt = 0;
        String[] res = new String[2];
        for(int y = 0; y < heiPoint.length-1; y++){
            for(int x = 0; x < widPoint.length-1; x++){
                res = split(this.CulcAveSD(widPoint[x], heiPoint[y], widPoint[x+1], heiPoint[y+1]), ":");
                ave[cnt] = parseFloat(res[0]);
                SD[cnt] = parseFloat(res[1]);
                cnt += 1;
            }
        }
    }

    String CulcAveSD(int x1, int y1, int x2, int y2){
        float ave=0; double SD=0;
        int xWidth=x2-x1; int yHeight=y2-y1;
        int[][][] RGB = new int[x2][y2][3];
        int[][] L = new int[x2][y2];
        for(int y = y1; y < y2; y++){
            for(int x = x1; x < x2; x++){
                RGB[x][y][0] = (int)red(I.get(x, y)); 
                RGB[x][y][1] = (int)green(I.get(x, y)); 
                RGB[x][y][2] = (int)blue(I.get(x, y));
                for(int z = 0; z < 3; z++){
                    L[x][y] += RGB[x][y][z]; // 1ピクセル中のRGBを合計
                }
                L[x][y] = L[x][y]/3;
                ave += L[x][y];
                SD += (double)pow(L[x][y], 2);
            }
        }
        ave = ave/xWidth/yHeight;
        SD = (double)sqrt((float)SD/xWidth/yHeight - pow(ave,2));
        return(String)(ave+":"+SD);
    }

    void Show(){
        image(I, 0,0);
    }
}
