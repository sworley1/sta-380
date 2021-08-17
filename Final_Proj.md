Visual Story Telling Part 1: Green Buildings
--------------------------------------------

There are few things I think the “Excel Guru” overlooked in his analysis
and how he chose to derive at a decision. The first thing that jumps out
at me is that after he removed what outliers he noticed, he looked at
the rent comparisons of green buildings vs non-green buildings without
any further breakdowns. This has issues because there tends to be a lot
of variance in some of the variables we have access to. Take the number
of stories a building has into account, the proposed project has 15
stories but as you can see in this graph, the data set has a lot of
variance

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-2-1.png)

The graph shows that there are sever buildings in this data set with
more than 30 stories which is double the number of stories of the
proposed buildings. This can impose bias in our data set as different
sized buildings might have different trends in energy consumption or
other costs.

We also see that there is significant difference in age of buildings,
which is problematic because of the advances in technology in recent
years which old buildings may not have had access to.

The nice thing about the variance in the data set is that we slice the
data to focus on buildings in the data set similar to the proposed
constructions project. Taking into account the variables we know, we can
filter the data to match the specifications we have by only looking at
buildings with between 10 and 20 stories, between 200,000 and 300,000
square feet, and less than 10 years old. This gives us a better
comparison because it might remove some of the underlying confounding
variables that the “Exel guru” did not take into account and give us a
better understanding between the cost and benefit of building eco or
not.

Once we filter the data, we are left with 52 buildings to analyze.
Starting by looking at the distribution of rent between green buildings
and non-green buildings

    ## Picking joint bandwidth of 4.14

![](Final_Proj_files/figure-markdown_github/geom-ridges-1.png)

Here it actually looks like the Green buildings have higher revenue
streams than non-green buildings but this doesn’t take a building’s
cluster into account which is a better comparison.

![](Final_Proj_files/figure-markdown_github/scatter-1.png)

In this graph we see that while in most instances, green buildings have
higher revenue per square foot than buildings in the same cluster, there
are instances where the green buildings have rent prices lower than the
cluster average. This further discredits the “Excel Guru’s” initial
because it is not so cut and dry. To really answer this question more
data must be taken into account such as which specific cluster Austin
falls into so as there can be better informed decision making into the
actual going price for rent for green buildings compared to the average.
Plus then you can take into account the number of energy days needed and
compute the exact energy costs of the building to make a more accurate
decision.

Visual Story Telling Part 2: Flights at ABIA
--------------------------------------------

### Understanding Delays and Where they Come From

I’m always fascinated (maybe more so annoyed by) flight delays, and
whether pilots can actually “make up time in the air” as they claim.

    ## Warning: Removed 1601 rows containing missing values (geom_point).

![](Final_Proj_files/figure-markdown_github/flight-time-duration%20-1.png)

Wow, looks like an overwhelming number of flights have some sort of
delay. But is this always because of time in the air? What about delays
on the ground? What happens when we take departure delays out of the
equation?

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-3-1.png)

This plot doesn’t quite make sense, or at least there is more going on
here than we originally thought.  
So what’s going on there? Any relation to Taxi Out time?

    ## Warning: Removed 1419 rows containing missing values (geom_point).

![](Final_Proj_files/figure-markdown_github/taxi-out-1.png)

It looks like there isn’t the time needed to Taxi out doesn’t have an
impact on when a plane was set to depart. But does it have an effect on
Arrival Delay?

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-4-1.png) Now
we are getting somewhere, this relationship makes sense and may account
for some of the confounding variables we saw in the earlier plot.

What happens when we take both ends of taxi time into account?

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-5-1.png)

This still makes sense but if we add `Departure Delay` too?

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-6-1.png) There
we go! That makes sense! When we add together all three togehter we see
a clear relationship with the total Arrival Delay. This plot also shows
how time can be made up in the air by looking at the deviation from the
purple line which is simply y = x. So now back to the original question,
can you make up more time in the air?

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-7-1.png) Here
is the answer to the question we were looking for. Pilots can in fact
make up some time in the air but it largely but it helps the longer the
flight is in the air.

Portfolio Modeling
------------------

In this project I decided I wanted to learn what NOT to do when it comes
to trading and see how making simple mistakes can cost you. For that I’m
picking three examples of possible poor trading strategies. The same
process is going to be repeated for the three funds. \* Create a sample
portfolio \* Gather historical data \* Run 10,000, 20 day simulations of
bootstrap sampling following the provided rules.

So for the first of the 3 portfolios, I wanted to learn what the return
would be if you stuck with a single company who puts togehter these
EFTs. The first porfolio all comes from Fidelity and 4 of their various
EFTs ranging from Technology to Real Estate. I wanted to see how wise it
is to spend it all within a single broker.

    ## [1] "FTEC" "ONEQ" "FHLC" "FREL"

    ## [1] 101172.9

    ## [1] 5325.837

    ## [1] 1172.927

