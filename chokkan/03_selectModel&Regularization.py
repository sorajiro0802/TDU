#!/Users/sorakojima/miniforge3/envs/python39/bin/python3
#%%
import numpy as np
import matplotlib.pyplot as plt

X = np.array([ 0.  ,  0.16,  0.22,  0.34,  0.44,  0.5 ,  0.67,  0.73,  0.9 ,  1.  ])
Y = np.array([-0.06,  0.94,  0.97,  0.85,  0.25,  0.09, -0.9 , -0.93, -0.53,  0.08])
fig, ax = plt.subplots(dpi=100)
ax.scatter(X, Y, marker='o', color='b')
ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.grid()
# %%
W3 = np.polyfit(X, Y, 3)
W3
# %%
x = np.linspace(0, 1, 1000)
fig, ax = plt.subplots(dpi=100)
ax.scatter(X, Y, marker='o', color='b')
ax.plot(x, np.polyval(W3, x), 'r')
ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.grid()
# %%
np.mean((Y - np.polyval(W3, X)) ** 2)
# %%
W9 = np.polyfit(X, Y, 9)
W9
# %%
x = np.linspace(0, 1, 1000)
fig, ax = plt.subplots(dpi=100)
ax.scatter(X, Y, marker='o', color='b')
ax.plot(x, np.polyval(W9, x), 'r')
ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.set_ylim(-1.2, 1.2)
ax.grid()
# %%
x = np.linspace(0, 1, 1000)
fig, ax = plt.subplots(dpi=100)
ax.scatter(X, Y, marker='o', color='b')
ax.plot(x, np.polyval(W9, x), 'r')
ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.grid()
# %%
np.mean((Y - np.polyval(W9, X)) ** 2)
# %%
W3 = np.polyfit(X, Y, 3)
W9 = np.polyfit(X, Y, 9)

x = np.linspace(0, 1, 1000)
fig, ax = plt.subplots(dpi=100)
ax.scatter(X, Y, marker='o', color='b')
ax.plot(x, np.sin(2 * np.pi * x), 'black', label=r'$\sin(2\pi x)$', linestyle="solid")
ax.plot(x, np.polyval(W3, x), label=r'Polymominal ($d=3$)', linestyle="dotted")
ax.plot(x, np.polyval(W9, x), label=r'Polymominal ($d=9$)', linestyle="dashed")
ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.set_ylim(-1.2, 1.2)
plt.legend(loc='upper right')
fig.savefig('overfitting.png')
ax.grid()

# %%
X_valid = np.array([ 0.05,  0.08,  0.16,  0.28,  0.44,  0.47,  0.55,  0.63,  0.84,   0.99])
Y_valid = np.array([ 0.35,  0.58,  0.87,  0.98,  0.45,  0.01, -0.36, -0.73, -0.85,  -0.06])
# %%
fig, ax = plt.subplots(dpi=100)
ax.scatter(X_valid, Y_valid, marker='x', color='r')
ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.set_ylim(-1.2, 1.2)
ax.grid()
# %%
for d in range(1, 10):
    W = np.polyfit(X, Y, d)
    Y_hat = np.polyval(W, X)
    Y_valid_hat = np.polyval(W, X_valid)
    e_train = np.mean((Y_hat - Y)**2)
    e_valid = np.mean((Y_valid_hat - Y_valid) ** 2)
    print(f'd = {d}: MSR = {e_train:.10f} (training), {e_valid:.10f} (validation)')
# %%
W3 = np.polyfit(X, Y, 3)
W5 = np.polyfit(X, Y, 5)
x = np.linspace(0, 1, 1000)

fig, ax = plt.subplots(dpi=100)
ax.scatter(X, Y, marker='o', label=r'Training data', color='b')
ax.plot(X_valid, Y_valid, label=r'Validation data', marker='x', color='r')
ax.plot(x, np.polyval(W3, x), label=r'Polymominal ($d=3$)', linestyle='dotted')
ax.plot(x, np.polyval(W5, x), label=r'Polymominal ($d=5$)', linestyle='solid')
ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.set_ylim(-1,2, 1.2)
plt.legend()
ax.grid()
# %%
np.set_printoptions(precision=1, linewidth=180)
for d in range(1, 10):
    W = np.polyfit(X, Y, d)
    print(f'd = {d}: {W}')
