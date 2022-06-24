# Close-Test
In my [sentiment analysis project](https://github.com/DavideGiardini/Twitter-Sentiment-Analysis-to-predict-the-stock-market) I wanted to evaluate the efficiency of Twitter Sentiment Analysis as a tool of prediction for the stock market.<br>

## Granger Causality Test

My first idea was to do so using [Granger's Causality Test](https://en.wikipedia.org/wiki/Granger_causality). The Granger causality test is a statistical hypothesis test, expressed by Clive Granger in 1969 and later expanded by Clive Granger, for determining whether one time series in useful in forecasting another. 
A time serie X is said to Granger-cause a second time serie Y if, conditioning by the past value of X, the MSQ of the forecast $y+t$ is significantly less than the case in which the information of the past value of X is ignored. Mathematically:
<p align="center">
$E[y_t-E(y_t|\cdot)|y_{t-1},y_{t-2},...;x_{t-1},x_{t-2},...]^2\leq E[y_t-E(y_t|\cdot)|y_{t-1},y_{t-2},...]^2$
</p>
In other words a time series X is said to Granger-cause Y if it can be shown, usually through a series of t-tests and F-tests on lagged values of X (and with lagged values of Y also included), that those X values provide statistically significant information about future values of Y. <br>
This is not, though, exactly what I wanted to achieve. The problem was that I had built an automated task that downloaded all the tweet relative to a firm at the open of the stock market, and I wanted to research if this data was useful to predict the valuation of the firm at the closing of the market. The Granger Test wasn't exactly what I needed, because it would have compared the closing price to the tweet downloaded the day before. For this reason, we want the first MSQ not only conditioned by the past value of X, but also the present value. Besides that, we want that the information the tweets give to us at the opening of the stock market are useful to predict the closing price taking into account all the informations that is available at that moment: the more useful of all beign the opening price of the stock.

## My revision
In conclusion according to our Close Tes, our sentiment time serie S is said to cause the time serie of the closing prices C if, conditioning by the past **and present** value of S, and by the present and past value of the time serie of the **opening price O**, the MSQ of the forecast $c+t$ is significantly less than the case in which the information of S is ingored. Mathematically:
<p align="center">
$E[c_t-E(c_t|\cdot)|c_{t-1},c_{t-2},...;s_{t},s_{t-1},...;o_{t},o_{t-1},...]^2\leq E[c_t-E(c_t|\cdot)|c_{t-1},c_{t-2},...;o_{t},o_{t-1},...]^2$
</p>

The way this test is calculated is very similar to the Granger Test. The G.Test is infact only an F test on the joint significance of the retarded value of X in the complete method. In the same way, the Close Test builds a linear model with past values of C, present and past values of S, and present and past values of O. After that, the test computes the F test on the joint significance of the present and past values of S.
