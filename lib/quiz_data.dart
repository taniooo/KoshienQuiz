class Setting {
  static const int baseQuestionNum = 10;
  static const int lv5QuestionNum = 5;
  static const int maxScore = 10; //満点
  static const int lv5UnlockScore = 32; //Lv5のロック解除条件として、Lv1〜4の合計点を設定
  static const int maxAllScore = maxScore * 5;
}

class QuizData {
  // 三次元配列(クイズレベルリスト＞問題リスト＞問題内容リスト)
  static List<List> quizList = [
    [
      //Level1
      //1:問題文,2〜5:選択肢A〜D、6,正解
      ['甲子園球場の所在地は？', '大阪府', '滋賀県', '兵庫県', '和歌山県', 'C'],
      [
        '春のセンバツに出場するには、一般選考(秋季大会)、21世紀枠の他、もう一つ枠がある。それは何か？',
        'NPB推薦枠',
        '明治神宮大会枠',
        'コネ枠',
        '裏金枠',
        'B'
      ],
      [
        '甲子園の浜風とは、どの方向に吹いているか？',
        'ライトからレフト',
        'レフトからライト',
        'センターからホーム',
        'ホームからセンター',
        'A'
      ],
      [
        '応援のマナーとして、次のうち、やってはいけないのは？',
        '選手の健闘を讃えること',
        '勝利を願い、祈ること',
        '過度な拍手',
        '守備中の楽器演奏',
        'D'
      ],
      ['通例、甲子園で敗退した学校の選手は、甲子園の何を持って帰る？', '空気', '土', '埃', '出場記念キーホルダー', 'B'],
      [
        '甲子園球場は、あるプロ野球球団の本拠地でもある。どのチームの本拠地か？',
        '読売ジャイアンツ',
        'オリックスバファローズ',
        '阪神タイガース',
        '広島東洋カープ',
        'C'
      ],
      ['甲子園で行われる高校野球の大会は、いつ開催される？', '冬と夏', '春と夏', '夏と秋', '夏のみ', 'B'],
      [
        '春夏5季連続で甲子園出場した、PL学園の「KKコンビ」。一人は清原和博、もう一人は？',
        '工藤公康',
        '桑田真澄',
        '金本知憲',
        'カーネル・サンダース',
        'B'
      ],
      ['公式戦でベンチ入りが認めらていないのは？', '監督', '記録員', '選手の父兄', '選手', 'C'],
      [
        '甲子園球場の内外野のグラウンドの種類として、正しい組み合わせは次のうちどれか？',
        '内野：天然芝、外野：土',
        '内野：土、外野：天然芝',
        '内野外野ともに天然芝',
        '内野外野ともに土',
        'B'
      ],
    ],
    [
      //Level2
      //1:問題文,2〜5:選択肢A〜D、6,正解
      [
        '現在、春のセンバツで採用されている、一般選考(秋季大会)とは別にセンバツ出場枠が割り当てられる「21世紀枠」。21世紀枠に選ばれる条件として、正しくないのは？',
        '予選で良い成績を残しているがなかなか甲子園に出場できない',
        '困難条件の克服',
        '他校の模範になる',
        '高校野球連盟の発展への貢献',
        'D'
      ],
      ['現在、夏の甲子園に出場できるのは何校？', '47校', '48校', '49校', '50校', 'C'],
      [
        '現在、甲子園の春夏通算での最多本塁打の個人通算記録(13本)を持っているのは？',
        '中村奨成',
        '松井秀喜',
        '筒香嘉智',
        '清原和博',
        'D'
      ],
      [
        '甲子園は、観客席の特定のエリアに「アルプススタンド」という独自の呼称がつけられているが、'
            '下記のうち、どこに面するエリアを指すか？',
        '内野(本塁付近)',
        '内野(一、三塁付近)',
        '外野(ファウルゾーン)',
        '外野(フェアゾーン)',
        'C'
      ],
      [
        '甲子園において、次のうち、実施されないものは？',
        '開会式で、校名が書かれたプラカードを持って行進',
        '試合に勝った時に校歌斉唱',
        '試合に勝った時に校旗掲揚',
        '閉会式で、最優秀選手に対して記念碑授与',
        'D'
      ],
      [
        '第99回(2017年)全国高等学校野球選手権大会まで、春夏の甲子園の外野席の入場料はいくらであったか？'
            '(第100回(2018年)全国高等学校野球選手権大会から500円に値上げ)',
        '100円',
        '200円',
        '400円',
        '無料',
        'D'
      ],
      [
        '夏の甲子園には、基本的には各都道府県から1校ずつ出場するが、各都道府県内の'
            '高校の数に差があることから、2校出場できる都道府県が2つある。'
            '一つは東京、もう一つは？',
        '神奈川県',
        '大阪府',
        '愛知県',
        '北海道',
        'D'
      ],
      ['甲子園球場の観客収容人数は？', '約38,000人', '約43,000人', '約47,000人', '約50,000人', 'C'],
      [
        '松井秀喜の甲子園での伝説とは？',
        '5打席連続ホームラン',
        '5打席連続ツーベースヒット',
        '5打席連続敬遠',
        '5打席連続死球',
        'C'
      ],
      ['イチローの出身校といえば？', 'PL学園', '愛工大名電', '智辯和歌山', '中京大中京', 'B'],
      ['松井秀喜の出身校といえば？', '星稜', '広陵', '仙台育英', '敦賀気比', 'A'],
      ['松坂大輔の出身校といえば？', '桐光学園', '横浜', '日大三', '常総学院', 'B'],
      ['田中将大の出身校といえば？', '東北', '花巻東', '駒大苫小牧', '東海大相模', 'C'],
      ['斉藤佑樹の出身校といえば？', '早稲田実業', '横浜', '駒大苫小牧', '常総学院', 'A'],
      [
        '公式戦で使用が認めらていないバットは？',
        '竹の接合バット',
        '木製バット',
        '金属製バット(ＳＧマーク添付)',
        'カーボン製バット(ＳＧマーク添付)',
        'D'
      ],
    ],
    [
      //Level3
      //1:問題文,2〜5:選択肢A〜D、6,正解
      ['現在、春のセンバツに出場できるのは何校？', '32校', '34校', '47校', '49校', 'A'],
      ['現在、春夏通算で甲子園優勝回数が最も多いのは？', '中京大中京', '智弁和歌山', 'PL学園', '龍谷大平安', 'A'],
      ['現在、春夏通算で甲子園出場回数が最も多いのは？', '中京大中京', '智弁和歌山', 'PL学園', '龍谷大平安', 'D'],
      [
        '智辯和歌山のブラスバンドの応援で、「魔曲」と呼ばれているのは？',
        'サンドストーム',
        'ジョックロック',
        'アフリカンシンフォニー',
        '紅',
        'B'
      ],
      [
        '次のうち、松坂大輔が達成していないものは？',
        '甲子園決勝でノーヒットノーラン',
        '高校通算で公式戦44勝0敗',
        '甲子園で1試合の奪三振数22',
        '甲子園で1試合の投球数250球で完投勝利',
        'C'
      ],
      [
        '春夏いずれかの甲子園で、ノーヒットノーランを達成しているのは？',
        'ダルビッシュ有',
        '菊池雄星',
        '藤浪晋太郎',
        '安樂智大',
        'A'
      ],
      [
        '現在、春夏通算での甲子園連勝記録(20連勝)を保持しているのは？',
        'PL学園',
        '広島商業',
        '大阪桐蔭',
        '中京大中京',
        'A'
      ],
      ['春夏いずれかの甲子園で、ノーヒットノーランを達成しているのは？', '佐藤由規', '松坂大輔', '秋山拓巳', '涌井秀章', 'B'],
      ['春夏いずれかの甲子園で、ノーヒットノーランを達成しているのは？', '松井裕樹', '唐川侑己', '田中将大', '杉内俊哉', 'D'],
      ['春夏いずれかの甲子園で、ノーヒットノーランを達成しているのは？', '荒木大輔', '江川卓', '工藤公康', '桑田真澄', 'C'],
      ['松井裕樹がもつ、甲子園での連続奪三振記録は？', '9', '10', '11', '12', 'B'],
      ['筒香嘉智の出身校といえば？', '智弁和歌山', '星稜', '横浜', '履正社', 'C'],
      ['菊池雄星の出身校といえば？', '天理', '花巻東', '駒大苫小牧', '中京大中京', 'B'],
      ['松井裕樹の出身校といえば？', '広陵', '済美', '桐光学園', '東海大相模', 'C'],
      ['今宮健太の出身校といえば？', '星稜', '明豊', '中京大中京', '広陵', 'B'],
      ['奥川恭伸の出身校といえば？', '中京大中京', '作新学院', '星稜', '天理', 'C'],
      ['岡本和真の出身校といえば？', '天理', '大阪桐蔭', '明徳義塾', '智辯学園', 'D'],
      ['涌井秀章の出身校といえば？', '横浜', '前橋育英', '花巻東', '東北', 'A'],
      ['ダルビッシュ有の出身校といえば？', '花咲徳栄', '東北', '熊本工', '履正社', 'B'],
      ['杉内俊哉の出身校といえば？', '鹿児島実業', '横浜', '星稜', '八戸工大一', 'A'],
      ['小笠原慎之介の出身校といえば？', '仙台育英', '盛岡大附属', '履正社', '東海大相模', 'D'],
      ['高橋光成の出身校といえば？', '平安', '前橋育英', '広島商', '敦賀気比', 'B'],
      ['大阪桐蔭で藤浪晋太郎とバッテリーを組んでいたのは？', '梅野隆太郎', '木下拓哉', '森友哉', '清水優心', 'C'],
      ['この中で、甲子園の優勝投手でないのは？', '奥川恭伸', '小笠原慎之介', '高橋光成', '藤浪晋太郎', 'A'],
      ['この中で、甲子園の優勝投手でないのは？', '斎藤佑樹', '田中将大', '島袋洋奨', '吉田輝星', 'D'],
    ],
    [
      //Level4
      //1:問題文,2〜5:選択肢A〜D、6,正解
      [
        '第88回(2006年)全国高等学校野球選手権大会の決勝戦において、田中将大を擁する駒大苫小牧と、'
            '斉藤佑樹を擁する早稲田実業の試合は、延長15回で決着がつかず、'
            '規定により再試合となった。その引き分けた試合のスコアは？',
        '0-0',
        '1-1',
        '2-2',
        '3-3',
        'B'
      ],
      [
        '第88回(2006年)全国高等学校野球選手権大会の準々決勝、智弁和歌山対帝京の試合は、'
            '壮絶な乱打戦となった。4-8(帝京-智弁和歌山)で迎えた9回の表裏に'
            '帝京、智弁和歌山がそれぞれ大量点をとり合うが、それぞれ何点とったか？',
        '帝京：7、智弁和歌山：4x',
        '帝京：8、智弁和歌山：5x',
        '帝京：9、智弁和歌山：4',
        '帝京：10、智弁和歌山：5',
        'B'
      ],
      [
        '第89回(2007年)全国高等学校野球選手権大会の決勝戦において、佐賀北は、'
            '広陵の先発野村祐輔に7回まで0点に抑えられていた。'
            '佐賀北は、4点ビハインドの8回裏、1点を返し、尚も満塁の場面で、'
            'ホームランを放ち逆転に成功した。'
            'この満塁ホームランを放ったのは？',
        '久保貴大',
        '馬場崎俊也',
        '副島浩史',
        '市丸大介',
        'C'
      ],
      [
        '第91回(2009年)全国高等学校野球選手権大会の決勝戦、9回表2アウト(ランナーなし)の時点で、'
            '中京大中京が日本文理に対して10-4とリードしていた。日本文理はそこから打者一巡の猛攻で、'
            '10-9(ランナー一・三塁)まで追い上げるが、惜しくも一歩届かず敗れた。'
            '9回表の3アウト目はどのようなアウトだったか？',
        'センターゴロ',
        'サードライナー',
        '三振',
        '盗塁死',
        'B'
      ],
      [
        '現在、甲子園の両翼(ホームベースからスタンドまで)は何メートルあるか？',
        '95m',
        '98m',
        '102m',
        '105m',
        'A'
      ],
      ['夏の甲子園の決勝戦は、第何回戦にあたる？', '5', '6', '7', '8', 'B'],
      ['桑田真澄の甲子園の春夏通算での勝利数は？', '18', '19', '20', '21', 'C'],
      [
        '第61回(1979年)全国高等学校野球選手権大会の三回戦、箕島対星稜の試合は、'
            '9回終了時点で1-1の同点で延長となった。'
            'その後、星稜が2度勝ち越すが、いずれも裏の箕島の攻撃で、'
            '2アウトからソロホームランが飛び出し、18回についに箕島がサヨナラ勝ちを収めた。'
            '星稜、箕島がともに1点をとったイニングは、次の組み合わせのうちどれか？',
        '10回と14回',
        '11回と15回',
        '12回と16回',
        '13回と17回',
        'C'
      ],
      [
        '第19回(1933年)全国中等学校優勝野球大会の準決勝、明石中対中京商の試合は、'
            '1試合のイニング数が高校野球史上最長である。何回で決着がついたか。',
        '20イニング',
        '25イニング',
        '30イニング',
        '35イニング',
        'B'
      ],
      ['夏の甲子園の優勝旗の色は深紅。では、春のセンバツの優勝旗の色は？', '紺碧', '紫紺', '深緑', '藍色', 'B'],
      [
        '第78回(1996年)全国高等学校野球選手権大会の決勝戦、松山商対熊本工の試合は、'
            '3-3同点の10回裏熊本工の攻撃、1アウト満塁の状況から、犠牲フライになるかと思われた'
            '外野フライを、ライト矢野勝嗣がダイレクトバックホームで本塁補殺、'
            '松山商はサヨナラ負けのピンチを脱した。'
            'この試合中で出来事として、誤っているのは？',
        '9回裏2アウトランナーなしから、熊本工のソロホームランで同点',
        '11回に松山商が3点勝ち越し、そのまま勝利',
        '上述のプレーの直前、ライトの守備交代',
        '上述のプレーの直前、サードランナーに代走',
        'D'
      ],
      [
        '第80回(1998年)全国高等学校野球選手権大会の準々決勝、横浜対PL学園の試合は、'
            '横浜のエース松坂大輔が250球を投げ、延長11回と16回に横浜が2度勝ち越すも、'
            'いずれも裏の攻撃でPL学園が同点に追いつき、延長17回まで続く死闘となった。'
            'この試合の最終スコアは？',
        '横浜 5-3 PL学園',
        '横浜 7-5 PL学園',
        '横浜 9-7 PL学園',
        '横浜 11-9 PL学園',
        'C'
      ],
      [
        '第80回(1998年)全国高等学校野球選手権大会の準決勝、横浜対明徳義塾の試合は、'
            '横浜のエース松坂大輔が疲労のため先発を回避し、'
            '8回表の明徳義塾の攻撃終了時点で、6-0(明徳義塾-横浜)という展開となっていた。'
            '横浜は、8回裏に4点を返し、9回表は松坂を投入し、明徳義塾の攻撃を0に抑え、9回裏にさらに3点を奪い、'
            '逆転サヨナラ勝利を収めた。'
            'サヨナラとなった打席はどのような内容だったか？',
        'ショートへの内野安打',
        'センター前ヒット',
        'サードの送球エラー',
        'レフトへの犠牲フライ',
        'B'
      ],
      [
        '夏の甲子園で、一大会におけるチームの安打数の団体記録(100安打)を持っているのは？',
        '東海大相模',
        'PL学園',
        '中京大中京',
        '智弁和歌山',
        'D'
      ],
      ['都道府県別で、甲子園の春夏通算での優勝回数が最も多いのは？', '和歌山県', '神奈川県', '大阪府', '愛知県', 'C'],
      [
        '春の甲子園で、一大会通しての最多本塁打の団体記録(8本)を持っているのは？',
        'PL学園',
        '智辯和歌山',
        '東海大相模',
        '中京大中京',
        'A'
      ],
      [
        '夏の甲子園で、一大会通しての最多本塁打の団体記録(11本)を持っているのは？',
        'PL学園',
        '智辯和歌山',
        '東海大相模',
        '中京大中京',
        'B'
      ],
      [
        '春の甲子園で、一大会通しての最多奪三振の個人記録(60個)を持っているのは？',
        '江夏豊',
        '江川卓',
        '板東英二',
        '松井裕樹',
        'B'
      ],
      [
        '夏の甲子園で、一大会通しての最多奪三振の個人記録(83個)を持っているのは？',
        '江夏豊',
        '江川卓',
        '板東英二',
        '松井裕樹',
        'C'
      ],
      [
        '夏の甲子園で、一大会通しての最多本塁打の個人記録(6本)を持っているのは？',
        '中村奨成',
        '松井秀喜',
        '筒香嘉智',
        '清原和博',
        'A'
      ],
      [
        '夏の甲子園で、一試合での最多本塁打の個人記録(3本)を清原和博と並んで持っているのは？',
        '中村奨成',
        '松井秀喜',
        '筒香嘉智',
        '平田良介',
        'D'
      ],
      [
        '夏の甲子園で、一試合での最多打点の個人記録(8点)を須田努と並んで持っているのは？',
        '中村奨成',
        '松井秀喜',
        '筒香嘉智',
        '清原和博',
        'C'
      ],
      [
        '甲子園春夏連覇(同一年の春夏優勝に限る)を唯一複数回達成しているのは？',
        'PL学園',
        '横浜',
        '中京大中京',
        '大阪桐蔭',
        'D'
      ],
      ['次のうち、春2連覇を達成していないのは？', 'PL学園', '第一神港商', '大阪桐蔭', '中京大中京', 'D'],
      ['次のうち、夏3連覇を唯一達成しているのは？', 'PL学園', '広島商業', '大阪桐蔭', '中京大中京', 'D'],
      ['第1回(1915年)全国高等学校野球選手権大会の優勝校は？', '京都二中', '慶応普通', '愛知一中', '神戸一中', 'A'],
      ['第50回(1968年)全国高等学校野球選手権大会の優勝校は？', '習志野', '興国', '松山商', '東海大相模', 'B'],
      ['第100回(2018年)全国高等学校野球選手権大会の優勝校は？', '履正社', '金足農業', '大阪桐蔭', '花咲徳栄', 'C'],
    ],
    [
      //Level5
      //1:問題文,2〜5:選択肢A〜D、6,正解
      [
        '第4回(1918年)全国高等学校野球選手権大会は、唯一、戦争または新型コロナウイルス感染症の流行以外の理由で中止になっている。その中止となった理由とは何か？',
        '大地震',
        '大型台風による球場設備使用不可',
        '運営資金の不足',
        '米騒動',
        'D'
      ],
      ['夏の甲子園では、シード校は何校ある？', '1', '8', '11', '15', 'D'],
      ['甲子園球場(当時：甲子園大運動場)は、何年に完成したか？', '1894年', '1924年', '1944年', '1964年', 'B'],
      [
        '「甲子園」の名前の由来は？',
        '完成した年の十干、十二支にちなんで',
        '「六甲山」の地名にちなんで',
        '「亀は万年」の縁起をかついで',
        '正々堂々、「甲(かぶと)」を緒を締めて戦う場所という意味を込めて',
        'A'
      ],
      [
        '夏の甲子園で、沖縄勢として初めて優勝した高校とその年は？',
        '興南(1999年)',
        '沖縄尚学(1999年)',
        '興南(2010年)',
        '沖縄尚学(2010年)',
        'C'
      ],
      [
        '夏の甲子園で、北海道勢として初めて優勝した高校とその年は？',
        '北海(1994年)',
        '駒大苫小牧(1994年)',
        '北海(2004年)',
        '駒大苫小牧(2004年)',
        'D'
      ],
      ['次のうち、夏の甲子園で一度も優勝のない都道府県は？', '三重県', '鹿児島県', '山口県', '静岡県', 'B'],
      ['次のうち、夏の甲子園で最も準優勝回数が多い都道府県は？', '京都府', '大阪府', '和歌山県', '広島県', 'A'],
      [
        '夏の甲子園の優勝校のうち、「東」と名のつく高校は何校あるか？'
            '(同一校による複数回優勝がある場合、重複してカウントはしない)',
        '2',
        '3',
        '4',
        '5',
        'B'
      ], //松山東、東海大相模、東洋大姫路
      ['47都道府県の中で、夏の大会で初勝利をあげたのが最も遅かったのは？', '滋賀', '島根', '福井', '青森', 'A'],
      [
        '東北6県(青森県、岩手県、宮城県、秋田県、山形県、福島県)は、いずれも春夏ともに優勝経験がない。では、東北6県の春夏通算の準優勝回数は何回か？',
        '9',
        '10',
        '11',
        '12',
        'D'
      ],
      [
        '春夏通算での甲子園での都道府県別の勝利数を多い順に並べたとき、正しい順番は次のうちどれか？',
        '大阪、東京、愛知、兵庫',
        '大阪、愛知、兵庫、東京',
        '大阪、愛知、東京、兵庫',
        '大阪、兵庫、東京、愛知',
        'D'
      ],
      [
        '夏の甲子園で2連覇を達成した高校のうち、一部を時系列順に並べたとき、正しい順番は次のうちどれか？',
        '広島商、海藻中(向陽)、小倉中(小倉)',
        '海藻中(向陽)、広島商、小倉中(小倉)',
        '広島商、小倉中(小倉)、海藻中(向陽)',
        '小倉中(小倉)、広島商、海藻中(向陽)',
        'A'
      ],
      ['春の甲子園で優勝していない都道府県は、次のうちどれか？', '千葉', '奈良', '大分', '福井', 'A'],
    ],
  ];
}
