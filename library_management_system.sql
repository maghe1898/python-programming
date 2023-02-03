import mysql.connector
con=mysql.connector.connect(host="localhost", user="root", password="Mages@18",autocommit=True)
c=con.cursor(buffered=True)
c.execute("create database if not already exists library_db")
c.execute("use library_db")
c.execute("create table if not exists book(b_id varchar(5) primary key,b_name varchar(50),author varchar(50),isbn varchar(10),publisher varchar(50), available varchar(5) defauly'yes')")
c.execute("create table if not exists issue_details(b_id varchar(5), member_id varchar(10), member_name varchar(50) Not null, foreign key(b_id) refrences book(b_id))")


def create_book():
    bid=input("Enter Book ID:")
    name=input("Enter Book Name:")
    author=input("Author Name:")
    isbn=input("ISBN:")
    publisher=input("Publisher:")
    data=(bid,title,author,isbn,publisher)
    sql='insert into books(b_id,b_name,author,isbn,publisher) values(%s,%s,%s,%s,%s)'
    c.execute(sql,data)
    print("Data entered successfully for book id",bid)
    
    
def delete_book():
    bid=input("Enter Book ID:")
    c.execute("delete from books where b_id=%s",(bid,))
    display_books()
    
def issue_book():
    m_name=input("Enter your Name:")
    m_id=input("Enter reg no:")
    book=input("Enter Book Name:")
    c.execute("select b_id from books where b_name='"+book+"'and available='YES'")
    book_id=c.fetchone()
    bid=book_id[0]
    print(bid)
    a="insert into issue_details values(%s,%s,%s)"
    data=(bid,s_id,s_name)
    c.execute(a,data)
    c.execute("update books set available='no' where b_id='"+bid+"'") 
    print(book,"book issued to", m_name)
    
def return_book():
    name=input("Enter your Name:")
    bid=input("Enter Book ID:")
    c.execute("update books set available='yes' where b_id='"+bid+"'")
    c.execute("delete from issue_details where b_id=%s",(bid,))
    print("book id",bid,"book returned by", name)
    
    
def display_books():
    sql="select* from books"
    c.execute(sql)
    my_result=c.fetchall()
    print("Book ID\t Booktitle\t Author\t Available\t")
    for i in my_result:
        print(i[0], "\t", i[1], "\t", i[2], "\t", i[3])
        
def search_book():
    book=input('enter the name of book')
    sql="search * from books where b_name='"+book+"'"
    sql="search * from author where author='"+author+"'"
    c.execute(sql)
    my_result=c.fetchall()
    print("Book ID\t Book title\t Author\t Available\t")
    for i in my_result:
        print(i[0], "\t", i[1], "\t", i[2], "\t", i[3])
        
def diplay_issued_books():
    c.execute("select issue_details.*, books.b_name from issue_details, books where issue_details.*")
    my_result=c.fetchall()
    print("list of issued book:")
    print("Book ID, book name, Reg no, Member Name")



username=input("Enter username:")
password=input("Enter Password:")
if username=='admin'and password=='library12':
    print('Welcome Admin')
    while True:
        print("""Library Management System
        1.Create book 2.Issue book 3.Return book 4.Search book 5.Display book 8.Exit""")
        ch=input("Enter your choice:")
        if ch=='1':
            create_book()
        elif ch=='2':
            issue_book()
        elif ch=='3':
            return_book()
        elif ch=='4':
            search_book()
        elif ch=='5':
            print("1.All books 2.Issued books 3.Particular book")
            choice=int(input("select anyone"))
            if choice==1:
                display_books()
            elif choice==2:
                display_issued_books()
            elif choice==3:
                select_book()
            else:
                print("wrong choice")
        else:
            break
    else:
        print("Wrong username or Password,access denied")