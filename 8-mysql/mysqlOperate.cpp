// #include <iostream>
// #include <vector>

// using namespace std;

// int main()
// {
//   // lambda测试
//   cout << [](int m, int n) { return m + n;} (2,4) << endl;

//   //测试的循环要用到的初始化列表和范围
//   vector<int> V({1,2,3});

//   cout << "V =" << endl;
//   for(auto e : V) {
//     cout << e << endl;
//   }

//   return 0;
// }


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "/usr/local/mysql/include/mysql.h"

#define true 1
#define false 0
// static char* server_groups[] = {"embedded", "server", "this_program_server", (char*)NULL};

int main() {

    MYSQL mysql;
    MYSQL_RES *res;
    MYSQL_ROW row;
    char sqlcmd[200];
    int num;
    mysql_library_init(0, NULL, NULL);   //初始化MYSQL数据库
    mysql_init(&mysql);                  //初始化MYSQL标识符，用于连接
                                         
    if (!mysql_real_connect(&mysql, "localhost","root","o.g.","hsx",0,NULL,0)) {
        fprintf(stderr,"无法连接到数据库，错误原因是:%s/n",mysql_error(&mysql));
    }
    else {
        puts("数据库连接成功");
        //首先向数据库中插入一条记录
        // sprintf(sqlcmd,"%s","insert into friends (name,telephone) Values ('xx','xx')");
        // mysql_query(&mysql,sqlcmd);
        sprintf(sqlcmd,"%s","select * from student");
        int t = mysql_real_query(&mysql, sqlcmd, (unsigned int)strlen(sqlcmd));

        if (t) {
            printf("查询数据库失败%s/n", mysql_error(&mysql));
        }
        else {
            res = mysql_store_result(&mysql);                   //返回查询的全部结果集
            
            while (true) {                
                row = mysql_fetch_row(res);
                if (NULL == row) {          //mysql_fetch_row取结果集的下一行
                    break;
                }

                for (num = 0; t < mysql_num_fields(res); num++) {    //结果集的列的数量
                    printf("%s \t",row[num]);
                }
                printf("\n");
            }

            mysql_free_result(res);//操作完毕，查询结果集
        }

        mysql_close(&mysql);//关闭数据库连接

    }

    mysql_library_end();//关闭MySQL库

    return 0;
}

