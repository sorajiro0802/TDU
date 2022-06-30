using System.Collections.Generic;

Stack<int> tStack = new Stack<int>();

tStack.Push(2);
tStack.Push(4);
tStack.Push(6);
tStack.Push(8);

for (int i = 0; i < 4; i++) {
    Console.WriteLine(tStack.Pop());
}