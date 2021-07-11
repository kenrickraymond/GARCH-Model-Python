Generalized AutoRegressive Conditional Heteroskedasticity Model (GARCH)

The GARCH model asserts that the best predictor of the variance in the next period is a weighted average of the long run average variance, the variance predicted for this period and the new information this period which is the most recent squared residual.

Letting r<sub>t</sub> be the return on an asset or portfolio:
![\Large r_t = m_t + \sqrt{h_t} \varepsilon_t ](https://latex.codecogs.com/svg.image?r_t&space;=&space;m_t&space;&plus;&space;\sqrt{h_t}&space;&space;\varepsilon_t&space;)

The GARCH model for variance is:
<img src="https://latex.codecogs.com/svg.latex?\Large&space;h<sub>(t+1)</sub> = ω + α(r_t - m_t)<sup>2</sup> + βh<sub>t</sub> = ω + αh<sub>t</sub>ε<sup>2<sup><sub>t</sub> + βh<sub>t</sub>"/>


