import java.util.ArrayList;
import java.util.List;

class Solution {

    List<String> ans = new ArrayList<>();
    public List<String> generateParenthesis(int n) {
        func(n, n, "");
        return ans;
    }
    void func(int u, int v,String str){
        if(u==0&&v==0){
            ans.add(str);
            return;
        }
        if(u<v){
            if(u>0) func(u-1, v, str+"(");
            if(v>0) func(u, v-1, str+")");
        }
        else{
            func(u-1, v, str+"(");
        }
    }
}