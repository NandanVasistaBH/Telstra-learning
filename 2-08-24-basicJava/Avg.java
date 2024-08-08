import java.util.*;
public class Avg{
    public static void main(String[] args){
        System.out.println("hello world");
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        while(n-->0){
            System.out.println("enter 3 marks");
            int n1=sc.nextInt();
            int n2=sc.nextInt();
            int n3=sc.nextInt();
            double avg = (n1+n2+n3)/3.0;
            System.out.println(avg);
            if(avg>70) System.out.println("Qualified");
            else System.out.println("nope");

        }

    }
} 