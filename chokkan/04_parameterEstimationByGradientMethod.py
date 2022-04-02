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
D = np.array([[1, 3], [3, 6], [6, 5], [8, 7]])
plt.scatter(D[:,0], D[:,1])
plt.xlim(0, 10)
plt.ylim(0, 10)

# %%
