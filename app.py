from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.expected_conditions import presence_of_element_located
import time
from flask import Flask, render_template
from flask import request
import pymysql.cursors
from datetime import datetime
from datetime import date, timedelta
app = Flask(__name__)

connection = pymysql.connect(host='localhost',
							 user='root',
							 password='12345678',
							 database='metro',
							 cursorclass=pymysql.cursors.DictCursor)

@app.route("/", methods=['GET'])
def home():
	yesterday 	= datetime.now() - timedelta(1)
	_date 		= datetime.strftime(yesterday, '%Y-%m-%d')
	sql = "select * from `sea_level` where entry_date = '{date}'".format(date=_date);
	cursor = connection.cursor()
	cursor.execute(sql)
	result = cursor.fetchall()
	temp = {}
	temp["date"] = _date
	temp["data"] = result
	return render_template('index.html', data=temp)

@app.route('/', methods=['POST'])
def test():
	text = request.form['text']
	if text == "":
		temp = {}
		temp["date"] = ""
		temp["data"] = []
		temp["error"] = "please enter valid date"
		return render_template('index.html', data=temp)

	_cur_date_ 	= datetime.now().strftime("%Y-%m-%d")
	_cur_date 	= text
	_cur_date_obj_ = datetime.strptime(_cur_date, '%d/%m/%Y')
	_formated_date_ = _cur_date_obj_.strftime('%Y-%m-%d')

	if _formated_date_ >= _cur_date_:
		temp = {}
		temp["date"] = _formated_date_
		temp["data"] = []
		temp["error"] = "date must be previous date from current date"
		return render_template('index.html', data=temp)

	driver = webdriver.Chrome(executable_path=r"/home/dhanasekaran/dhana/practice/metro/chromedriver")
	driver.get('http://123.63.203.150/reserve3.asp');
	time.sleep(5)
	driver.find_element_by_xpath("/html/body/form/table/tbody/tr[2]/td/font/input[1]").send_keys(_cur_date)
	driver.find_element_by_xpath("/html/body/form/table/tbody/tr[2]/td/font/input[2]").click()
	time.sleep(3)
	
	total_rows 		= 12
	total_columns 	= 10

	datas 		= []

	for i in range(2, total_rows):
		temp = {}
		for j in range(1, total_columns):
			text = driver.find_element_by_xpath("/html/body/form/center[2]/table/tbody[2]/tr[{first}]/td[{second}]".format(first=i, second=j)).text
			temp[j] = text
		datas.append(temp)
	
	for item in datas:
		sql = "select count(*) as total from `sea_level` where `entry_date` = '{date}' and reservoir = '{res}'".format(date=_formated_date_, res=item[1])
		cursor = connection.cursor()
		cursor.execute(sql)
		result = cursor.fetchone()
		if result["total"] > 0:
			#update stuff
			sql = "update `sea_level` set `entry_date` = '{entry_date}',`full_tank` = '{full_tank}',`full_capacity`='{full_capacity}',`level`='{level}',`storage`='{storage}',`inflow`='{inflow}',`outflow`='{outflow}',`rainfall`='{rainfall}',`last_year_storage`='{last_year_storage}' where `reservoir` = '{reservoir}'".format(entry_date=_formated_date_,full_tank=item[2],full_capacity=item[3],level=item[4],storage=item[5],inflow=item[6],outflow=item[7],rainfall=item[8],last_year_storage=item[9], reservoir=item[1])
			cursor.execute(sql)
			connection.commit()
		else:
			#insert stuff
			sql = "insert into `sea_level` set `entry_date` = '{entry_date}',`reservoir` = '{reservoir}',`full_tank` = '{full_tank}',`full_capacity`='{full_capacity}',`level`='{level}',`storage`='{storage}',`inflow`='{inflow}',`outflow`='{outflow}',`rainfall`='{rainfall}',`last_year_storage`='{last_year_storage}'".format(entry_date=_formated_date_,reservoir=item[1],full_tank=item[2],full_capacity=item[3],level=item[4],storage=item[5],inflow=item[6],outflow=item[7],rainfall=item[8],last_year_storage=item[9])
			
			cursor.execute(sql)
			connection.commit()



	sql = "select * from `sea_level` where entry_date = '{date}'".format(date=_formated_date_);
	cursor = connection.cursor()
	cursor.execute(sql)
	result = cursor.fetchall()
	temp = {}
	temp["date"] = _formated_date_
	temp["data"] = result
	return render_template('index.html', data=temp)


if __name__ == 'main':
	app.run(host="0.0.0.0", debug=True)