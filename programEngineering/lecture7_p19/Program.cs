namespace human {
    class human {
        static void Main() {
            HumanAge ha = new HumanAge();
            Console.WriteLine(ha.SetAge(-3));
        }
    }
    class HumanAge {
        private int age;

        public Boolean SetAge(int age) {
            Boolean res;

            if (age < 0) {
                res = false;
            }
            else {
                this.age = age;
                res = true;
            }
            return res;
        }
    }
}
