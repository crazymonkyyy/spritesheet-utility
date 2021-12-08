import raylib;
import std;

enum windowx=800;
enum windowy=600;
string exe(string input){
	auto config=Config.stderrPassThrough;
	return input.executeShell(null,config).output[0..$-1];
}
void main(){
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	import tile;
	mixin setupdraw!("tile");
	import ship;
	mixin setupdraw!("ship");
	SetTargetFPS(60);
	int i,j;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			drawtile(i,10,10,5);
			drawship(j,100,100,3);
			//DrawText("Hello, World!", 10,10, 20, Colors.WHITE);
			//DrawFPS(10,10);
		EndDrawing();
		if(IsKeyPressed(KeyboardKey.KEY_ONE)){
			j="./shipselector".exe.to!int;
		}
		if(IsKeyPressed(KeyboardKey.KEY_TWO)){
			i="./tileselector".exe.to!int;
		}
	}
	CloseWindow();
}