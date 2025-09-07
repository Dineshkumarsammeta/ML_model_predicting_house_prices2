import pandas as pd
import numpy as np

def test_numpy_addition():
    a = np.array([1, 2, 3])
    b = np.array([4, 5, 6])
    result = a + b
    assert (result == np.array([5, 7, 9])).all()

def test_pandas_dataframe():
    df = pd.DataFrame({"price": [100000, 200000, 300000]})
    assert "price" in df.columns
    assert df["price"].mean() == 200000
