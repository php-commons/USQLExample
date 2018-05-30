# USQLExample

A simple example of generating random data with U-SQL and Azure Data Lake. This is a basic demonstration of how to approach a problem that is embarrassingly parallel. This is used as a exercise to show how approaching problems like this in distributed data stores (Data Lake in this case) differs from other approaches. 

## Initial Setup

Make sure you have the proper tools (VS2017 with the Data Lake tooling). Also, for this example, you will need a connection to Azure Data Lake for some of the examples. You can use MSDN Azure benefits or a free or pay as you go account. 

https://docs.microsoft.com/en-us/azure/data-lake-analytics/data-lake-analytics-data-lake-tools-get-started 

The above link is a great starting point for getting the tools working. When you have the setup complete you should be able to build and run the project locally. 

# Exercise One: Initial Script

Try running the project on your Azure Data Lake with the default number of AUs (5). After the script job has completed, select the AU Analysis tab and then load the profile (click the link).

You should get a warning about how the jobs had 5 AUs allocated, but at most only used 1 AUs.

In the next exercise, we will fix this problem.

# Exercise Two: Basic Scale Out

First, modify the CreateScript.usql file to create a second seedRows collection, as follows:

    @seedRows2 =
    GenerateRowSet
    (
        100000
    );

Then modify the last select statement to use that new collection

    @random.Next(10000, 99999).ToString() AS zipCode
    FROM @seedRows2;

Rerun the script. As a bonus exercise, how many AUs do expect to get used in this new script? Confirm your answer using the tools.

# Exercise Two: Scaling Up

Modify the CreateScript.usql file so that the seedRows generate one million rows as follows:

    @seedRows =
    GenerateRowSet
    (
        1000000
    );

Rerun the script. See how much longer the job took. As a bonus exercise, keep bumping up the size. We recommend you don't go past 100 million rows in the row set, however. 

# Exercise Three: Rescaling 

Modify the CreateScript.usql file script that will optimally use 4 AUs to create a million records and verify that this is true by using the tools. 