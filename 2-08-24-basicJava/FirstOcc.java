import java.util.*;

public class FirstOcc{
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }
        System.out.println("enter element");
        int elem = sc.nextInt();
        for(int i=0;i<n;i++){
            if(arr[i]==elem) {
                System.out.println("elem occ at index "+i);
                return;
            }
        }
        System.out.println("didnt occ");
    }
}