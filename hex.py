#encoding=utf8
import sys

reload(sys)
sys.setdefaultencoding('utf8')

strn = "b0d7c6e5d7eec7bfd4da4933a3acb0d7b1d8caa4a1a30d0a0d0acab5d5bdb0d7c6e5d7dfc1cb4a35a3acbadacaa4"

hex_data = strn.decode("hex")
#print hex_data.decode("GBK")


f = open("/Users/sun/Desktop/com_flag.lib", "rb")
wFile = open("/Users/sun/Desktop/w4.txt", 'w')
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
print(result)
strToFile = " ".join(result)
wFile.write(strToFile)
wFile.write("\n\n\n")


pindex = result.index("78")
result[0:pindex] = []
print('nodes = %s' % result)

onlySon = ["00", "08", "01", "10", "18", "09", "11", "19"]
hasSonAndRbrother = ["80", "88", "81", "90", "98", "89", "91", "99"]
onlyRBrother = ["c0", "c8", "c1", "d0", "d8", "c9", "d1", "d9"]
lastNode = ["40", "48", "41", "50", "58", "49", "51", "59"]

allFlags = onlySon + hasSonAndRbrother + onlyRBrother + lastNode



def decodeGBK(hexStr):

    cm = hexStr.replace(' ', '').decode("hex").decode("GBK") #
    print("hex =%s> %s" %(hexStr,cm))
    return cm


def writeToFile(node,comment= "",text = ""):
    if len(text) > 1:
        text = decodeGBK(text)

    if len(comment) > 1:
        comment = decodeGBK(comment)

    wFile.write(node+":"+comment+":"+text)
    wFile.write("\n")

def parseonlySon(list):
    node = list[0]
    flag = list[1]
    if flag in allFlags:
        if flag in ["00", "80", "c0", "40"]:  # 无其他信息

            print('无其他信息node =  %s' % node)
            writeToFile(node)
            return list[2:]  # 返回一个新的list
        elif flag in ["08", "88", "c8", "48"]:  # 只有注释
            cend = list.index("00")
            if cend > 2:
                comnentList = list[3:cend]
                # 检索出注释部分list
                comStr = "".join(comnentList)
                writeToFile(node,comStr)
                print("node = 只有注释 %s 注释部分 ==> %s" % (node, decodeGBK(comStr)))
                return list[cend + 1:]
        elif flag in ["01", "81", "c1", "41"]:  # 只有棋盘文字 0001 ... 00[00]
            newList = list[4:]
            textEndIndex = newList.index("00")
            textList = newList[0:textEndIndex]
            text = "".join(textList)
            writeToFile(node,"",text)
            print("只有棋盘文字 node = %s 棋盘文字= %s" % (node, decodeGBK(text)))
            if newList[textEndIndex + 1] == "00":
                return newList[textEndIndex + 2:]
            else:
                return newList[textEndIndex + 1:]

        elif flag in ["10", "90", "d0", "50"]:
            # 只有标记
            writeToFile(node)
            print("只有标记 node = %s 标记 = %s" % (node, flag))
            return list[2:]
        elif flag in ["18", "98", "d8", "58"]:  # 有标记和注释
               endIndex = list.index("00")
             comList = list[3:endIndex]
             comStr = "".join(comList)
               writeToFile(node,comStr,"")
            print("既有标记又有注释 node = %s 注释 = %s" % (node, decodeGBK(comStr)))
            return list[endIndex + 1:]
        elif flag in ["09", "89", "c9", "49"]:  # 有注释和棋盘文字
            newList = list[5:]
            comEndIndex = newList.index("00")
            comList = newList[:comEndIndex]
            comStr = "".join(comList)
            newList = newList[comEndIndex + 1:]

            textEndIndex = newList.index("00")
            text = "".join(newList[:textEndIndex])
            writeToFile(node,comStr,text)
            print("注释和棋盘文字 node= %s 注释 = %s text = %s" % (node, comStr, text))
            return newList[textEndIndex+2:]
        elif flag in ["11", "91", "d1", "51"]:  # 有标记和棋盘文字
            textEndIndex = list.index("0000")
            text = "".join(list[4:textEndIndex])
            print("有标记和棋盘文字 text = %s" % text)
            writeToFile(node,"",text)
            return list[textEndIndex + 2:]
        elif flag in ["19", "99", "d9", "59"]:
            # 注释 文字 标记
            newList = list[5:]
            comEndIndex = newList.index("00")
            comStr = "".join(list[5:comEndIndex])
            textEndIndex = newList.index("0000")
            text = "".join(list[comEndIndex + 1:textEndIndex])
            writeToFile(node,comStr,text)
            print("注释文字标记 注释 = %s 文字 = %s" % (comStr, text))
            return newList[textEndIndex + 2:]
else:
    return []


def parseNode(leftList):
    length = len(leftList)
    if length > 1:
        item = leftList[0]
        nextNode = leftList[1]
        if nextNode in allFlags:
            # item 是一个node 节点
            newList = parseonlySon(leftList)
                parseNode(newList)
            else:
        print(">>>>>>>>>>> node = %s" % item)





parseNode(result)

wFile.close()

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
