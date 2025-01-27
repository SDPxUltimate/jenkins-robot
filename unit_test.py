import unittest

from app import app

class AppTestCase(unittest.TestCase):

    def test_plus_0_0(self):
        res = app.plus("0", "0")
        self.assertEqual(res.data, b'{"result":0}\n')
    
    def test_plus_1_0(self):
        res = app.plus("1", "0")
        self.assertEqual(res.data, b'{"result":1}\n')
        
    def test_plus_0_1(self):
        res = app.plus("0", "2")
        self.assertEqual(res.data, b'{"result":2}\n')
    
    def test_plus_3_2(self):
        res = app.plus("3", "2")
        self.assertEqual(res.data, b'{"result":5}\n')
    
    def test_plus_minus_1_0(self):
        res = app.plus("-1", "0")
        self.assertEqual(res.data, b'{"result":-1}\n')
        
    def test_plus_0_minus_1(self):
        res = app.plus("0", "-2")
        self.assertEqual(res.data, b'{"result":-2}\n')
        
    def test_plus_minus_3_minus_5(self):
        res = app.plus("-3", "-5")
        self.assertEqual(res.data, b'{"result":-8}\n')
        
    def test_plus_0_a(self):
        res = app.plus("0", "a")
        self.assertEqual(res.data, b'{"error_msg":"inputs must be numbers"}\n')
    
    def test_plus_a_0(self):
        res = app.plus("a", "0")
        self.assertEqual(res.data, b'{"error_msg":"inputs must be numbers"}\n')
        
    def test_plus_a_a(self):
        res = app.plus("a", "a")
        self.assertEqual(res.data, b'{"error_msg":"inputs must be numbers"}\n')

if __name__ == "__main__":
    unittest.main()
