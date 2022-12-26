import MySQLdb
import mysql.connector
import os
import socket
from flask import Flask, render_template, request, redirect, jsonify, url_for, session
from flask_mysqldb import MySQL
import bcrypt


class user():
    def __init__(self):
        self.con = mysql.connector.connect(host='localhost', user='root', password='AnuVeer@2611',
                                           database='data1')
        self.con.autocommit = True
        self.cur = self.con.cursor(dictionary=True)

    def all_user_model(self):
        self.cur.execute("SELECT * FROM users")
        result = self.cur.fetchall()
        if len(result) > 0:
            return {"payload": result}
            # return make_response({"payload":result},200)
        else:
            return "No Data Found"

    def registration(self, data):
        if request.method == 'POST':
            name = request.form.get('uname')
            email = request.form.get('uemail')
            password = request.form.get('upassword')
            print(name, email, password)
            hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

            self.cur.execute("""INSERT INTO users(SNO, NAME, EMAIL, PASSWORD) VALUES(NULL,'{}','{}','{}')"""
                             .format(name, email, password))

            return render_template('registration.html')

    def login_validation(self, data):
        if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
            email = request.form.get('email')
            password = request.form.get('password')
            print(email, password)

            self.cur.execute("""SELECT * FROM users WHERE email LIKE '{}' AND password LIKE '{}'"""
                             .format(email, password))
            users = self.cur.fetchall()
            print(users)

            if len(users) > 0:
                session['logged_in'] = True
                return redirect(url_for('dashboard', email=email))
            else:
                return redirect(url_for('signUp'))

    def showdata(self):
        if request.method == "GET":
            self.cur.execute("SELECT * FROM users")
            result = self.cur.fetchall()
            print(len(result))
            return jsonify(list(result))

    def fetchDetails(self, email):
        hostname = socket.gethostname()
        host_ip = socket.gethostbyname(hostname)
        self.cur.execute("""SELECT name FROM users WHERE email LIKE '{}'"""
                         .format(email))
        name = self.cur.fetchone()
        print(str(hostname), str(host_ip))
        return str(name)
