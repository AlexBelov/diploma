import pandas as pd
import numpy as np
from scipy.sparse import coo_matrix
from implicit.als import AlternatingLeastSquares
from sklearn.externals import joblib

data = pd.read_csv("~/github_stars_november.csv", sep=',', header=1, names=["user", "repo"])
data['user'] = data['user'].astype("category")
data['repo'] = data['repo'].astype("category")
stars = coo_matrix((np.ones(data.shape[0]),
                   (data['repo'].cat.codes.copy(),
                    data['user'].cat.codes.copy())))
model = AlternatingLeastSquares(factors=50,
                                regularization=0.01,
                                dtype=np.float64,
                                iterations=50)
confidence = 40
model.fit(confidence * stars)

joblib.dump(model, 'lib/model.pkl')
