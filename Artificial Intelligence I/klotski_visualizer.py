import sys
from klotski import KlotskiTable

def print_table(block):
    print(block.table)


def console(filename):
    table = KlotskiTable(filename)
    table.on_block_move += print_table
    print(table)


switch = {
    'console': console
#    'window': window
}


def main():
    mode = 'console'
    filename = 'input.klotski'

    if len(sys.argv) > 1:
        filename = sys.argv[1]

        if len(sys.argv) > 2:
            mode = sys.argv[2]

    switch[mode](filename)


if __name__ == '__main__':
    main()