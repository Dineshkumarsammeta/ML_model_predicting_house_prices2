import pandas as pd
import numpy as np

def test_numpy_multiplication():
    a = np.array([2, 4, 6])
    b = np.array([3, 5, 7])
    result = a * b
    assert (result == np.array([6, 20, 42])).all()

def test_numpy_statistics():
    arr = np.array([10, 20, 30, 40])
    assert np.mean(arr) == 25
    assert np.median(arr) == 25

def test_pandas_sum_column():
    df = pd.DataFrame({"sqft": [1000, 1500, 2000]})
    assert df["sqft"].sum() == 4500

def test_pandas_groupby():
    data = {
        "city": ["London", "London", "Manchester"],
        "price": [500000, 600000, 300000],
    }
    df = pd.DataFrame(data)
    grouped = df.groupby("city")["price"].mean()
    assert grouped["London"] == 550000
    assert grouped["Manchester"] == 300000