![](Final_Proj_files/figure-markdown_github/portfolio-1-1.png)

    ##         0%        25%        50%        75%       100% 
    ## -24181.888  -2147.158   1243.062   4524.947  26005.680

When choosing only Fidelity EFTs, our bootstrap sample of 10000
simulations showed that on average we expect the starting wealth to go
from `$100,000` to `$101,142.2` over the 20 day trading period with a
standard deviation of `$5,312.29`.

The next two portfolios I wanted to look at is to see what happens when
you bet on a certain industry to see the risks associated with that and
what happens. For the second portfolio I decided to pick 4 EFTs that all
are covering the Tech industry.

    ## [1] "VGT"  "FTEC" "SMH"  "IYW"

    ## [1] 101817.9

    ## [1] 6499.38

    ## [1] 1817.864

![](Final_Proj_files/figure-markdown_github/portfolio-2-1.png)

    ##         0%        25%        50%        75%       100% 
    ## -25769.276  -2422.055   1783.925   5888.690  38847.703

When choosing only Tech EFTs, our bootstrap sample of 10000 simulations
showed that on average we expect the starting wealth to go from
`$100,000` to `$101,195.2` over the 20 day trading period with a
standard deviation of `$6,364.85`. This portfolio had a very slightly
higher expected return than the first portfolio but there is higher risk
associated in the VaR with this porfolio.

The last industry I wanted to test the strategy of solo porfolio
investment is the real estate industry. These 4 funds come from 4
different brokers but all cover the real-estate industry.

    ## [1] "VNQ"  "SCHH" "ICF"  "FREL"

    ## [1] 100451

    ## [1] 6039.112

    ## [1] 450.9854

![](Final_Proj_files/figure-markdown_github/portfolio-3-real-estate-1.png)

    ##          0%         25%         50%         75%        100% 
    ## -28155.3828  -3205.3253    548.2185   4183.4489  30780.0452

This portfolio had the lowest expected outcome across the 10,000
simulations and also one of the highest risks associated with it. And at
the 5% risk level some of the worst outcomes possible.

This exercise made it clear that diversification is key, even when it is
limited to one provider. The first portfolio with the differing industry
offerings had the highest estimated return on investment compared to the
others that focused solely on one industry.

Market Segmentation
-------------------

Looking at the social marketing data and seeing the breakdown of
different post breakdowns, it seemed interesting to perform some
dimensionality reduction to force the grouping of categories together to
make different segments. In an attempt to filter out some of the bots
that tend to post the adult content, any user who scored in that
category was removed from the dataset. Next, to start to process of
dimensionality reduction, we looked at first generating 5 dimensions
from the original 36 which produced the output you see below.

    ## Importance of first k=5 (out of 36) components:
    ##                           PC1    PC2    PC3     PC4     PC5
    ## Standard deviation     5.2670 4.2494 3.9672 3.54027 3.43246
    ## Proportion of Variance 0.1942 0.1264 0.1102 0.08773 0.08247
    ## Cumulative Proportion  0.1942 0.3206 0.4308 0.51847 0.60094

This is slightly concerning because it only showed us a cumulative
proportion of roughly 60% of the data so we then tried to looking at
what happened when we used 6 variables of interest. Which gave us the
following output.

    ## Importance of first k=6 (out of 36) components:
    ##                           PC1    PC2    PC3     PC4     PC5     PC6
    ## Standard deviation     5.2670 4.2494 3.9672 3.54027 3.43246 3.20985
    ## Proportion of Variance 0.1942 0.1264 0.1102 0.08773 0.08247 0.07212
    ## Cumulative Proportion  0.1942 0.3206 0.4308 0.51847 0.60094 0.67306

