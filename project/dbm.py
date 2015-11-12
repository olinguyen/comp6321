import numpy as np

if __name__ == '__main__':
    labels = np.load('./flickr/labels.npy')
    #txt_data = np.load('./flickr/text/text_all_2000_labelled.npz')
    for splitnum in range(1, 5):
        print 'Split number %d' % splitnum

        train_idx = np.load('./flickr/splits/train_indices_%d.npy' % splitnum)
        test_idx = np.load('./flickr/splits/test_indices_%d.npy' % splitnum)
        valid_idx = np.load('./flickr/splits/valid_indices_%d.npy' % splitnum)

        print 'Train data shape', train_idx.shape
        print 'Test data shape', test_idx.shape
        print 'Validation data shape', valid_idx.shape
        print

        Ytrain = labels[train_idx]
        Ytest = labels[test_idx]
        Yvalid = labels[valid_idx]
