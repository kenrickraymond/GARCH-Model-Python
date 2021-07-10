Generalized AutoRegressive Conditional Heteroskedasticity Model (GARCH)

The GARCH model asserts that the best predictor of the variance in the next period is a weighted average of the long run average variance, the variance predicted for this period and the new information this period which is the most recent squared residual.

Letting r_t be the return on an asset or portfolio:
r_t = m_t + \sqrt{h_t} * ε_t

The GARCH model for variance is:
h_(t+1) = ω + α(r_t - m_t)^2 + βh_t = ω + αh_t(ε^2)_t + βh_t