We see the proportion of explanation go up by 7 points moving from 5
dimensions to 6 dimensions which is decent improvement but we were
curious to see what these groups look like and how they differ from each
other. The following plots where taken for each of our dimension (`PCX`)
and shows their top 5 descriptive categories, and bottom 5 descriptive
categories.

    ## 
    ## Attaching package: 'gridExtra'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     combine

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-9-1.png)
![](Final_Proj_files/figure-markdown_github/unnamed-chunk-10-1.png)
These plots show a few interesting things. Firstly, that there are a few
repeat categories that appear across multiple dimensions like cooking,
health and nutrition, and sports and outdoors. And this makes sense
because it is a nutrition company so those traits are likely shared
across all the followers. It might be interesting to see the same
results but removing some of the common attributes like: \*
`health_nutrition` \* `cooking` \* `photo_sharing`

    ## Importance of first k=6 (out of 36) components:
    ##                           PC1    PC2    PC3     PC4     PC5     PC6
    ## Standard deviation     5.2670 4.2494 3.9672 3.54027 3.43246 3.20985
    ## Proportion of Variance 0.1942 0.1264 0.1102 0.08773 0.08247 0.07212
    ## Cumulative Proportion  0.1942 0.3206 0.4308 0.51847 0.60094 0.67306

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-11-1.png)![](Final_Proj_files/figure-markdown_github/unnamed-chunk-11-2.png)
The results of this is still surprising. The cumulative proportion
explained actually decreased 3 points and we still don’t see super clear
differences in our groups. We can generate a few user personas for the
company however that are slightly different and more distinct than the
original. `PC5` and `PC6` seem to be reletively distinct and defined
compared to the others. `PC5` provides the company with a demographic
who is really big into personal fitness, the outdoors, and dating.
Likely healthy, fit, singles in their 20s. `PC6` is similar but with a
bigger focus on on automotive and online gaming. This groups is could be
associated to towards males.

While these two groups are relatively distinct the `PC4` and `PC3` are
very similar to each other and don’t provide the company much
distinction.

Going forward it would be helpful for the company to peform more feature
extraction from Twitter and beyond what their followers are saying but
also what their followers are interacting with, and engagement with
various other themed campaigns to determine give this segment analysis
more data to work with.

Author Attribution
------------------

``` r
library(tm) 
library(slam)
library(proxy)
library(readtext)
library(tidytext)
library(stringr)
library(reactable)
library(text2vec)
library(magrittr)
```

    ## readtext object consisting of 6 documents and 1 docvar.
    ## # Description: df[,3] [6 × 3]
    ##   doc_id           text                Author       
    ##   <chr>            <chr>               <fct>        
    ## 1 106247newsML.txt "\"The Intern\"..." AaronPressman
    ## 2 120600newsML.txt "\"The U.S. P\"..." AaronPressman
    ## 3 120683newsML.txt "\"Elementary\"..." AaronPressman
    ## 4 136958newsML.txt "\"An influen\"..." AaronPressman
    ## 5 137498newsML.txt "\"An influen\"..." AaronPressman
    ## 6 14014newsML.txt  "\"A group of\"..." AaronPressman

So the first step was reading all the files into two different data
frames, one for the training set - the other for testing. Each data
frame had two columns, the author and text. After that we were then able
to start performing text analysis by cleaning the text data. Starting by
transforming all the words to lowercase and turning them into to tokens.
After that we created a vector matrix for each text document based on
our built vocab. From there we then trained a model on

``` r
# Create Vocab Words
train_tokens <- word_tokenizer(tolower(data_train$text))
it_train = itoken(train_tokens,
                  progressbar = FALSE)
vocab = create_vocabulary(it_train)


vectorizer = vocab_vectorizer(vocab)

dtm_train = create_dtm(it_train, vectorizer)


library(glmnet)
NFOLDS = 3
glmnet_classifier = cv.glmnet(x = dtm_train, y = data_train[["Author"]],
                              family = "multinomial",
                              alpha = 1,
                              type.measure = "class",
                              nfolds = NFOLDS,
                              thresh = 1e-3,
                              maxit = 1e5)

plot(glmnet_classifier)
```

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-13-1.png) The
training model looks like the best lambda value occurs around lambda =
4.

``` r
# Process the training data
test_tokens <- word_tokenizer(tolower(data_test$text))
it_test = itoken(test_tokens,
                  progressbar = FALSE)
vocab = create_vocabulary(it_test)


vectorizer = vocab_vectorizer(vocab)
dtm_test = create_dtm(it_test, vectorizer)



#predict(glmnet_classifier, dtm_train, type = "response")
```

Association Rule Mining
-----------------------

The idea for finding rules associated within grocery purchases is to
start with loose constraints and thresholds and then tighten them based
on what rules appear. These are our rules starting by sorting the rules
on confidence, support, and then lift.

``` r
grocery_rules <- apriori(groceries, parameter=list(support=0.0001, confidence=.001, maxlen=5))
```

    ## Apriori
    ## 
    ## Parameter specification:
    ##  confidence minval smax arem  aval originalSupport maxtime support minlen
    ##       0.001    0.1    1 none FALSE            TRUE       5   1e-04      1
    ##  maxlen target  ext
    ##       5  rules TRUE
    ## 
    ## Algorithmic control:
    ##  filter tree heap memopt load sort verbose
    ##     0.1 TRUE TRUE  FALSE TRUE    2    TRUE
    ## 
    ## Absolute minimum support count: 0 
    ## 
    ## set item appearances ...[0 item(s)] done [0.00s].
    ## set transactions ...[169 item(s), 9835 transaction(s)] done [0.00s].
    ## sorting and recoding items ... [169 item(s)] done [0.00s].
    ## creating transaction tree ... done [0.00s].
    ## checking subsets of size 1 2 3 4 5 done [0.40s].
    ## writing ... [16887617 rule(s)] done [1.45s].
    ## creating S4 object  ... done [3.15s].

