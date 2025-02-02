#!/Users/sorakojima/miniforge3/envs/python39/bin/python3

#%%
from statistics import mean
from turtle import color
from matplotlib.backend_bases import FigureManagerBase
from matplotlib.image import FigureImage
# from matplotlib.lines import _LineStyle
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches
import matplotlib.colors
import matplotlib.animation
from IPython.display import HTML
import japanize_matplotlib
import statsmodels.formula.api as smf
import pandas as pd
X = np.array([
    9.1, 11.2, 12.3, 18.9, 22.2, 26. , 30.9, 31.2, 28.8, 23. , 18.3,
    11.1,  8.3,  9.1, 12.5, 18.5, 23.6, 24.8, 30.1, 33.1, 29.8, 23. ,
    16.3, 11.2,  9.6, 10.3, 16.4, 19.2, 24.1, 26.5, 31.4, 33.2, 28.8,
    23. , 17.4, 12.1, 10.6,  9.8, 14.5, 19.6, 24.7, 26.9, 30.5, 31.2,
    26.9, 23. , 17.4, 11. , 10.4, 10.4, 15.5, 19.3, 26.4, 26.4, 30.1,
    30.5, 26.4, 22.7, 17.8, 13.4, 10.6, 12.2, 14.9, 20.3, 25.2, 26.3,
    29.7, 31.6, 27.7, 22.6, 15.5, 13.8, 10.8, 12.1, 13.4, 19.9, 25.1,
    26.4, 31.8, 30.4, 26.8, 20.1, 16.6, 11.1,  9.4, 10.1, 16.9, 22.1,
    24.6, 26.6, 32.7, 32.5, 26.6, 23. , 17.7, 12.1, 10.3, 11.6, 15.4,
    19. , 25.3, 25.8, 27.5, 32.8, 29.4, 23.3, 17.7, 12.6, 11.1, 13.3,
    16. , 18.2, 24. , 27.5, 27.7, 34.1, 28.1, 21.4, 18.6, 12.3])

Y = np.array([
    463.,  360.,  380.,  584.,  763.,  886., 1168., 1325.,  847.,
    542.,  441.,  499.,  363.,  327.,  414.,  545.,  726.,  847.,
    1122., 1355.,  916.,  571.,  377.,  465.,  377.,  362.,  518.,
    683.,  838., 1012., 1267., 1464., 1000.,  629.,  448.,  466.,
    404.,  343.,  493.,  575.,  921., 1019., 1149., 1303.,  805.,
    739.,  587.,  561.,  486.,  470.,  564.,  609.,  899.,  946.,
    1295., 1325.,  760.,  667.,  564.,  633.,  478.,  450.,  567.,
    611.,  947.,  962., 1309., 1307.,  930.,  668.,  496.,  650.,
    506.,  423.,  531.,  672.,  871.,  986., 1368., 1319.,  924.,
    716.,  651.,  708.,  609.,  535.,  717.,  890., 1054., 1077.,
    1425., 1378.,  900.,  725.,  554.,  542.,  561.,  459.,  604.,
    745., 1105.,  973., 1263., 1533., 1044.,  821.,  621.,  601.,
    549.,  572.,  711.,  819., 1141., 1350., 1285., 1643., 1133.,
    784.,  682.,  587.])
#%%
def show_graph(X, Y, x, y):
    fig, ax = plt.subplots(dpi=100)
    ax.scatter(X, Y, marker='.')
    ax.plot(x, y, 'tab:red')
    ax.set_title('最高気温とアイスクリーム・シャーベットの支出額')
    ax.set_xlabel('最高気温の月平均（℃）')
    ax.set_ylabel('支出額（円）')
    ax.set_xlim(0, 35)
    ax.set_ylim(-250, 2000)
    ax.grid()
    fig.show()
#%%
from sklearn.linear_model import LinearRegression
# %%
reg = LinearRegression()
reg.fit(X.reshape(-1, 1), Y)
# %%
reg.coef_
# %%
reg.intercept_
# %%
reg.score(X.reshape(-1, 1), Y)
# %%
x = np.linspace(0, 35, 100)
y_hat = reg.predict(x.reshape(-1, 1))
show_graph(X, Y, x, y_hat)
# %%  1.9.確認問題
# 以下のデータDsに対して単回帰分析を行うプログラムを実装せよ
D = np.array([[1, 3], [3, 6], [6, 5], [8, 7]])
X = D[:,0]
Y = D[:,1]
# (1) 単回帰の実装
#   Dsに対して単回帰を行うプログラムを実装し，回帰直線の係数a, bの値を求めよ
# (2) 回帰直線の描画
#   単回帰の実装で求めた回帰直線をデータ点とともにグラフに描け
#（3）残差の計算
#   各事例に対して残差を求めよ
# (4) 説明変数と残差の共分散
#   説明変数と残差の共分散を求めよ
# (5) 目的変数の推定値と残差の共分散
#   目的変数の推定値と残差の共分散を求めよ
# (6) 決定係数
#   決定係数（R＾2）を求めよ
# %% (1)
def Cov(X, Y):
    return np.mean(X*Y) - np.mean(X) * np.mean(Y)
def Var(X):
    return np.mean(X**2) - (np.mean(X))**2
# print(np.var(X))
# print(Var(X))
# %%
def singleRegression(X, Y):
    a = Cov(X, Y) / Var(X)
    b = np.mean(Y) - a * np.mean(X)
    return a, b

# %%
print(f'傾きと切片はそれぞれ，{singleRegression(X, Y)}')
# %% (2)
fig, ax = plt.subplots(dpi=100)
ax.scatter(X, Y)
x = np.linspace(0, 10, 100)
a, b = singleRegression(X, Y)
y_hat = a*x + b
ax.plot(x, y_hat,color='red')
ax.grid()
plt.show()
# %% (3)
eps_hat = np.array(Y - (a*X + b))
print(f'残差：{eps_hat}')
# %% (4)
print(f'説明変数と残差の共分散:{Cov(eps_hat, X):.3f}')
# %% (5)
y_hat = a*X + b
print(f'目的変数の推定値と残差の共分散：{Cov(eps_hat, y_hat):.3f}')
# %% (6)
var_eps = Var(eps_hat)
var_Y = Var(Y)
R_squared = 1 - var_eps/var_Y
print(f'決定係数R^2：{R_squared:.3f}')
# %%
df = pd.DataFrame(D, columns=['X', 'Y'])
formula = 'Y ~ X'
result = smf.ols(formula, df).fit()
print(result.summary())
# %%
