#%%
from re import X
from tkinter import W, Y
from matplotlib import axes
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.collections
import matplotlib.animation
import matplotlib.colors
from IPython.display import HTML
# %%
def f(x):
    return 0.5 * x ** 2 - 5 * x + 13.5

def g(x):
    return x - 5

def sd(f, g, x=0., eta=0.01, eps=1e-4):
    t = 1
    H = []
    while True:
        gx = g(x)
        H.append(dict(t=t, x=x, fx=f(x), gx=gx))
        if -eps < gx < eps:
            break
        x -= eta * gx
        t += 1
    return H
H = sd(f, g, x = 9, eta=0.5)
print(H[-1])
fig, ax = plt.subplots(dpi=100)
ax.plot(
    [h['t'] for h in H],
    [h['fx'] for h in H],
    'o-'
    )
ax.set_xlabel('$t$')
ax.set_ylabel('$f(x)$')
ax.grid()
plt.show()
# %%
D = np.array([[1, 3], [3, 6], [6, 5], [8, 7]])

max_epochs: int = 10000
eta = 0.001
eps = 1e-4

X = np.vstack([D[:, 0], np.ones_like(D[:, 0])]).T
y = D[:, 1]
w = np.zeros(X.shape[1])

for t in range(max_epochs):
    y_hat = X @ w
    grad = 2 * X.T @ (y_hat - y)
    if np.sum(np.abs(grad)) < eps:
        break
    w -= eta * grad
print(w, t)

# %% 4.6.2
max_epochs = 40000
eta0 = 0.03
eps = 1e-4

X = np.vstack([D[:,0], np.ones_like([D[:,0]])]).T
y = D[:,1]
w = np.zeros(X.shape[1])

for t in range(max_epochs):
    eta = eta0 / np.sqrt(1+t)
    i = np.random.randint(0, X.shape[0])
    y_hat = np.dot(X[i], w)
    grad = 2 * (y_hat - y[i]) * X[i]
    if np.sum(np.abs(grad)) < eps:
        break
    w -= eta * grad
w
# %%
def draw_data(ax, D):
    ax.set_xlabel('$x$')
    ax.set_ylabel('$y$')
    ax.set_xlim(0, 10)
    ax.set_ylim(0, 10)
    ax.set_aspect('equal')
    ax.scatter(D[:,0], D[:,1])
fig, ax = plt.subplots(dpi=100)
draw_data(ax, D)
plt.show()
# %% 4.9.確認問題
# (1) リッジ回帰モデルを学習する反復式の導出
#   確率的勾配降下法でリッジ回帰モデルを学習したい．確率的勾配降下法の反復式を導出せよ．

# (2) L_2正則化を反復式から解釈する
#   リッジ回帰では，学習中にパラメータベクトルのL_2ノルムが大きくなりすぎないように制御する．
#  （1）で導出した反復式から，パラメータベクトルが大きくなりすぎるのを防ぐメカニズムを導出せよ．

# (3)リッジ回帰の実装
#   確率的勾配降下法でリッジ回帰のパラメータを推定するアルゴリズムを実装し，以下のデータに対して多項式近似
#   の曲線を求めよ．ただし，便利なモジュール等は使わずに，この資料で説明した式・アルゴリズムをプログラムとして
#   表現すること．多項式近似の次数やリッジ回帰の係数αなどのハイパーパラメータは適当に設定せよ．
X = np.array([ 0.  ,  0.16,  0.22,  0.34,  0.44,  0.5 ,  0.67,  0.73,  0.9 ,  1.  ])
Y = np.array([-0.06,  0.94,  0.97,  0.85,  0.25,  0.09, -0.9 , -0.93, -0.53,  0.08])

# %%