``` r
rules_conf <- sort(grocery_rules, by = "confidence", decreasing = TRUE)

inspect(head(rules_conf, n=10))
```

    ##      lhs                       rhs                      support      confidence
    ## [1]  {sound storage medium} => {frozen potato products} 0.0001016777 1         
    ## [2]  {sound storage medium} => {cat food}               0.0001016777 1         
    ## [3]  {sound storage medium} => {candy}                  0.0001016777 1         
    ## [4]  {sound storage medium} => {ham}                    0.0001016777 1         
    ## [5]  {sound storage medium} => {white bread}            0.0001016777 1         
    ## [6]  {sound storage medium} => {pastry}                 0.0001016777 1         
    ## [7]  {sound storage medium} => {shopping bags}          0.0001016777 1         
    ## [8]  {sound storage medium} => {bottled water}          0.0001016777 1         
    ## [9]  {sound storage medium} => {soda}                   0.0001016777 1         
    ## [10] {baby food}            => {finished products}      0.0001016777 1         
    ##      coverage     lift       count
    ## [1]  0.0001016777 118.493976 1    
    ## [2]  0.0001016777  42.947598 1    
    ## [3]  0.0001016777  33.452381 1    
    ## [4]  0.0001016777  38.417969 1    
    ## [5]  0.0001016777  23.756039 1    
    ## [6]  0.0001016777  11.240000 1    
    ## [7]  0.0001016777  10.149639 1    
    ## [8]  0.0001016777   9.047838 1    
    ## [9]  0.0001016777   5.734694 1    
    ## [10] 0.0001016777 153.671875 1

``` r
rules_conf <- sort(grocery_rules, by = "support", decreasing = TRUE)
inspect(head(rules_conf, n=10))
```

    ##      lhs    rhs                support    confidence coverage lift count
    ## [1]  {}  => {whole milk}       0.25551601 0.25551601 1        1    2513 
    ## [2]  {}  => {other vegetables} 0.19349263 0.19349263 1        1    1903 
    ## [3]  {}  => {rolls/buns}       0.18393493 0.18393493 1        1    1809 
    ## [4]  {}  => {soda}             0.17437722 0.17437722 1        1    1715 
    ## [5]  {}  => {yogurt}           0.13950178 0.13950178 1        1    1372 
    ## [6]  {}  => {bottled water}    0.11052364 0.11052364 1        1    1087 
    ## [7]  {}  => {root vegetables}  0.10899847 0.10899847 1        1    1072 
    ## [8]  {}  => {tropical fruit}   0.10493137 0.10493137 1        1    1032 
    ## [9]  {}  => {shopping bags}    0.09852567 0.09852567 1        1     969 
    ## [10] {}  => {sausage}          0.09395018 0.09395018 1        1     924

``` r
rules_conf <- sort(grocery_rules, by = "lift", decreaseing = TRUE)
inspect(head(rules_conf, m=10))
```

    ##     lhs                         rhs                         support confidence     coverage lift count
    ## [1] {finished products,                                                                               
    ##      soft cheese}            => {baby food}            0.0001016777          1 0.0001016777 9835     1
    ## [2] {salty snack,                                                                                     
    ##      soups}                  => {baby food}            0.0001016777          1 0.0001016777 9835     1
    ## [3] {candy,                                                                                           
    ##      cat food,                                                                                        
    ##      frozen potato products} => {sound storage medium} 0.0001016777          1 0.0001016777 9835     1
    ## [4] {cat food,                                                                                        
    ##      frozen potato products,                                                                          
    ##      ham}                    => {sound storage medium} 0.0001016777          1 0.0001016777 9835     1
    ## [5] {cat food,                                                                                        
    ##      frozen potato products,                                                                          
    ##      white bread}            => {sound storage medium} 0.0001016777          1 0.0001016777 9835     1
    ## [6] {cat food,                                                                                        
    ##      frozen potato products,                                                                          
    ##      pastry}                 => {sound storage medium} 0.0001016777          1 0.0001016777 9835     1

``` r
plot(grocery_rules, method="two-key plot")
```

    ## To reduce overplotting, jitter is added! Use jitter = 0 to prevent jitter.

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-18-1.png)

``` r
tmp <- subset(grocery_rules, subset = confidence > 0.01 & support > 0.005)
plot(tmp)
```

    ## To reduce overplotting, jitter is added! Use jitter = 0 to prevent jitter.

![](Final_Proj_files/figure-markdown_github/unnamed-chunk-19-1.png)
