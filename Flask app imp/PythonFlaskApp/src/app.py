import os
import socket
from flask import Flask, render_template, request, redirect, url_for, session
import bcrypt
from databasemodel.datamodel import user

import re

app = Flask(__name__)
app.secret_key = os.urandom(24)
app.debug = True
obj1 = user()


# it will redirect to index route.
@app.route('/')
def main_page():
    return redirect('/index')


# it will return index.html
@app.route('/index')
def index():
    return render_template('index.html')


# it will return signIn.html
@app.route('/signIn')
def signIn():
    return render_template('signIn.html')


# it will return dashboard.html
@app.route('/dashboard/<email>')
def dashboard(email):
    if 'logged_in' in session:
        name1 = obj1.fetchDetails(email)
        return render_template('dashboard.html', namee=name1)

    else:
        return redirect(url_for('signIn'))


# it is a login validation api.
@app.route('/login_validation', methods=['Post', 'GET'])
def login_validation():
    return obj1.login_validation(request.form)


# testing GET with postman
@app.route('/showdata', methods=['GET'])
def showdata():
    if request.method == "GET":
        return obj1.showdata()


# registration api for signUp page.
@app.route('/registration', methods=['POST', 'GET'])
def registration():
    return obj1.registration(request.form)


# It will redirect to signUp page.
@app.route('/signUp', methods=['POST', 'GET'])
def signUp():
    return render_template('signUp.html')


# it will redirect to freehealthtips.html
@app.route('/freehealth')
def freehealth():
    if 'logged_in' in session:
        return render_template('freehealthtips.html')
    else:
        return redirect('/')

    # it will redirect to freeexercise.html


@app.route('/freeexercise')
def freeexercise():
    if 'logged_in' in session:
        return render_template('freeexercise.html')

    else:
        return redirect('/')


# it will redirect to benifitsOfDiffExer.html
@app.route('/benifitsOfDiffExer')
def benifitsOfDiffExer():
    if 'logged_in' in session:
        return render_template('benifitsOfDiffExer.html')
    else:
        return redirect('/')


# it will redirect main_page
@app.route('/logout')
def logout():
    session.pop('logged_in')
    return redirect('/')


if __name__ == "main":
    app.run(host='0.0.0.0', port=5000, debug=True)
