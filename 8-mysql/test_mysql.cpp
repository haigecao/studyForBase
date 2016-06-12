
#include <pthread.h>  
#include <string.h>  
#include <stdio.h>  
#include <unistd.h>
#include <stdlib.h>
#include "/usr/local/mysql/include/mysql.h"
#include <iostream>
using namespace std;

#define true 1
#define false 0

int mysqlDBA () {
    MYSQL mysql;
    MYSQL_RES *res;
    MYSQL_ROW row;
    char sqlcmd[200];
    mysql_library_init(0, NULL, NULL);          //初始化MYSQL数据库
    mysql_init(&mysql);                         //初始化MYSQL标识符，用于连接
    
    if (!mysql_real_connect(&mysql,"localhost","root","o.g.","hsx",0,NULL,0)) {
        fprintf(stderr, "无法连接到数据库，错误原因是:%s\n", mysql_error(&mysql));
    }
    else {
        sprintf(sqlcmd, "%s", "select * from sc");
        int ren = mysql_real_query(&mysql, sqlcmd, (unsigned int)strlen(sqlcmd));

        if (ren) {
            printf("查询数据库失败%s\n",mysql_error(&mysql));
            return false;
        }
        else {
            res = mysql_store_result(&mysql);           //返回查询的全部结果集
                                                
            while (true) {                              //mysql_fetch_row取结果集的下一行
                row = mysql_fetch_row(res);
                if (row == NULL) {
                    break;
                }
                for (ren = 0; ren < mysql_num_fields(res); ren++){   //结果集的列的数量
                    printf("%s\t",row[ren]);
                }
                printf("\n");
            }

            mysql_free_result(res);     //操作完毕，查询结果集
        }

        mysql_close(&mysql);            //关闭数据库连接
    }
    mysql_library_end();                //关闭MySQL库


    return 0;
}


int main() {
   
   mysqlDBA () ;
    return 0;
}