np.set_printoptions()
# %%
for d in range(1, 10):
    W = np.polyfit(X, Y, d)
    print('d = {}: |W|_2^2 = {}'.format(d, np.dot(W, W)))

# %% 3.4.確認問題
X = np.array([ 0.  ,  0.16,  0.22,  0.34,  0.44,  0.5 ,  0.67,  0.73,  0.9 ,  1.  ])
Y = np.array([-0.06,  0.94,  0.97,  0.85,  0.25,  0.09, -0.9 , -0.93, -0.53,  0.08])
# (1) 9次関数によるリッジ回帰
#   例として用いてきた学習データX,Yに対してリッジ回帰を行い，回帰曲線をプロットせよ．
#   ただし，正則化のハイパーパラメータはα=10^-9, 10^-6, 10^-3, 1の4通りを試し，
#   すべての回帰曲線と学習データの各店を一つのグラフ上にプロットせよ．

# （2）パラメータのL_2ノルム
#   学習した4つのモデルのパラメータのL_2ノルムを計算し，表示せよ

# （3）検証データに基づくαの選択
#   例として用いてきた以下の検証データX_valid, Y_validに対して，これまでに学習した4つのモデルの
#   平均二乗残差（MSR）を計算し，正則化のハイパー／パラメータとして最も汎化性能が高いと思われるものを選択せよ．
X_valid = np.array([ 0.05,  0.08,  0.12,  0.16,  0.28,  0.44,  0.47,  0.55,  0.63,  0.99])
Y_valid = np.array([ 0.35,  0.58,  0.68,  0.87,  0.83,  0.45,  0.01, -0.36, -0.83, -0.06])
# %% (1)
des_X = np.array([X**0,X**1,X**2,X**3,X**4,X**5,X**6,X**7,X**8,X**9]).T
alphas = [ 10e-9, 10e-6, 16e-3, 1]

I = np.eye(N=10)
W = np.array([np.linalg.inv(des_X.T @ des_X + alpha * I) @ des_X.T @ Y  for alpha in alphas])

fig, ax = plt.subplots(dpi=100)
ax.grid()
ax.scatter(X, Y, color='r')
xs = np.linspace(0, 1, 1000)
for j in range(len(alphas)):
        y_hat = W[j][0] + W[j][1]*xs + W[j][2]*xs**2 + W[j][3]*xs**3 + W[j][4]*xs**4 + W[j][5]*xs**5 + W[j][6]*xs**6 + W[j][7]*xs**7 + W[j][8]*xs**8 + W[j][9]*xs**9
        ax.plot(xs, y_hat, label='$α = $'+str(alphas[j]))
ax.set_xlabel('$x$')
ax.set_ylabel('$y$')
ax.set_title('(1) $\hat{y} = X(X^tX+αI)^{-1}Xy$')
ax.legend()
plt.show()
# %% (2) 
print('(2)')
W = [np.linalg.norm(W[i], ord=2)**2 for i in range(0, 4)]
# L_2 = [np.dot(W[i], W[i]) for i in range(0, 4)]
cnt = 0
for i in alphas:
    print(f'α = {i} のときのWのL_2ノルムは {W[cnt]:.3f}')
    cnt += 1

# %% (3)
des_X_valid = np.array([X_valid**0,X_valid**1,X_valid**2,X_valid**3,X_valid**4,X_valid**5,X_valid**6,X_valid**7,X_valid**8,X_valid**9]).T
W_valid = np.array([np.linalg.inv(des_X_valid.T @ des_X_valid + alpha * I) @ des_X_valid.T @ Y_valid for alpha in alphas])

print('(3)')
for i in range(len(alphas)):
    Y_valid_hat = des_X_valid @ W_valid[i]
    e_valid = np.mean((Y_valid - Y_valid_hat) ** 2)
    print(f'α = {alphas[i]}, MSR (validation) : {e_valid}')

# answer : alpha = 10e-8のとき