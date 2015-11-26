# anti_spam

author : wal_ice

本版本主要增加:
1. 对数字、拉丁文进行归一化处理。
2. 模型升级, 每个feature的value为当前feature的frequency根据字典中的范围进行归一化, 
    公式为:
            value(frequency) = lower + (upper - lower) * (frequency - feature.min_bound) / (feature.max_bound - feature.min_bound)
    其中:
            value(x)        : 当前样本中某个feature对应的value
            frequncy        : term在整条语句中出现的次数
            upper           : 归一化后的上限值,当前为1
            lower           : 归一化后的下限值,当前为-1
            feature.min_bound   : 归一化前的下限值,读取模型词表获得
            feature.max_bound   : 归一化前的上限值,读取模型词表获得
3. 修改COMAKE,使其符合最新的comake工具格式,并且对一键式部署最新编译环境(仅包括代码环境,不包括基础环境autoconf等)调试通过。
4. 增加配置文件信息。
5. 增加svm库代码。
6. 增加切词软连接,需要切词代码时,需要拷贝本地代码,请勿直接将切词代码直接放置到git上。
