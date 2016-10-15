# -- Code snippet --
# 
# Execute a query from a text against a Mysql server and
# export the result set of a query in json format on STDOUT.
# 1 db row => 1 json line
#

import MySQLdb
import json 
import argparse 


parser = argparse.ArgumentParser()
parser.add_argument("--host")
parser.add_argument("--port", type=int)
parser.add_argument("--user")
parser.add_argument("--password")
parser.add_argument("--db")
parser.add_argument("--queryfile")

args = parser.parse_args()

db = MySQLdb.connect(host=args.host, port=args.port, user=args.user, 
                     passwd=args.password, db=args.db)


cursor = db.cursor()

queryText = "" 

with open(args.queryfile, 'r') as fh:
	queryText = fh.read()


cursor.execute(queryText)

fieldNames = [i[0] for i in cursor.description]
fieldSize = len(cursor.description)

for row in cursor.fetchall():
	rowHash = {} 	
	for i in range(fieldSize):
             rowHash[fieldNames[i]] = row[i]
    
	print(json.dumps(rowHash))



db.close()
