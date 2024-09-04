
#include <bits/stdc++.h>

#define all(x) (x).begin(), (x).end()
#define endl "\n"
#define int long long // consider removing if needed

using namespace std;

/*
 *	author:sammas24
 *  (T_T)
 *
 * */

signed main() {
    ios_base::sync_with_stdio(0);
    cin.tie(NULL);
    int t;
    cin >> t;
    while (t--) {
        int n;
        cin >> n;
        vector<int> v(n);

        for (int &x : v)
            cin >> x;

        int ans = 0;
        for (int i = 0; i < n; i++) {
            if (v[i] & 1)
                ans++;
        }
        cout << ans << endl;
        for (int i = 0; i < n; i++) {
            int x;
            cin >> x;
        }
        for(int i = 0; i<n;i++){
            int x; cin >> x;

            cout << "asd";

        }
    }
}
