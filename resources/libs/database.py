import psycopg2

def delete_account_by_email(email):

    query = f"DELETE FROM accounts WHERE email = '{email}';"

    conn = psycopg2.connect(
        host='babar.db.elephantsql.com',
        database='hroqxadc',
        user='hroqxadc',
        password='5us_1lmQnpJcC0d8FPyG0qba4zp2ranz'
    )

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()