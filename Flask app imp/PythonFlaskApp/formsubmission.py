from flask_wtf import Form
from wtforms import TelField, PasswordField, IntegerField, TextAreaField, RadioField, SubmitField
from wtforms.validators import DataRequired


class HealthRegistrationForm(Form):
    name = TelField(label="Name", validators=[DataRequired()])
    passWord = PasswordField(label="Password", validators=[DataRequired()])
    phoneNumber = IntegerField(label="Enter mobile number", validators=[DataRequired()])
    gender = RadioField(label='Gender', choices=['Male', 'Female'])
    address = TextAreaField(label="Address")
    age = IntegerField(label="Age")
    submit = SubmitField("send")
