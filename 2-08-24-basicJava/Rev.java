import java.util.*;

public class Rev{
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int num = sc.nextInt();
        int dup = num;
        int rev=0;
        while(num>0){
            int digit = num %10;
            rev = rev *10+digit;
            num/=10; 
        }
        System.out.println(rev);
    }
}