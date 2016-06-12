/*
 线程测试函数
    测试开启线程的方法。
 */

#include <iostream>  
#include <pthread.h>  
#include <string.h>  
#include <stdio.h>  
#include <unistd.h>
using namespace std;  

#define true 1
#define false 0
#define random(x) (rand()%x)    // 随机数

int countRead = 0;          // 读线程
int countWrite = 0;         // 写线程
int singalNum = 0;          // 记录创建的第几个线程 
                            
  
void printIds(const char * str)  
{  
    pid_t pid;  
    pthread_t tid;  
    pid = getpid();  
    tid = pthread_self();  
    cout << str << " " << "pid: " << pid << ", tid:" << tid << endl;
}  
  
void * readData1(void * arg)   
{  
    cout << "new thread: " << endl;  
    while (true)   
    {  
        if (countWrite > 0) {
            sleep(1);
            cout << endl;
            continue;
        }

        countRead++;
        sleep(2); 

        cout << "111" << endl;
        countRead--;
    }  
    return (void *)0;  
}  

  
void * readData2(void * arg)   
{  
    cout << "new thread: " << endl;  
    while (true)   
    {  
        if (countWrite > 0) {
            sleep(1);
            cout << endl;

            continue;
        }

        countRead++;
        sleep(2); 

        cout << "222" << endl;
        countRead--;
    }  
    return (void *)0;  
} 

void * writeData1(void * arg)   
{  
    cout << "new thread: " << endl;  
    while (true)   
    {  
        if (countWrite > 0 || countRead > 0) {
            sleep(1);
            cout << endl;

            continue;
        }

        countWrite++;
        sleep(3); 
        cout << "333" << endl;
        countWrite--;
    }  
    return (void *)0;  
}  

void * writeData2(void * arg)   
{  
    cout << "new thread: " << endl;  
    while (true)   
    {  
        if (countWrite > 0 || countRead > 0) {
            sleep(1);
            cout << endl;
            continue;
        }

        countWrite++;
        sleep(3); 
        cout << "444" << endl;
        countWrite--;
    }  
    return (void *)0;  
}    

int main()  
{  
    pthread_t ntid;  
    int err;  
    err = pthread_create(&ntid, NULL, readData1, NULL);  
    if (err != 0) {  
        cout << strerror(err) << endl;  
    } 
    err = pthread_create(&ntid, NULL, writeData1, NULL);  
    if (err != 0) {  
        cout << strerror(err) << endl;  
    } 

    err = pthread_create(&ntid, NULL, readData2, NULL);  
    if (err != 0) {  
        cout << strerror(err) << endl;  
    } 
    err = pthread_create(&ntid, NULL, writeData2, NULL);  
    if (err != 0) {  
        cout << strerror(err) << endl;  
    } 

    printIds("main thread runing.");   

    while (true) {  
        sleep(2);  
        // printIds("main thread runing.");  ?
        cout << "---" << endl;

    }  
    
    return 0;  
}  
