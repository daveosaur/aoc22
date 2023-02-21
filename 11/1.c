#include <stdio.h>
#include <stdlib.h>


typedef struct monkey{
    int count;
    int items[1000];
    int div;
    struct monkey *target_t;
    struct monkey *target_f;
} monkey;

monkey *make_monkey() {
    monkey *m = calloc(1, sizeof(monkey));
    m->count = 0;
    return m;
}

void insert(monkey *target, int value) {
    target->items[target->count] = value;
    target->count++;
    return;
}

int pop(monkey *target) {
    target->count--;
    int temp = target->items[target->count];
    target->items[target->count] = 0;
    return temp;
}

void send(monkey *target) {
    int to_send = pop(target);

    if(to_send % target->div == 0) {
        insert(target->target_t, to_send);
    } else {
        insert(target->target_f, to_send);
    }
}

void setup(monkey *monkey, int tr, int fal, int[] dat) {

}


int main() {

    monkey *monkeys[8];
    for(int i=0; i<8; i++) {
        monkeys[i] = make_monkey();
    }

    //hardcode shit


    for(int i=0; i<monkeys[0]->count; i++) {
        printf("%d\n", monkeys[0]->items[i]);
    }

    send(monkeys[0]);
    send(monkeys[0]);


    for(int i=0; i<monkeys[2]->count; i++) {
        printf("%d\n", monkeys[2]->items[i]);
    }

    for(int i=0; i<monkeys[7]->count; i++) {
        printf("%d\n", monkeys[7]->items[i]);
    }



    for(int i=0; i<8; i++) {
        free(monkeys[i]);
    }
}

