# Lightfield-processing

This is an useful tool to decode lightfield files(.lfp) and process the raw images in to 5D data. You can simplely run [`demo.m`](demo.m) step by step to see the results.

You should download lightfield data to [data](./data/) folder, I uploaded Wanner HCI datasets to [Google Drive](https://drive.google.com/drive/folders/1epj7GTDlCYTnlnG-TCvPmISBbBcWEhB4?usp=sharing).

# Just one step

just run [demo.m](demo.m), you will get everything.

# Step by step

## Step 1: load LF data

Once you have run `ViewLightField`, you will get the following wonderful images.

<center><img src="./results/all_views.gif" width="50%"></center>

![](./results/bigimg-1.jpg)

## Step 2: Horizontal EPI (fix v & y)

![](./results/epi_h.jpg)


## Step 3: Vertical EPI (fix u & x)

![](./results/epi_v.jpg)



## Step 4: Show Angular Patches(AP)

![](./results/buhhda2-ap-zoom.png)
