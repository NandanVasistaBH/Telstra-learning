import java.util.*;

public class Fib{
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        // System.out.println(fibo(n));
        long f=1,s=1,i=1;
        while(i<1000){
            i++;
            long sum = f+s;
            System.out.println(sum);
            f=s;
            s=sum;
        }
        return;
        
    }
    private static int fibo(int n){
        if(n<=2) return n;
        return fibo(n-1)+fibo(n-2);
    }
}