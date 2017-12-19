import pandas as pd
import numpy as np
from scipy.sparse import coo_matrix
from implicit.als import AlternatingLeastSquares
from sklearn.externals import joblib
import argparse
import json

parser = argparse.ArgumentParser(description='Process some repositories.')
parser.add_argument('stars', metavar='N', type=str, nargs='+',
                   help='starred repos')
args = parser.parse_args()

data = pd.read_csv("~/github_stars_november.csv", sep=',', header=1, names=["user", "repo"])
data['user'] = data['user'].astype("category")
data['repo'] = data['repo'].astype("category")

confidence = 40
model = joblib.load('lib/model.pkl')

repos = dict(enumerate(data['repo'].cat.categories))
repo_ids = {r: i for i, r in repos.iteritems()}

def user_items(u_stars):
    star_ids = [repo_ids[s] for s in u_stars if s in repo_ids]
    data = [confidence for _ in star_ids]
    rows = [0 for _ in star_ids]
    shape = (1, model.item_factors.shape[0])
    return coo_matrix((data, (rows, star_ids)), shape=shape).tocsr()

user = user_items(args.stars)

def recommend(user_items):
    recs = model.recommend(userid=0, user_items=user_items, recalculate_user=True)
    return [(repos[r], s) for r, s in recs]

print(json.dumps(recommend(user)))
