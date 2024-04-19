

/* Import & print*/
PROC IMPORT DATAFILE = "/home/u63171931/Projects/Dividend Growth Analysis/2023 Dividend Growth.xlsx" 
DBMS = xlsx OUT = rawDGA REPLACE;
RUN;

DATA DGA (DROP = i);
	SET rawDGA;
	LENGTH growthAveragePRCT 5.3;
	DO i = 13;
		growthAveragePRCT = growthAverage * 100;
	END;
RUN;

PROC PRINT DATA = DGA NOOBS;
TITLE1 "Dividend Info 2023";
TITLE2 "NOTE: XCLN has Q4 has 0.002$ of difference in raw data";
RUN;

/* Proc MEANS statement */
PROC MEANS DATA = DGA MAXDEC = 2
	N MEAN MEDIAN STD STDERR QRANGE;
	VAR growthAveragePRCT;
	TITLE "Figure 1a";
RUN;


/* Histogram to visualize our hypothesis*/
PROC UNIVARIATE DATA = DGA;
	VAR growthAveragePRCT;
	HISTOGRAM growthAveragePRCT / NORMAL(MU=est SIGMA=est);
	TITLE "Figure 1c";
RUN;


/* VBox plot to show the IQR*/
PROC SGPLOT DATA = DGA;
	REFLINE 2.08 / AXIS=y LINEATTRS=(COLOR=blue);
	VBOX growthAveragePRCT / DATALABEL=stock;
	YAXIS LABEL="Average Annual Growth (%)";
	TITLE "Figure 1d";
RUN;
TITLE;


/* Removing the outliers */
DATA DGAnoOutliers;
	SET DGA;
	IF Stock = "XGD" THEN DELETE;
	IF Stock = "XCLN" THEN DELETE;
RUN;

PROC PRINT DATA = DGAnoOutliers NOOBS;
TITLE "Average Dividend Growth in 2023 - no outliers";
RUN;

PROC MEANS DATA = DGAnoOutliers MAXDEC = 2
	N MEAN MEDIAN STD STDERR QRANGE;
	VAR growthAveragePRCT;
	TITLE "Figure 2a";
RUN;

PROC UNIVARIATE DATA = DGAnoOutliers;
   VAR growthAveragePRCT;
   HISTOGRAM growthAveragePRCT / NORMAL(MU=est SIGMA=est);
   TITLE "Figure 2c";
RUN;

PROC SGPLOT DATA = DGAnoOutliers;
	REFLINE 2.08 / AXIS=y LINEATTRS=(COLOR=blue);
	VBOX growthAveragePRCT / DATALABEL=stock;
	YAXIS LABEL="Average Annual Growth (%)";
	TITLE "Figure 2d";
RUN;

PROC PRINT DATA = DGA (DROP = Q1 -- divPayout) NOOBS;
TITLE "Annual Dividend Growth 2023 (%)";
RUN;



