/*
    对数据库进行读写，
        读数据库，进行数据缓存，
            然后讲取缓存中的数据，写入文件, 并清空缓存。
 
      g++ work.cpp -o work -lpthread
      
      g++ work.cpp -o work -lpthread $(mysql_config --cflags) $(mysql_config --libs)
 */

#include <iostream>  
#include <pthread.h>  
#include <string.h>  
#include <stdio.h>  
#include <unistd.h>
#include <stdlib.h>
#include "/usr/local/mysql/include/mysql.h"
using namespace std;

#define true 1
#define false 0
#define random(x) (rand()%x)    // 随机数

int countRead = 0;          // 读线程
int countWrite = 0;         // 写线程
int singalNum = 0;          // 记录创建的第几个线程                    

// 缓存的信号，读写分离，可以同时读，不可以同时写。
// 可以写的条件是：没有读，没有写。
// 可以读的情况是：没有写。每次读完之后清空缓存。
// 上锁 ＋1，解锁－1， 数字为0的时候，没有上锁。
int readLock = 0;      
int writeLock = 0;


class Thread
{
public:
    pthread_t thread_id;
    virtual void Execute() = 0;
};

class ThreadRead : public Thread
{
public:
    ThreadRead() {
        cout << " ThreadRead " << endl;
    }
    
    static void* thread(void* args);
    void Execute()
    {
        int error;
        error = pthread_create(&thread_id, NULL, thread, NULL);
        if (error == 0) {   // 0就是成功
            cout<<"线程创建成功"<<endl;
            pthread_join(thread_id, NULL);
        }

        cout<< "I'm ThreadRead " << thread_id << endl;
    }
};
void* ThreadRead::thread(void* args)
{
    singalNum++;
    while (true) {
        sleep(random(5) + 1); 
        
        cout << "new thread. read Cache !" << endl;  

        if (countWrite != 0) {      // 读的时候，不能写。
            cout << "-----------don't read, because of write is not zero." << endl;
        }
        else {
            countRead++;
            cout << "---------------" << singalNum << endl
                 << "Read thread runing... countRead = " 
                 << countRead << "  countWrite = " 
                 << countWrite << endl;

            countRead--;
        }  
    }

    return (void *)0; 
}


/*-------------------------------------------*//*-------------------------------------------*/
class ThreadWrite : public Thread
{
public:
    ThreadWrite() {
        cout << " ThreadWrite " << endl;
    }

    static void* thread(void* args);
    void Execute()
    {
        int error;
        error = pthread_create(&thread_id, NULL, thread, NULL);
        if (error == 0) {               // 0就是成功
            cout<<"线程创建成功"<<endl;
            pthread_join(thread_id, NULL);
        }

        cout<< "I'm ThreadWrite"<<endl;
    }
};

void* ThreadWrite::thread(void* args)
{
    singalNum++;

    while (true) {
        sleep(random(5) + 1);

        cout << "write thread...!" << endl;

        if (countRead != 0 && countWrite != 0) {  
            cout << "不能写的，因为有数据写入或者数据读的情况" << endl;
            cout << "-----------don't write, because of write || read is not zero." << endl;
        }
        else {
            countWrite++;

            cout << "---------------" << singalNum << endl
                 << "Write thread runing... countRead = " 
                 << countRead << "  countWrite = " 
                 << countWrite << endl;

            countWrite--;
        }
        
    }

    return (void *)0; 
}

/*-------------------------------------------*//*-------------------------------------------*/
class Factory
{
public:
    virtual Thread *CreateThread() = 0;
};

class FactoryRead : public Factory
{
public:
    Thread *CreateThread() {
        return new ThreadRead();
    }
};

class FactoryWrite : public Factory
{
public:
    Thread *CreateThread() {
        return new ThreadWrite();
    }
};




/*-------------------------------------------*//*-------------------------------------------*/
int main(int argc , char *argv [])
{ 
    int length = 2;    

    Factory *factoryRead1 = new FactoryRead ();
    Factory *factoryRead2 = new FactoryRead ();


    Factory *factoryWrite1 = new FactoryWrite ();
    Factory *factoryWrite2 = new FactoryWrite ();


    Thread *ThreadRead1 = factoryRead1->CreateThread();
    Thread *ThreadWrite1 = factoryWrite1->CreateThread();

    Thread *ThreadRead2 = factoryRead2->CreateThread();
    Thread *ThreadWrite2 = factoryWrite2->CreateThread();


    
    ThreadRead1->Execute();
    ThreadWrite1->Execute();
    ThreadWrite2->Execute();
    ThreadRead2->Execute();


    // while (length--) { 

    //     Thread* ThreadRead[6] = {ThreadRead1, ThreadRead1, ThreadRead2, ThreadRead3, ThreadRead4, ThreadRead5};
    //     Thread* ThreadWrite[6] = {ThreadRead1, ThreadWrite1, ThreadWrite2, ThreadWrite3, ThreadWrite4, ThreadWrite5};


    //     int singal = random(10);

    //     if (singal%2 == 0) {    // 偶数
                                
    //         int start = random(5);
    //         if (start == 0) {
    //             start = 1;
    //         }

    //         for (int i = start; i < 6; i++) {
    //             (ThreadRead[i])->Execute();
    //         }
    //     }
    //     else {

    //         int start = random(5);
    //         if (start == 0) {
    //             start = 1;
    //         }

    //         for (int i = start; i < 6; i++) {
    //             (ThreadWrite[i])->Execute();
    //         }
    //     }   

    // }
    // 
    


    return 0;
}