# Bifurcation-Distribution
Visualizations for the logistic map and bifurcation. Check it out on [YouTube](https://www.youtube.com/watch?v=pPCdMnctF9g)

`pdf.pde` graphs the distribution of `x` after `k` iterations of the logistic map assuming `x` is uniformly distributed at first. The parameters of interest here are the iteration depth `k` and the logistic map parameter `r`. Moving the mouse will change one of those parameters, or you can change them in the code. the red lines show where the mouse's current `x`-coordinate will map to, so you can see which sections of the distribution map where. This graph takes exponential time in `k`. For large values of `k` we can start to see what are hopefully stationary distributions for the logistic map. There are lots of peaks and they all look pretty similar, but I think some of them represent asymptotes and others represent point masses in the limit.

`bifurcation.pde` visualizes function iteration. Moving your mouse vertically affects the parameter `r` and horizontally selects the initial value of `x`.
