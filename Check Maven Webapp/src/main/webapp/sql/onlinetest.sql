/*
Navicat MySQL Data Transfer

Source Server         : 测试
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : onlinetest

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2018-04-13 13:28:59
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `courseid` int(5) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(20) NOT NULL,
  `coursestate` varchar(2) NOT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '语文', '0');
INSERT INTO `t_course` VALUES ('2', '数学', '0');
INSERT INTO `t_course` VALUES ('3', '英语', '0');

-- ----------------------------
-- Table structure for `t_errorbook`
-- ----------------------------
DROP TABLE IF EXISTS `t_errorbook`;
CREATE TABLE `t_errorbook` (
  `bookid` int(10) NOT NULL AUTO_INCREMENT,
  `userid` varchar(40) NOT NULL,
  `courseid` varchar(40) NOT NULL,
  `gradeid` varchar(40) NOT NULL,
  `uanswer` varchar(400) NOT NULL,
  `questionid` varchar(40) NOT NULL,
  `typeid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_errorbook
-- ----------------------------
INSERT INTO `t_errorbook` VALUES ('1', 'zhangsan', '1', '3', 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES ('2', 'zhangsan', '1', '3', 'A', '29', '1');
INSERT INTO `t_errorbook` VALUES ('3', 'zhangsan', '1', '3', 'A', '30', '1');
INSERT INTO `t_errorbook` VALUES ('4', 'zhangsan', '1', '3', 'A', '34', '1');
INSERT INTO `t_errorbook` VALUES ('5', 'zhangsan', '1', '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES ('6', 'zhangsan', '1', '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES ('7', 'zhangsan', '1', '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES ('8', 'zhangsan', '1', '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES ('9', 'zhangsan', '1', '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES ('10', 'zhangsan', '1', '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES ('11', 'zhangsan', '1', '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES ('12', 'zhangsan', '1', '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES ('13', 'zhangsan', '1', '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES ('14', 'zhangsan', '1', '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES ('15', 'zhangsan', '1', '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES ('16', 'zhangsan', '1', '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES ('17', 'zhaowen', '1', '3', 'A', '1', '1');

-- ----------------------------
-- Table structure for `t_grade`
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `gradeid` int(5) NOT NULL AUTO_INCREMENT,
  `gradename` varchar(20) NOT NULL,
  `courseid` varchar(40) NOT NULL,
  PRIMARY KEY (`gradeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('1', '高一', '1,2,3');
INSERT INTO `t_grade` VALUES ('2', '高二', '1,2,3');
INSERT INTO `t_grade` VALUES ('3', '高三', '1,2,3');

-- ----------------------------
-- Table structure for `t_paper`
-- ----------------------------
DROP TABLE IF EXISTS `t_paper`;
CREATE TABLE `t_paper` (
  `paperid` varchar(20) NOT NULL,
  `papername` varchar(40) NOT NULL,
  `courseid` varchar(40) NOT NULL,
  `gradeid` varchar(40) NOT NULL,
  `userid` varchar(40) DEFAULT NULL,
  `questionid` varchar(200) NOT NULL,
  `begintime` varchar(20) DEFAULT NULL,
  `endtime` varchar(20) DEFAULT NULL,
  `allowtime` varchar(20) NOT NULL,
  `score` varchar(5) DEFAULT NULL,
  `paperstate` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_paper
-- ----------------------------
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', null, '2,3,1', null, null, '120', null, '0');
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', 'zhangsan', '2,3,1', '2017-03-26 23:22:36', '2017-03-26 23:22:36', '120', '5', '2');
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', null, '29,28,30,22,34,9,10,17,18,14', null, null, '120', null, '0');
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', 'zhangsan', '29,28,30,22,34,9,10,17,18,14', '2017-03-27 21:45:23', '2017-03-27 21:45:30', '120', '10', '2');
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', null, '2,24,32,21,22,7,4,19,17,15', null, null, '120', null, '0');
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', null, '1,23,3,26,27,11,5,13,9,8', null, null, '120', null, '0');
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', 'zhangsan', '2,24,32,21,22,7,4,19,17,15', '2017-03-28 09:09:26', '2017-03-28 09:09:33', '120', '15', '2');
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', 'zhangsan', '1,23,3,26,27,11,5,13,9,8', null, null, '120', null, '1');
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', null, '3,33,27,26,32,12,9,19,10,18', null, null, '120', null, '0');
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', 'zhangsan', '3,33,27,26,32,12,9,19,10,18', null, null, '120', null, '1');
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', 'zhaowen', '2,3,1', '2017-03-28 09:18:23', '2017-03-28 09:18:24', '120', '10', '2');
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', 'zhaowen', '29,28,30,22,34,9,10,17,18,14', null, null, '120', null, '1');
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', 'zhaowen', '2,24,32,21,22,7,4,19,17,15', null, null, '120', null, '1');
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', 'zhaowen', '1,23,3,26,27,11,5,13,9,8', null, null, '120', null, '1');
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', 'zhaowen', '3,33,27,26,32,12,9,19,10,18', null, null, '120', null, '1');
INSERT INTO `t_paper` VALUES ('sj006', '高三语文测试', '1', '3', null, '32,27,22,20,29,17,12,13,9,15', null, null, '120', null, '0');
INSERT INTO `t_paper` VALUES ('sj006', '高三语文测试', '1', '3', 'zhangsan', '32,27,22,20,29,17,12,13,9,15', null, null, '120', null, '1');

-- ----------------------------
-- Table structure for `t_question`
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `questionid` int(10) NOT NULL AUTO_INCREMENT,
  `quesname` varchar(500) NOT NULL,
  `optiona` varchar(100) DEFAULT NULL,
  `optionb` varchar(100) DEFAULT NULL,
  `optionc` varchar(100) DEFAULT NULL,
  `optiond` varchar(100) DEFAULT NULL,
  `answer` varchar(500) NOT NULL,
  `answerdetail` varchar(200) DEFAULT NULL,
  `useranswer` varchar(500) DEFAULT NULL,
  `courseid` varchar(20) NOT NULL,
  `typeid` varchar(20) NOT NULL,
  `difficulty` int(2) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `gradeid` varchar(20) NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '下列词语中加点字的读音，全部正确的一项是（）', 'A．暂时zàn    埋怨mái    谆谆告诫zhūn   引吭高歌háng', 'B．豆豉chǐ    踝骨huái    踉踉跄跄cāng   按图索骥jì', 'C．梗概gěn    删改shān    炊烟袅袅niǎo  明眸皓齿móu', 'D．搁浅gē     解剖pōu     鬼鬼祟祟suì   不屑一顾xiè', 'D', 'A．埋 mán， B．跄 qiàng C.梗gěng', null, '1', '1', '0', '本题考察的都是基础字音，没有出现偏难怪的字音', '3');
INSERT INTO `t_question` VALUES ('2', '下列词语中，没有错别字的一项是（）', 'A．妨碍    功夫片    钟灵毓秀   管中窥豹，可见一斑', 'B．梳妆    吊胃口    瞠目结舌   文武之道，一张一驰', 'C．辐射    入场券    循章摘句   风声鹤唳，草木皆兵', 'D．蜚然    直辖市    秘而不宣   城门失火，殃及池鱼', 'A', 'B.文武之道，一张一弛；C.寻章摘句；D.斐然', null, '1', '1', '0', '本题考察的都是高考高频字形。', '3');
INSERT INTO `t_question` VALUES ('3', '下列各句中加点词语的使用，不恰当的一项是（）', 'A．“2015年度中国文化跨界论坛”日前在北京举行，届时来自世界各国的艺术家、企业家和媒体人围绕当前文化创意产业发展中的热点进行了交流。', 'B．对于那些熟稔互联网的人来说，进行“互联网+”创业，最难的可能并不是“互联网”这一部分，而是“+”什么以及怎么“+”的问题。 ', 'C．这家民用小型无人机公司一年前还寂寂无闻，一年后却声名鹊起，其系列产品先后被评为“十大科技产品“2014年杰出高科技产品”。', 'D．近年来，广袤蜀地的新村建设全面推进，大巴山区漂亮民居星罗棋雍，大凉山上彝家    新寨鳞次栉比，西部高原羌寨碉楼拔地而起。', 'A', '届时是“到时候”的意思，而本句所叙述的是已经发生了的事实。', null, '1', '1', '0', '本题考察的是词语和成语运用。都是考纲内的高频词语辨析和成语分析，难度不大。', '3');
INSERT INTO `t_question` VALUES ('4', '吾视其辙乱，_________________，故逐之。（《曹刿论战》）', null, null, null, null, '望其旗靡', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('5', '明明如月，_________________?（曹操《短歌行》）', null, null, null, null, '何时可掇', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('6', '闾阎扑地，_________________，舸舰弥津，青雀黄龙之舳。（王勃《滕王阁序》）', null, null, null, null, '钟鸣鼎食之家', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('7', '万里悲秋常作客，_________________。（杜甫《登高》）', null, null, null, null, '百年多病独登台', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('8', '_________________ ，铁骑突出刀枪鸣。（白居易《琵琶行》）', null, null, null, null, '银瓶乍破水浆迸', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('9', '予谓菊，_________________；牡丹，花之富贵者也。（周敦颐《爱莲说》）', null, null, null, null, '花之隐逸者也', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('10', '持节云中，_________________？（苏轼《江城子·密州出猎》）', null, null, null, null, '何日遣冯唐', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('11', '_________________，瑞脑销金兽。（李清照《醉花阴》）', null, null, null, null, '薄雾浓云愁永昼', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('12', '人不知而不愠，              ？（《论语》）', null, null, null, null, '不亦君子乎', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('13', '君子博学而日参省乎己,_________________。（《荀子·劝学》）', null, null, null, null, '则知明而行无过矣', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('14', '涉江采芙蓉，_________________。（《古诗十九首》）', null, null, null, null, '兰泽多芳草', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('15', '母、孙二人，更相为命，_________________。（李密《陈情表》）', null, null, null, null, '是以区区不能废远', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('16', '三径就荒，_________________。（陶渊明《归去来兮辞》）', null, null, null, null, '松菊犹存', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('17', '岩扉松径长寂寥，_________________。（孟浩然《夜归鹿门歌》）', null, null, null, null, '惟有幽人自来去', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('18', '群山万壑赴荆门，_________________。（杜甫《咏怀古迹》）', null, null, null, null, '生长明妃尚有村', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('19', '遥岑远目，献愁供恨，_________________。（辛弃疾《水龙吟·登建康赏心亭》）', null, null, null, null, '玉簪螺髻', null, null, '1', '4', '0', null, '3');
INSERT INTO `t_question` VALUES ('20', '下列词语中加点的字，读音全都正确的一组是（ ）', 'A. 场(chǎng)所    逮(dài)捕    疾风劲(jìng)草', 'B. 应(yìng)届     贿赂(lù)     飒(sà)爽英姿', 'C. 功绩(jì)       星宿(sù)     揆情度(duó)理', 'D. 谈吐(tù)       麇(qún)集    短小精悍(hàn)', 'A', 'B项“应”C项“宿”D项“吐”', null, '1', '1', '0', null, '3');
INSERT INTO `t_question` VALUES ('21', '下列词语书写没有错别字的一项是（ ）', 'A．首屈一指    毛骨耸然    义愤填膺    劳动锻练', 'B．励行节约    一枕黄梁    妄费心机    通宵达旦', 'C．堰苗助长    结局园满    不可思议    一劳永逸', 'D.   记忆犹新    乔装打扮    顷刻之间    罄竹难书', 'D', 'A项“耸”应为“悚”，“练”应为“炼”B项“励”应为“厉”“梁”应为“粱”“妄”为“枉”；C项“堰”应为“揠”“园”应为“圆”', null, '1', '1', '0', null, '3');
INSERT INTO `t_question` VALUES ('22', '下列各句中没有语病的一句是（ ）', 'A．上海文艺出版社出版的《生存》，出自一位蛰居海外二十多年的加拿大籍华裔之手。', 'B．孔繁森的名字已家喻户晓，对大家都不陌生。', 'C.   日子长了，老王一家对他们的感情越来越深厚，就像自己家里人一样。', 'D．无论老师和学生，毫无例外，都必须遵守学校的规章制度。', 'A', 'B“对大家”后加“来说”；C句不明确，“就像”前加“待他们”；D“无论”与“和”不搭配，“和”应为“或”。', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('23', '下列词语中加点的字，读音全都正确的一组是（ ）', 'A. 扼(é)要     游弋(yì)     风驰电掣(chè)', 'B. 娱(yú)乐    伺(cì)候     强(qiáng)人所难', 'C. 蓓蕾(lěi)   犒(kào)赏    锲(qiè)而不舍', 'D. 讹(é)诈     口供(gōng)   行若狗彘(zhì)', 'C', 'A项“扼”B项“强”D项“供”', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('24', '下列词语没有错别字的一项是（ ）', 'A. 真知灼见    高瞻远瞩    怨天忧人    鼓噪而进', 'B. 雅俗共赏    招摇撞骗    喧宾夺主    杀一敬百', 'C. 到处传诵    梳装打扮    心劳日拙    计划缜密', 'D. 改弦更张    当仁不让    恶意诅咒    墨守成规', 'D', 'A项“忧”应为“尤”B项“敬”应为“儆”或“警”C项“装”应为“妆”', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('25', '下列词语中加点的字，读音全都正确的一组是（ ）', 'A. 哺(pǔ)育      对峙(zhì)     面面相觑(qù)', 'B. 模(mú)样      歼(qiān)灭    广袤(mào)无垠', 'C．场(cháng)院   拓(tuò)片     一暴(pù)十寒', 'D. 答(dā)应      症(zhēng)结   惝(tǎng)恍迷离', 'D', 'A项“哺”B项“歼”C项“拓”1', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('26', '下列词语没有错别字的一项是（ ）', 'A．毕躬毕敬    按部就班    防患未然    雷霆万钧', 'B．不记其数    发奋图强    和盘托出    恍然大悟', 'C．荒谬绝伦    琅琅上口    滥竽充数    死心塌地', 'D. 故弄悬虚    东拼西凑    哄堂大笑    破釜沉舟', 'C', 'A项“躬”应为“恭”B项“记”应为“计”D项“悬”应为“玄”', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('27', '下列各句，没有语病、句意明确的一句是（ ）', 'A. 中国人民自从接受了马克思主义之后，中国的革命就在毛泽东同志的领导下从胜利走向胜利。', 'B．我们要改革和完善符合科学技术发展客观规律的、与社会主义市场经济相适应的、科技同经济有机结合相互促进的科技新体制。', 'C. 乍得总统哈布雷十四日说，乍得政府希望与利比亚谈判，以寻求解决两国间的矛盾。', 'D. 我们历来主张向外国先进的科学文化学习和借鉴，而且已经这样做了；但我们也历来反对盲目照搬外国，全盘西化，事实证明，那样做是极端错误的。', 'D', 'A“自从”应放在“中国人民”前面；B去掉“改革和”；C“寻求”缺少宾语，应改为“以寻求解决两国间矛盾的办法”。', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('28', '下列各组词语中加点的字的读音，与所给注音全都相同的一组是（ ）', 'A．号háo      号叫    号丧    号哭    号淘大哭', 'B．强qiáng    强制    强迫    强化    强词夺理', 'C．贴tiè      字贴    碑贴    面贴    俯首贴耳', 'D．累lěi      累计    连累    累赘    危若累卵', 'A', 'B项“强词夺理”的“强”C项“俯首贴耳”的“贴”D项“累赘”的“累”', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('29', '下列词语没有错别字的一项是（ ）', 'A．名不副实    礼上往来    呕心沥血    如愿以偿', 'B．淋漓尽致    麻木不仁    络绎不绝    明察秋毫', 'C.  流离迁徙    奴颜婢膝    气息奄奄    迫不急待', 'D.  轻歌曼舞    凭白无故    前仆后继    盛气凌人', 'B', 'A项“上”应为“尚”C项“急”应为“及”D项“凭”应为“平”', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('30', '下列各句，没有语病，句意明确的一句是（ ）', 'A．现在，许多青年男女不再以财产多寡和门第高低为条件，而以能劳动，有科学文化知识为标准去选择自己的伴侣。', 'B．这个村今年水稻获得了大丰收，不但向国家交售了六万斤谷子，而且不吃国家的供应粮了。', 'C.   厂长采纳了两个工人的合理化建议，这大大激发了全厂职工出谋献策的积极性。', 'D．鉴于动物有上述特点，我们可以预测，随着信息时代的到来，科学技术的不断发展，在未来的战争舞台上，将有越来越多的“动物兵”出现。', 'D', 'A“能劳动”“有科学文化知识”前分别加“是否”；B应改为“不但不吃国家的供应粮了，而且向国家交售了六万斤谷子”；C“两个”有歧义，可改为“两名工人的合理化建议”或“工人的两个合理化建议”。', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('31', '下列各组词语中加点的字的读音，与所给注音全都相同的一组是（ ）', 'A．角jiǎo    号角    角落    头角    群雄角逐', 'B．笼lóng    笼子    牢笼    笼屉    烟笼雾锁', 'C．量liáng   思量    打量    测量    量体裁衣', 'D．削xuē     剥削    削减    瘦削    日削月割', 'D', 'A项“群雄角逐”的“角”B项“烟笼雾锁”的“笼”C项“量体裁衣”的“量”', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('32', '下列词语没有错别字的一项是（ ）', 'A．和蔼可亲    并行不悖    举一反三    唉声叹气', 'B．撤消处分    柳暗花明    中西合璧    称心如意', 'C．黯然销魂    原型毕露    惨无人道    计日程功', 'D．原物必还    为虎作伥    扬常而去    一张一驰', 'A', 'B项“消”应为“销”C项“型”应为“形”D项“必”应为“毕”', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('33', '下列句子中，成语使用正确的一句是（ ）', 'A．听到我校运动队在全市中学生运动会上夺得团体总分第一名的消息，一向不苟言笑的刘校长也显得非常兴奋，在操场上手舞足蹈地同老师们谈着、笑着。', 'B．洪水冲垮了李老汉的房子，全村人都很难过，村前村后，哀鸿遍野。', 'C.   突然，一个影子如白驹过隙一般一闪而过，快捷异常。', 'D．第一次试验失败了，王工程师抱恨终天，直到深夜心里还很难过。', 'A', 'B项比喻流离失所的灾民；C项形容时间过得快，与句意不符；D项是指恨一辈子，与句意不符。', null, '1', '1', '1', null, '3');
INSERT INTO `t_question` VALUES ('34', '下列各句没有语病，语意明确的一句是（ ）', 'A．加强对全民环保意识的教育，是当前非常至关重要的问题。', 'B．张义和王强上课说话，被老师叫到办公室去了。', 'C．选修课的开设，使同学们的志趣和特长得到了充分的发挥。', 'D．教育优先发展的战略地位，在《教育法》颁布后，得到了进一步落实。', 'D', 'A“非常”与“至关”重复；B项有歧义；C项“志趣”与“发挥”不搭配。', null, '1', '1', '1', null, '3');

-- ----------------------------
-- Table structure for `t_resources`
-- ----------------------------
DROP TABLE IF EXISTS `t_resources`;
CREATE TABLE `t_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键（自增）',
  `name` varchar(20) NOT NULL COMMENT '物品名称',
  `price` double(7,2) DEFAULT NULL COMMENT '物品单价',
  `number` int(5) DEFAULT '0' COMMENT '物品数量',
  `description` varchar(100) DEFAULT '' COMMENT '物品的详细描述',
  `state` int(1) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL COMMENT '所属类别编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='物品表';

-- ----------------------------
-- Records of t_resources
-- ----------------------------
INSERT INTO `t_resources` VALUES ('1', '桌子', '200.00', '4', '呵呵呵呵呵呵呵', null, '1');
INSERT INTO `t_resources` VALUES ('4', 'ipad', '1000.00', '1', 'jisidsaidiadia', null, '2');
INSERT INTO `t_resources` VALUES ('6', '椅子', '300.00', '3', 'jisidsaidiadia', null, '1');
INSERT INTO `t_resources` VALUES ('7', 'cdcdc', '123.00', '11', '1111', null, '1');
INSERT INTO `t_resources` VALUES ('8', 'dedede', '123.00', '121', '1212121', null, '1');

-- ----------------------------
-- Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `typeid` int(5) NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) NOT NULL,
  `score` int(5) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('1', '单选题', '5', '只能选择一个');
INSERT INTO `t_type` VALUES ('2', '多选题', '5', '下列选项中，至少有两个是正确的');
INSERT INTO `t_type` VALUES ('3', '判断题', '5', '请判断对错');
INSERT INTO `t_type` VALUES ('4', '填空题', '5', 'cs');
INSERT INTO `t_type` VALUES ('5', '简答题', '5', '');
INSERT INTO `t_type` VALUES ('6', '操作题', '5', '功能暂未实现');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` varchar(40) NOT NULL,
  `username` varchar(20) NOT NULL,
  `userpwd` varchar(40) NOT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `usertype` int(2) NOT NULL,
  `userstate` int(2) NOT NULL,
  `email` varchar(40) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('admin', '系统管理员', 'e10adc3949ba59abbe56e057f20f883e', null, '2', '0', 'admin@163.com', '123456', '师大教师公寓', '');
INSERT INTO `t_user` VALUES ('ceyi', '侧翼', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '0', 'ceyi@163.com', '123456', '123456', 'cs');
INSERT INTO `t_user` VALUES ('hy', '弘毅', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '0', 'hy@163.com', '123456', '123456', '123456');
INSERT INTO `t_user` VALUES ('jj', '娟娟', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '0', 'jj@163.com', '123456', '123456', '测试');
INSERT INTO `t_user` VALUES ('jl', '杰龙', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '0', 'jl@163.com', '123456', '123456', '123456');
INSERT INTO `t_user` VALUES ('kk', '可可', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '1', 'kk@163.com', '123456', '123456', '123456');
INSERT INTO `t_user` VALUES ('zhangsan', '张三', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '1', 'zhangsan@163.com', '123456', '师大教师公寓', null);
INSERT INTO `t_user` VALUES ('zhaosi', '赵四', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '2', 'zhaosi@163.com', '123456', '111', '11');
INSERT INTO `t_user` VALUES ('zhaowen', '赵雯', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '1', 'zhaowen@163.com', '123456', '12', '111');
