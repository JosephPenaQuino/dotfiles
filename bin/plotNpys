#!/home/joseph/anaconda3/envs/imageProcessing/bin/python3
'''
This script plot multiple numpy files that are named im_<4 digi number>
author: Joseph P.
'''

import argparse
from importlib.util import spec_from_loader, module_from_spec
from importlib.machinery import SourceFileLoader


SPEC = spec_from_loader("plotNpy", SourceFileLoader("plotNpy", "/home/joseph/bin/plotNpy"))
PLOT_NPY = module_from_spec(SPEC)
SPEC.loader.exec_module(PLOT_NPY)

def show_multiple(initial, qnt, limits, stats, offset):
    '''Show multiple numpy 2d images'''
    files = []
    for i in range(qnt):
        files.append("im_{:04d}.npy".format(initial+i))
    PLOT_NPY.plot(files, limits, stats, offset)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'initial',
        help='The number of the first image to be read. eg: 10 from im_0010.npy',
        type=int
        )
    parser.add_argument(
        'quantity',
        help=('The quantity of images that are to be read. eg: 10 to read from'
              'im_0010.npy until im_0019.npy'),
        type=int
        )
    parser.add_argument(
        '-l',
        '--limits',
        help='Prints or not the max and min values of the image',
        action='store_true'
        )
    parser.add_argument(
        '-s',
        '--stats',
        help='Prints or not the median and mean values of the image',
        action='store_true'
        )
    parser.add_argument(
        '-o',
        '--offset',
        help='Prints or not the real index',
        default=0,
        type=int
        )
    args = parser.parse_args()
    show_multiple(
        initial=args.initial,
        qnt=args.quantity,
        limits=args.limits,
        stats=args.stats,
        offset=args.offset
        )
