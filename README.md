The goal of this project is to create a database for civilian rockets.
Within the framework of the project, it was carried out:  
- Database design and creation  
- Filling in the database of data for further analysis  
- Creating the most frequent database queries  
- Drawing up an ERD to visualize the relationships between tables  
- Creating a remote database connection via Python  

The stack of technologies used: MySQL, Python, Git. 

The database was designed in such a way that there was an effective decomposition of data and the tables were logically complete (separation by entities). To account for the logic of the task in the database, the columns of the tables have special attributes, and triggers have also been created. In order to reduce the query time to tables where there are many objects and to which queries often come, indexes were created

Limitations of the database:  
- the database was created taking into account the fact that it will store single-stage and two-stage civilian rockets 


Total number of tables in the database: 26

Database isolation level: REPEATABLE READ. This is done so that when a transaction is executed, other transactions in the database are ignored until the transaction in question is completed. In fact, a snapshot of the database is created at the beginning of the transaction execution. 

Relationships between tables are created by PRIMARY KEY/FOREIGN KEY on table indexes. 
