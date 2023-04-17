from flask import Flask, render_template, request, redirect, url_for
import smtplib
import ssl
import mysql.connector
from email.message import EmailMessage

# MySQL connection
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Aditya@27",
    database="registration",
    auth_plugin='caching_sha2_password'
)
mycursor = mydb.cursor()

app = Flask(__name__)


@app.route('/index')
def index():
    return render_template('index.html')


@app.route('/about')
def about():
    return render_template('about.html')


@app.route('/courses')
def courses():
    return render_template('courses.html')


@app.route('/blog')
def blog():
    return render_template('blog.html')


@app.route('/teacher')
def teacher():
    return render_template('teacher.html')


@app.route('/login')
def login():
    return render_template('login.html')


@app.route('/contact_new')
def home():
    return render_template('contact_new.html')


@app.route('/tupload')
def tupload():
    return render_template('teacher/tupload.html')


@app.route('/tprofile')
def tprofile():
    return render_template('teacher/tprofile.html')


@app.route('/stprofile')
def stprofile():
    return render_template('student/stprofile.html')


@app.route('/tupdate')
def tupdate():
    return render_template('teacher/tupdate.html')


@app.route('/sresult')
def sresult():
    return render_template('teacher/sresult.html')


@app.route('/tapply_leave')
def tapply_leave():
    return render_template('teacher/tapply_leave.html')


@app.route('/thome')
def thome():
    return render_template('teacher/thome.html')


@app.route('/sapply_leave')
def sapply_leave():
    return render_template('student/sapply_leave.html')


@app.route('/sthome')
def sthome():
    return render_template('student/sthome.html')


@app.route('/ts')
def ts():
    return render_template('teacher/ts.html')


@app.route('/stupdate')
def stupdate():
    return render_template('student/stupdate.html')


@app.route('/ptt')
def ptt():
    return render_template('misc/ptt.html')

@app.route('/phome')
def phome():
    return render_template('principal/phome.html')


@app.route('/pexamsch')
def pexamsch():
    return render_template('prncipal/pexamsch.html')


@app.route('/pprofile')
def pprofile():
    return render_template('principal/pprofile.html')


@app.route('/pupdate')
def pupdate():
    return render_template('principal/pupdate.html')


@app.route('/ptupdate')
def ptupdate():
    return render_template('ptupdate.html')


@app.route('/payment')
def payment():
    return render_template('student/payment.html')


@app.route('/fee_structure')
def fee_structure():
    return render_template('fee_structure.html')


@app.route('/contact_new', methods=['POST'])
def contact_new():
    email_sender = 'sparkuniversity2023@gmail.com'
    email_password = 'tgdaiomntqdgaqds'
    email_receiver = request.form['email']
    subject = f"Spark University 2023"
    body = f"Greetings {request.form['name']}, we have received the following message from you:\n\n{request.form['msg']}\n\nWe will get in touch with you soon. \n\nRegards,\nSpark University"

    em = EmailMessage()
    em['From'] = email_sender
    em['To'] = email_receiver, email_sender
    em['Subject'] = subject
    em.set_content(body)

    context = ssl.create_default_context()

    with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as smtp:
        smtp.login(email_sender, email_password)
        smtp.sendmail(email_sender, email_receiver, em.as_string())

    return """
    <script>
    alert('Email sent successfully!');
    window.location.href='/';
    </script>
    """


@app.route('/register', methods=['POST'])
def register():
    if request.method == 'POST':
        # Get form data
        rno = request.form['rno']
        name = request.form['name']
        mail = request.form['mail']
        addr = request.form['addr']
        field = request.form['field']
        branch = request.form['branch']
        phn = request.form['phn']
        dob = request.form['dob']
        perc = request.form['perc']
        pwd = request.form['pwd']
        status = "disapproved"

        sql = "INSERT INTO new_student (rno, name, mail, addr, field, branch, phn, dob, perc, pwd, status) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        val = (rno, name, mail, addr, field,
               branch, phn, dob, perc, pwd, status)
        mycursor.execute(sql, val)
        mydb.commit()

    email_sender = 'sparkuniversity2023@gmail.com'
    email_password = 'tgdaiomntqdgaqds'
    email_receiver = request.form['mail']
    subject = f"Account Created Successfully"
    body = f"Dear {request.form['name']},\n\nYour account creation process has been successful.You will be able to LOGIN once the principal approves your request!\n\nRegards,\nSpark University."

    em = EmailMessage()
    em['From'] = email_sender
    em['To'] = email_receiver, email_sender
    em['Subject'] = subject
    em.set_content(body)

    context = ssl.create_default_context()

    with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as smtp:
        smtp.login(email_sender, email_password)
        smtp.sendmail(email_sender, email_receiver, em.as_string())

        return '''
        <script>
            alert("Registration successful!");
            window.location.href = "/login";
        </script>
        '''

