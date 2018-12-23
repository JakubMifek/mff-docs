from math import inf, nan, isnan
from event import Event

characters = {}


def character_to_code(character):
    if(character == '-'):
        return nan  # wall

    if(character == '+'):
        return inf  # goal

    if(character == '.'):
        return 0  # empty

    if not character in characters:  # new block
        characters[character] = len(characters) + 1

    return characters[character]  # block


def create_block(index, shape, table):
    minX = minY = inf
    maxX = maxY = 0

    for (x, y) in shape:  # find boundaries
        if x < minX:
            minX = x
        if x > maxX:
            maxX = x
        if y < minY:
            minY = y
        if y > maxY:
            maxY = y

    w = maxX - minX + 1
    h = maxY - minY + 1

    # logical 2D array representing shape filled with false (not taken)
    s = [[False for x in range(w)] for y in range(h)]
    for (x, y) in shape:  # fill taken positions with true
        s[y-minY][x-minX] = True

    return KlotskiBlock(index, minX, minY, w, h, s, table)


def position_is_free(index, x, y, width, height, shape, table):
    for b in range(height):
        for a in range(width):
            # if neither is true from following:
            if not (not shape[b][a] or  # this space in our shape is empty
                    table[y+b][x+a] == 0 or  # this space on the table is empty
                    # this space is taken by us (our old position)
                    table[y+b][x+a] == index or
                    table[y+b][x+a] == inf and table.goalblock == index):  # this space on the table is goal space and we are the goal block
                return False  # return false


def find_one_from_position(index, x, y, width, height, shape, table):
    ret = set([])

    x1 = x
    for y1 in range(min(y-1, 0), max(y+1, table.height)):  # vertical positions
        if y1 != y and position_is_free(index, x1, y1, width, height, shape, table):
            ret.add((y1, x1))

    y1 = y
    for x1 in range(min(x-1, 0), max(x+1, table.width)):  # horizontal positions
        if x1 != x and position_is_free(index, x1, y1, width, height, shape, table):
            ret.add((y1, x1))

    return ret


class KlotskiBlock:
    def __init__(self, index, x, y, width, height, shape, table):
        self.index = index
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.shape = shape
        self.table = table
        self.available_movements = self.all_movements()

    def by_one_movements(self):
        return find_one_from_position(self.index, self.x, self.y, self.width, self.height, self.shape, self.table)

    def all_movements(self):
        origin = (self.y, self.x)
        ret = self.by_one_movements()  # get movements by one position
        new = ret  # they are all new
        while len(new) > 0:  # while there are new (unexplored) positions
            accessible = set([])

            for (y, x) in new:  # get all positions reachable from these positions by one movement
                accessible |= find_one_from_position(
                    self.index, x, y, self.width, self.height, self.shape, self.table)

            new = accessible - ret  # new positions that we didn't explore yet are equal to the difference of all positions and already explored positions
            ret |= new  # set new positions as already explored

        ret -= set([origin])

        return ret


class KlotskiTable:
    def __init__(self, filename):
        self.loadtable(filename)
        self.on_solved = Event()
        self.on_block_move = Event()


    def __getitem__(self, index):
        if type(index) is int:
            return self.table[index]

        if type(index) is tuple:
            return self.table[index[0]][index[1]]

        raise Exception("Expected integer or tuple but got {}.".format(type(index)))


    def __str__(self):
        digits = 1
        while 10 ^ digits < len(self.blocks):
            digits += 1
        
        ret = []
        for i in range(len(self.table)):
            ret.append(' ; '.join(['{0:3.0f}'.format(x) for x in self.table[i]]))

        return '\n'.join(ret)


    def get_block(self, index):
        return self.blocks[index]


    def is_solved(self):
        goalblock = self.get_block(self.goalblock) # get the goal block

        for y in range(goalblock.height): # for its height
            for x in range(goalblock.width): # for its width
                if (goalblock.y + y, goalblock.x + x) not in self.goalpositions and (y, x) in goalblock.shape:
                    return False # if the "pixel" of the block is not in any of goal positions, return False

        self.on_solved(self)

        return True


    def move_block(self, block, position):
        if not position in block.available_movements:  # is position reachable?
            raise Exception("Movement to position not available.")

        (blocky, blockx) = position
        for y in range(block.height):
            for x in range(block.width):
                self.table[block.y + y][block.x + x] = 0  # clear my position

        for y in range(block.height):
            for x in range(block.width):
                self.table[blocky + y][blockx +
                                       x] = block.index  # set new position

        block.y = blocky
        block.x = blockx

        block.available_movements = block.all_movements()  # reload available movements

        self.on_block_move(block)


    def loadtable(self, filename):
        with open(filename) as f:
            lines = f.readlines()  # file is short so it's ok
            parts = lines[0].split()  # split sizes
            height = int(parts[0])  # height of table
            width = int(parts[1])  # width of table
            goalpositions = set([])  # empty set of goal positions

            # init table (all positions non-reachable -- walls)
            table = [[nan for x in range(width)] for y in range(height)]
            for y in range(height):
                for x in range(width):
                    # translate characters into digits
                    table[y][x] = character_to_code(lines[y+1][x])
                    if(lines[y+1][x] == '+'):  # goal position
                        goalpositions.add((y, x))

            # read which block should end in goal position
            goalblock = character_to_code(lines[len(lines) - 1])

            self.goalpositions = goalpositions
            self.goalblock = goalblock
            self.width = width
            self.height = height
            self.table = table
            self.filename = filename

            shapes = {}  # shapes of blocks represented as logical 2D array
            for y in range(height):
                for x in range(width):
                    if table[y][x] != 0 and table[y][x] != inf and not isnan(table[y][x]):
                        if table[y][x] not in shapes:
                            shapes[table[y][x]] = set([])

                        shapes[table[y][x]].add((y, x))

            blocks = {(index, create_block(index, shapes[shape], self))
                      for (index, shape) in enumerate(shapes)}  # create blocks from shapes

            self.blocks = blocks
