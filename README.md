# SAS Analysis - Dividend Growth Rate
### TLDR;
This is a basic data science project on proving true mean/median and calculating an accurate dividend growth rate. This is my first data science project; albeit with a relativly easy concept. I noticed that there were some individual stocks that were giving the impression that the porfolio was performing better than average. The analysis was conducted to determine if that was the case or not.

This readme will speak to the experiences of the project as well as give a little more insight at a micro-level in regards to the [code](https://github.com/TeaZea/SAS-Analysis_DividendGrowthRate/blob/main/Dividend%20Growth%20Analysis.sas). The [PDF](https://github.com/TeaZea/SAS-Analysis_DividendGrowthRate/blob/main/Dividend%20Growth%20Rate%20Analysis%202023.pdf) speaks to the actual analysis more.

---

### Setup
[Simply download then upload the file into SAS Studio.](https://github.com/TeaZea/SAS-Analysis_DividendGrowthRate/blob/main/Dividend%20Growth%20Analysis.sas)

---

### Dataset
The dataset is fairly simple and was inputted manually. There is currently no pipeline inplace to collect this data. I feel like manual insertion of datapoints is good enough as the portfolio is small and required minimal work.

![dataset used for analysis](https://github.com/TeaZea/SAS-Analysis_DividendGrowthRate/blob/main/ds.jpg)

---

### Overview of the code
I decided to clean up the data a bit and add a growth average variable (column) by creating a DO LOOP to iterate through the data (rows). This will be the variable that I conducted the analysis with.

![Code for creating a new variable](https://github.com/TeaZea/SAS-Analysis_DividendGrowthRate/blob/main/growthaveragepct.jpg)


Analysis was conducted by observing the normal attributes of the data. The MU and SIGMA are also kept with their default values. This is important because I wanted to confirm a normal distribution of the data. The reference line for the box plot is set to the median (2.08) as data was too volatile.

![PROC MEANS, UNIVARIATE and SGPLOT](https://github.com/TeaZea/SAS-Analysis_DividendGrowthRate/blob/main/analysis_and_charts.jpg)


This is just a simple loop that removes the specified outliers from the dataset before the analysis is replicated without them.

![Simple observation cleanup](https://github.com/TeaZea/SAS-Analysis_DividendGrowthRate/blob/main/obs_cleanup.jpg)

[You can find the full analysis here.](https://github.com/TeaZea/SAS-Analysis_DividendGrowthRate/blob/main/Dividend%20Growth%20Rate%20Analysis%202023.pdf)

---

### Challenges
The most challenging aspect of this analysis was the general understanding of statistical concepts. I didn't study it at an advanced level academically, so grasping things like IQR and STD came a bit slower than I would have like it to. I did take a statistical concept introduction course provided by SAS which helped me out greatly (some of my certifications can be found on my github home page).

Another challenge was understanding histograms as I don’t have a lot of experience with them.

