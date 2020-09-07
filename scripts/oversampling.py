import argparse
from numpy.linalg.linalg import norm
import pandas as pd


def oversample(input_path, output_path):
    df = pd.read_csv(input_path)
    df['tran_timestamp'] = pd.to_datetime(df['tran_timestamp'])

    pos_samples_df = df[df['is_sar'] == True]
    neg_samples_df = df[df['is_sar'] == False]
    pos_samples = len(df[df['is_sar'] == True])
    neg_samples = len(df[df['is_sar'] == False])

    print('pos_samples size %d' % pos_samples)
    print('neg_samples size %d' % neg_samples)
    print('ratio %.4f' % (pos_samples / neg_samples))

    sample_size = int(abs(neg_samples - pos_samples) / 4)

    pos_oversample = pos_samples_df.sample(sample_size, replace=True)
    neg_downsample = neg_samples_df.sample(sample_size, replace=True)
    df = pd.concat([neg_downsample, pos_oversample]).sort_values(by='tran_timestamp')

    over_pos_samples = len(df[df['is_sar'] == True])
    over_neg_samples = len(df[df['is_sar'] == False])

    print('over_pos_samples size %d' % over_pos_samples)
    print('over_neg_samples size %d' % over_neg_samples)
    print('ratio %.4f' % (over_pos_samples / over_neg_samples))

    df.to_csv(output_path, index=False)


def argparser():
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--input_path', type=str)
    parser.add_argument('-o', '--output_path', type=str)

    args = parser.parse_args()

    return args


def main():
    args = argparser()

    oversample(args.input_path, args.output_path)


if __name__ == '__main__':
    main()
