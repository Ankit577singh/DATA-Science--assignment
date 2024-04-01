from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL
from passlib.hash import sha256_crypt

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'registration_db'

mysql = MySQL(app)


from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
from passlib.hash import sha256_crypt

app = Flask(__name__)

# Configure MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'registration_db'

mysql = MySQL(app)


@app.route('/', methods=['GET'])
def index():
    return render_template('register.html')


@app.route('/register', methods=['POST'])
def register():
    if request.method == 'POST':
        # Fetch form data
        student_name = request.form['student_name']
        father_name = request.form['father_name']
        mother_name = request.form['mother_name']
        phone_number = request.form['phone_number']
        email = request.form['email']
        date_of_birth = request.form['date_of_birth']
        address = request.form['address']
        blood_group = request.form['blood_group']
        department = request.form['department']
        course = request.form['course']
        password = sha256_crypt.hash(request.form['password']) 
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users (student_name, father_name, mother_name, phone_number, email, date_of_birth, address, blood_group, department, course, password) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (student_name, father_name, mother_name, phone_number, email, date_of_birth, address, blood_group, department, course, password))
        mysql.connection.commit()
        cur.close()

        return redirect('/')

if __name__ == '__main__':
    app.run(debug=True)
