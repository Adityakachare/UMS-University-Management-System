from flask import Flask, render_template, request, redirect, url_for
import smtplib
import ssl
from email.message import EmailMessage

app = Flask(__name__)

@app.route('/')
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
    
@app.route('/contact_new', methods=['POST'])
def contact_new():
    email_sender = 'sparkuniversity2023@gmail.com'
    email_password = 'tgdaiomntqdgaqds'
    email_receiver = request.form['email']
    subject = f"Spark University 2023"
    body = f"Greetings {request.form['name']}, we have received the following message from you:\n\n{request.form['msg']}\n\nWe will get in touch with you soon. \n\nRegards,\nSpark University"

    em = EmailMessage()
    em['From'] = email_sender
    em['To'] = email_receiver,email_sender
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
    
    

if __name__ == '__main__':
    app.run(debug=True)
