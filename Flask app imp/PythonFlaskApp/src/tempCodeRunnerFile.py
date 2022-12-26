from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy


from datetime import datetime

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///data1.db"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


class DataApp(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), unique=True)
    date_created = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self) -> str:
        return f"{self.sno} - {self.email}"


@app.route('/')
def main_page():
    return render_template('templates/index.html')


@app.route('/services')
def free_section():
    return 'Welcome to free section  -'


@app.route('/Sign_in')
def authorized_page():
    return render_template('templates/signIn.html')


@app.route('/MyDb')
def my_db_page():
    data1 = DataApp(sno=1, email="rajveer25ps@gmail.com")
    db.session.add(data1)
    db.session.commit()
    return render_template('index3.html')


@app.route('/Sign_up')
def signup_page():
    return render_template('templates/signUp.html')


if __name__ == "main":
    app.run(debug=True)
