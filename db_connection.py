import json
import pymysql
from pymysql import cursors


def json_load(file_name: str) -> dict:
    """json file upload function"""
    with open(file_name, 'r') as file:
        return json.load(file)


data = json_load('config.json')

def mysql_connection(host: str, port: int, user: str, password: str, db_name: str) -> pymysql.connections.Connection:
    """Function for creating a database connection"""
    try:
        connection = pymysql.connect(
            host=host,
            port=port,
            user=user,
            password=password,
            database=db_name,
            cursorclass=pymysql.cursors.DictCursor)
        print('Successfully connected!')
        return connection

    except Exception as ex:
        print('Connection refused')
        print(ex)


db_connection = mysql_connection(host=data['host'],
                                 port=data['port'],
                                 user=data['user'],
                                 password=data['password'],
                                 db_name=data['db_name'])

def database_query(query: str) -> None:
    """The function of sending SELECT queries to the database"""
    try:
        with db_connection.cursor() as cursor:
            cursor.execute(query)
        rows = cursor.fetchall()
        for row in rows:
            print(row)
            
    except Exception as ex:
        print('An error occurred when sending a request to the database')
        print(ex)


db_connection.close()
