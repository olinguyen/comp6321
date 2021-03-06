#!/usr/bin/python

print
print "checking for numpy"
try:
    import numpy
except ImportError:
    print "you should install numpy before continuing"

print "checking for sklearn"
try:
    import sklearn
except:
    print "you should install sklearn before continuing"
try:
    import google.protobuf
except:
    print "you should install protobuf before continuing"


print
print "downloading the dataset (this may take a while)"
print "download will complete at about 5 GB"
import urllib
url = "http://www.cs.toronto.edu/~nitish/multimodal/flickr_data.tar.gz"
urllib.urlretrieve(url, filename="flickr_data.tar.gz")
print "download complete!"

print
print "unzipping Enron dataset (this may take a while)"
import tarfile
tfile = tarfile.open("flickr_data.tar.gz", "r:gz")
tfile.extractall(".")
print "extract complete!"

print 'Getting deepnet library'
url = "https://github.com/nitishsrivastava/deepnet/archive/master.zip"
urllib.urlretrieve(url, filename="deepnet.zip")
import zipfile
zip = zipfile.ZipFile('./deepnet.zip')
zip.extractall('./')
