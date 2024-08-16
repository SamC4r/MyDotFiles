#include <GLFW/glfw3.h>
#include<bits/stdc++.h>

#define all(x) (x).begin(), (x).end()
#define endl "\n"
#define int long long //consider removing if needed

using namespace std;

/*
 *	author:sammas24
 *  (T_T)
 *  this is to remove 
 *
 * */

int manin(){
	glfwInit();
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	GLFWwindow* window = glfwCreateWindow(800, 600, "una ventana o", NULL, NULL);
	if(window == nullptr){
		//mensaje pedorro de error
		return -1;
	}
}

signed main(){
    ios_base::sync_with_stdio(0);
    cin.tie(NULL);	
	int openGl; cin >> openGl;	
	vector<int> a = {1,2,3,4,5};

	openGl = 20;
}

