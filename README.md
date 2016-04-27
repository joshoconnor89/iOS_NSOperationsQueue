# iOS_NSOperationsQueue
Tutorial on NSOperationsQueue


This is a simple app showing how to multithread using NSOperationsQueue.  It is 
important to keep prevent blockage of the main thread when an operation is hogging
too much time/memory.  This will lead to choppyness such as scrolling up and down
a tableview/scrollview.  

This app shows how easy it can be to use NSOperationsQueue to improve
performance.  When ran, app will display three tasks ran on different individual threads.
