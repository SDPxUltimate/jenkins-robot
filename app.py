
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/getcode', methods=['GET'])
def getcode():
    return "gitton nimble za 007 55 ez xdxd"


@app.route('/plus/<num1>/<num2>', methods=['GET'])
def plus(num1, num2):
    try:
        num1 = int(num1)
        num2 = int(num2)

        results = { 'result' : num1 + num2}
        
    except:
        results = { 'error_msg' : 'inputs must be numbers' }

    with app.app_context():
        res = jsonify(results)
        
    return res


if __name__ == '__main__':
    app.run()
