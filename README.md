Generalized AutoRegressive Conditional Heteroskedasticity Model (GARCH)

The GARCH model asserts that the best predictor of the variance in the next period is a weighted average of the long run average variance, the variance predicted for this period and the new information this period which is the most recent squared residual.

Letting r<sub>t</sub> be the return on an asset or portfolio:
<img src="https://latex.codecogs.com/svg.latex?\Large&space;r<sub>t</sub> = m<sub>t</sub> + $ \sqrt{h_t} $ * ε<sub>t</sub>"/>

The GARCH model for variance is:
<img src="https://latex.codecogs.com/svg.latex?\Large&space;h<sub>(t+1)</sub> = ω + α(r_t - m_t)<sup>2</sup> + βh<sub>t</sub> = ω + αh<sub>t</sub>ε<sup>2<sup><sub>t</sub> + βh<sub>t</sub>"/>


