import numpy as np
from scipy.linalg import svd
import matplotlib.pyplot as plt

# Load data from file
dataX = np.loadtxt('data.txt')

# Define functions
def NormalizeData(dataX):
    meanVals = np.mean(dataX, axis=0)
    stdVals = np.std(dataX, axis=0)
    normData = (dataX - meanVals) / stdVals
    return normData, meanVals, stdVals

def CovMatrix(dataX):
    normData, meanVals, stdVals = NormalizeData(dataX)
    covMat = np.cov(normData, rowvar=0)
    return covMat, normData, meanVals, stdVals

def SVD(covMat, k):
    U, Sigma, VT = svd(covMat)
    VT = VT.T
    Uk = U[:, :k]
    Sk = np.diag(Sigma[:k])
    return Uk, Sk, VT

def PCA(dataX, k):
    covMat, normData, meanVals, stdVals = CovMatrix(dataX)
    Uk, Sk, VT = SVD(covMat, k)
    lowData = np.dot(np.dot(normData, Uk), Uk.T)*stdVals + meanVals
    return lowData

# Run PCA and plot results
lowData = PCA(dataX, k=1)

plt.scatter(dataX[:, 0], dataX[:, 1], label='Original Data')
plt.scatter(lowData[:, 0], lowData[:, 1], label='PCA Data')
plt.legend()
plt.show()