# encoding=utf8
import sys

reload(sys)
sys.setdefaultencoding('utf8')

strn = "08d7eebaf3d2bbd2b6b1eabcc7"

hex_data = strn.decode("hex")
print hex_data.decode("GBK")


class switch(object):
    def __init__(self, value):
        self.value = value
        self.fall = False

    def __iter__(self):
        """Return the match method once, then stop"""
        yield self.match
        raise StopIteration

    def match(self, *args):
        """Indicate whether or not to enter a case suite"""
        if self.fall or not args:
            return True
        elif self.value in args:  # changed for v1.5, see below
            self.fall = True
            return True
        else:
            return False


f = open("/Users/sun/Desktop/com_flag.lib", "rb")
wFile = open("/Users/sun/Desktop/w.txt", 'w')
result = list()
f.seek(0, 0)
while True:
    byte = f.read(1)
    if byte == '':
        break
    else:
        hexstr = "%s" % byte.encode('hex')
        # denum = int(hexstr,16)
        result.append(hexstr)
        # print byte,hexstr

f.close()
# print(result)
strToFile = " ".join(result)
wFile.write(strToFile)
wFile.close()
# print(strToFile)
# beginIndex =  strToFile.find("78")
# print(beginIndex)
# contentStr = strToFile[40:];
# print(contentStr)


pindex = result.index("78")
result[0:pindex] = []
print('value = %s' % result)

onlySon = ["00", "08", "01", "10", "18", "09", "11", "19"]
hasSonAndRbrother = ["80", "88", "81", "90", "98", "89", "91", "99"]
onlyRBrother = ["c0", "c8", "c1", "d0", "d8", "c9", "d1", "d9"]
lastNode = ["40", "48", "41", "50", "58", "49", "51", "59"]

allFlags = onlySon + hasSonAndRbrother + onlyRBrother + lastNode

def parseonlySon(list):
    node = list[0]
    flag = list[1]
    if flag in onlySon:
        if flag in ["00", "80", "c0", "40"]:  # 无其他信息

            print('无其他信息 %s' % list[2:])
            return list[2:]  # 返回一个新的list
        elif flag in ["08", "88", "c8", "48"]:  # 只有注释
            cend = list.index("00")
            if cend > 2:
                comnentList = list[2:cend]
                # 检索出注释部分list
                comStr = "".join(comnentList)
                print("node = 只有注释 %s 注释部分 ==> %s" % (node, decodeGBK(comStr)))
                return list[cend + 1:]
        elif flag in ["01", "81", "c1", "41"]:  # 只有棋盘文字 0001 ... 00[00]
            textEndIndex = list[4:].index("00")
            textList = list[4:textEndIndex]
            textS = "".join(textList)
            print("只有棋盘文字 node = %s 棋盘文字= %s" % (node, decodeGBK(textS)))
            if list[textEndIndex + 1] == "00":
                return list[textEndIndex + 2:]
            else:
                return list[textEndIndex + 1:]

        elif flag in ["10", "90", "d0", "50"]:
            # 只有标记
            print("只有标记 node = %s 标记 = %s" % (node, flag))
            return list[2:]
        elif flag in ["18", "98", "d8", "58"]:  # 有标记和注释
            endIndex = list.index("00")
            comList = list[2:endIndex]
            comStr = "".join(comList)
            print("既有标记又有注释 node = %s 注释 = %s" % (node, decodeGBK(comStr)))
            return list[endIndex + 1:]
        elif flag in ["09", "89", "c9", "49"]:  # 有注释和棋盘文字
            newList = list[5:]
            comEndIndex = newList.index("00")
            comList = newList[:comEndIndex]
            comStr = decodeGBK("".join(comList))
            newList = newList[comEndIndex + 1:]
            textEndIndex = newList.index("0000")
            text = "".join(newList[:textEndIndex])
            print("注释和棋盘文字 node= %s 注释 = %s text = %s" % (node, comStr, text))
            return newList[2:]
        elif flag in ["11", "91", "d1", "51"]:  # 有标记和棋盘文字
            textEndIndex = list.index("0000")
            text = "".join(list[4:textEndIndex])
            print("有标记和棋盘文字 text = %s" % text)
            return list[textEndIndex + 2:]
        elif flag in ["19", "99", "d9", "59"]:
            # 注释 文字 标记
            newList = list[5:]
            comEndIndex = newList.index("00")
            comStr = "".join(list[5:comEndIndex])
            textEndIndex = newList.index("0000")
            text = "".join(list[comEndIndex + 1:textEndIndex])
            print("注释文字标记 注释 = %s 文字 = %s" % (comStr, text))
            return newList[textEndIndex + 2:]
    else:
        return []


def parseNode(leftList):
    length = len(leftList)
    if length > 1:
        item = leftList[0]
        nextNode = leftList[1]
        if nextNode not in allFlags:
            # node 节点
           newList = parseonlySon(leftList)
           parseNode(newList)




def decodeGBK(hexStr):
    return hexstr.decode("hex").decode("GBK")


parseNode(result)

#
# ['ff', '52', '65', '6e', '4c', '69', '62', 'ff', '03', '00', 'ff', 'ff', 'ff', 'ff', 'ff', 'ff', 'ff', 'ff', 'ff', 'ff', '78', '00', '69', '00', '5a', '98', '08', 'd3', 'd0', 'd7', 'd3', 'd3', 'd0', 'd0', 'd6', 'b5', 'dc', 'b4', 'f8', 'b1', 'ea', 'bc', 'c7', '00', '4b', '80', '4c', '58', '08', 'd7', 'ee', 'ba', 'f3', 'd2', 'bb', 'd2', 'b6', 'b1', 'ea', 'bc', 'c7', '00', '5b', '40', '6a', 'd8', '08', 'd6', 'bb', 'd3', 'd0', 'd0', 'd6', 'b5', 'dc', 'b4', 'f8', 'b1', 'ea', 'bc', 'c7', '00', '7a', '00', '6b', 'c0', '7b', '00', '8b', '18', '08', 'd3', 'd0', 'd7', 'd3', 'ce', 'de', 'd0', 'd6', 'b5', 'dc', 'b4', 'f8', 'b1', 'ea', 'bc', 'c7', '00', '8c', '40']
# ff 52 65 6e 4c 69 62 ff 03 00 ff ff ff ff ff ff ff ff ff ff 78 00 69 00 5a 98 08 d3 d0 d7 d3 d3 d0 d0 d6 b5 dc b4 f8 b1 ea bc c7 00 4b 80 4c 58 08 d7 ee ba f3 d2 bb d2 b6 b1 ea bc c7 00 5b 40 6a d8 08 d6 bb d3 d0 d0 d6 b5 dc b4 f8 b1 ea bc c7 00 7a 00 6b c0 7b 00 8b 18 08 d3 d0 d7 d3 ce de d0 d6 b5 dc b4 f8 b1 ea bc c7 00 8c 40
'''
if nextNode in onlySon:
                # 只有儿子节点
                print("只有儿子节点")
                parseonlySon(leftList)
            elif nextNode in hasSonAndRbrother:
                # 有儿子和右兄弟
                print("有儿子和右兄弟")

            elif ((nextNode in lastNode) or (nextNode in onlyRBrother)):
                print("这是一个分支的最后叶子节点 %s 节点后一个flag %s" % (item, nextNode))
            elif nextNode in onlyRBrother:
                print("只有又兄弟")
'''