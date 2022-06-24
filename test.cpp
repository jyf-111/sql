#include <iostream>
#include <mysql.h>
using namespace std;

int main(){
    system("chcp 65001");
    MYSQL* mysql = mysql_init(NULL);
    if(!mysql) cout << "init fail" << endl;

    mysql = mysql_real_connect(mysql,"localhost","root","7788","test",0,NULL,0);
    if(!mysql) cout << "connect fail" << endl;
    else cout << "success" << endl;

    string query1 = "insert into student values('2022','蒋雨峰','男')";
    string query = "select * from student";

    int flag = mysql_real_query(mysql,query.c_str(),query.size());
    if(flag) {
        cout << "query fail" << endl;
        cout << mysql_error(mysql) << endl;
    }
    else cout << "[" << query << "]...made" << endl;

    MYSQL_RES* res = mysql_store_result(mysql);
    MYSQL_ROW row;
    while(row = mysql_fetch_row(res)){
        for(int i=0;i<(int)mysql_num_fields(res);i++){
            cout << row[i] << " ";
        }
        cout << endl;
    }

    mysql_close(mysql);
    return 0;
}