# Define a route for the registration page


@app.route('/register')
def registration():

    # Fetch the latest value of rno from the database and increment it by 1
    mycursor = mydb.cursor()
    mycursor.execute("SELECT rno FROM new_student ORDER BY rno DESC LIMIT 1")
    result = mycursor.fetchone()
    rno = 1 if result is None else result[0] + 1

    # Render the registration page with the incremented value of rno
    return render_template('register.html', rno=rno)

# @app.route('/about')
# def aboutnum():
#     mycursor = mydb.cursor()
#     mycursor.execute("SELECT COUNT(*) FROM new_student")
#     student_count = mycursor.fetchone()

#     mycursor.execute("SELECT COUNT(*) FROM new_teacher WHERE status = 'approved'")
#     teacher_count = mycursor.fetchone()

#     return render_template('about.html', student_count=student_count, teacher_count=teacher_count)


@app.route('/sampleregister', methods=['POST'])
def sampleregister():
    if request.method == 'POST':
        # Get form data
        eid = request.form['eid']
        name = request.form['name']
        mail = request.form['mail']
        addr = request.form['addr']
        field = request.form['field']
        branch = request.form['branch']
        phn = request.form['phn']
        dob = request.form['dob']
        qual = request.form['qual']
        pwd = request.form['pwd']
        status = "disapproved"

        sql = "INSERT INTO new_teacher (eid, name, mail, addr, field, branch, phn, dob, qual, pwd, status) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        val = (eid, name, mail, addr, field,
               branch, phn, dob, qual, pwd, status)
        mycursor.execute(sql, val)
        mydb.commit()

    email_sender = 'sparkuniversity2023@gmail.com'
    email_password = 'tgdaiomntqdgaqds'
    email_receiver = request.form['mail']
    subject = f"Account Created Successfully"
    body = f"Dear {request.form['name']},\n\nYour account creation process has been successful.You will be able to LOGIN once the principal approves your request. \n\nRegards,\nSpark University."

    em = EmailMessage()
    em['From'] = email_sender
    em['To'] = email_receiver, email_sender
    em['Subject'] = subject
    em.set_content(body)

    context = ssl.create_default_context()

    with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as smtp:
        smtp.login(email_sender, email_password)
        smtp.sendmail(email_sender, email_receiver, em.as_string())

        return '''
        <script>
            alert("Registration successful!");
            window.location.href = "/index";
        </script>
        '''

# Define a route for the registration page


@app.route('/sampleregister')
def sampleregistration():

    # Fetch the latest value of eid from the database and increment it by 1
    mycursor = mydb.cursor()
    mycursor.execute("SELECT eid FROM new_teacher ORDER BY eid DESC LIMIT 1")
    result = mycursor.fetchone()
    eid = 1 if result is None else result[0] + 1

    # Render the registration page with the incremented value of eid

    return render_template('sampleregister.html', eid=eid)


@app.route('/ps')
def ps():
    return render_template('misc/ps.html')

# @app.route('/ps')
# def psdisp():
#     mycursor.execute("SELECT * FROM new_student")
#     result = mycursor.fetchall()
#     return render_template("ps.html", result=result)


@app.route('/pt')
def pt():
    return render_template('misc/pt.html')


# @app.route('/pt')
# def ptdisp():
#     mycursor.execute("SELECT * FROM new_teacher")
#     result = mycursor.fetchall()
#     return render_template('misc/pt.html', result=result)


if __name__ == '__main__':
    app.run(debug=True)
