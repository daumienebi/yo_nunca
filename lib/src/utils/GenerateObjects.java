package Vista;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

/**
 * @author Derick Daumienebi Sakpa
 * Convert this class to the equivalent in Dart later on
 */
public class GenerateObjects {
    //This class converts questions that are ordered line by line to the Dart map structure
    //and writes the output to an external text file on the desktop
    public static void main(String[] args) {
        File fichero = new File("C:\\Users\\Usuario\\Desktop\\Yo_nunca.txt");
        readFileAndGenerateMap(fichero, 3);
    }  
    
    public static void readFileAndGenerateMap(File fichero,int categoryId){
        File outputFile = new File("C:\\Users\\Usuario\\Desktop\\resultado_categoria_"+categoryId+".txt");
        try(
            BufferedReader br = new BufferedReader(new FileReader(fichero));
            BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile,true))
            
            ){
            String line ;//read line by line
            String lineToWrite = ""; //to write the line in a file
            while((line=br.readLine()) != null){
                String newLine = line.replace(". ", "");
                char lastCharacter = newLine.charAt(newLine.length() - 1);
                if(lastCharacter != '.'){
                    newLine += ".";
                }
                String lineToMap = 
                        "{"+
                           "\n\t\"id\" : 0,\n"
                        + "\t\"categoryId\":" + categoryId + ",\n"
                        + "\t\"description\": "+ "\""+newLine+"\"," +"\n"
                        + "\t\"isFavourite\": 0 \n"
                        +"},";
                lineToWrite += lineToMap + "\n";
                System.out.println(lineToMap);
            }
            bw.write(lineToWrite);

        }catch(Exception e){
           e.printStackTrace();
        }
    }
}
