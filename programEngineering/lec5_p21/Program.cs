Queue<int> tq = new Queue<int>();

tq.Enqueue(2);
tq.Enqueue(4);
tq.Enqueue(6);
tq.Enqueue(8);

for(int i = 0; i < 4; i++) {
    Console.WriteLine(tq.Dequeue());
}