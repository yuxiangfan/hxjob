<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% pageContext.setAttribute("path", request.getContextPath());%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>【工商银行招聘信息】-贝睿</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link href="${path}/resources/pcH5Plus/css/base.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/pcH5Plus/js/jquery-2.1.1.min.js"></script>
    <link href="${path}/resources/pcH5Plus/css/recruit.css" rel="stylesheet" type="text/css">
    <link href="${path}/resources/pcH5Plus/css/index.css" rel="stylesheet" type="text/css">
    <script src="${path}/resources/layui/layui.js"></script>

<body class="bg_f5f">

<!--头部文件-->
<!--头部-->
<div class="head">
    <div class="head_container">
        <div class="top">
            <img class="logo_br" src="${path}/resources/pcH5Plus/images/logo_br.png">
            &nbsp;&nbsp
            <a class="a_login" href="${path}/hm/login">登入</a>
        </div>
        <form>
            <div class="serch br_dflex input">
                <div class="br_flex">
                    <input type="search" placeholder="搜公司、找职位" class="key">
                </div>
                <div class="serch_btn input_btn"><input name="btn" class="btn" id='search'></div>
            </div>
        </form>
        <div class="tab br_dflex">
            <div class="tit br_flex"><a href="${path}/h5views/index"><i class="a1 "></i><span>首页</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/pos"><i class="a2 cur"></i><span>招聘信息</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/org"><i class="a3"></i><span>机构点评</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/selector"><i class="a4"></i><span>校园杂志</span></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/character"><i class="a5"></i><span>智能职测</span><i class="on"></i></a></div>
            <div class="tit br_flex"><a href="${path}/h5views/calendar"><i class="a6"></i><span>考试日历</span></a></div>
        </div>
    </div>
</div>


<div class="content-wrap">
    <section class="review_box recruit_box kz_m_b_20">

        <div class="box_a">
            <div class="bd ">
                <div class="every_see P_index5">
                    <h2 style="text-align: center">贝睿性格测试</h2>
                    <p>这是一份来自专业金融职前培训机构贝睿的一份基于性格色彩学的测试,它有助于测试者深入了解自己深层次性格,从而帮助自己得到更好的职业定位.</p>
                    <br>
                    <p>[本测试共30道题目,请您根据第一感觉作答,现在就开始吧]</p>
                    <br>
                    <div class="test_con_btn">
                        <p>1.当我们还是孩子的时候,我:</p>
                        <form action="">
                            <input type="radio" id="item_1_1" name="item_1" value="更喜欢和熟悉的伙伴玩耍">更喜欢和熟悉的伙伴玩耍 <br>
                            <input type="radio" id="item_1_2" name="item_1" value="是孩子王，大家经常听我的决定">是孩子王，大家经常听我的决定<br>
                            <input type="radio" id="item_1_3" name="item_1" value="羞于见生人，会有意识地回避">羞于见生人，会有意识地回避<br>
                            <input type="radio" id="item_1_4" name="item_1" value="乐观积极、调皮可爱">乐观积极、调皮可爱<br>
                        </form>
                        <br>
                        <p>2. 如果我是父母，也许我是：</p>
                        <form action="">
                            <input type="radio" id="item_2_1" name="item_2" value="对孩子宽容、可以听得进去孩子的意见和建议">对孩子宽容、可以听得进去孩子的意见和建议 <br>
                            <input type="radio" id="item_2_2" name="item_2" value="在孩子面前保持威严，说一不二">在孩子面前保持威严，说一不二<br>
                            <input type="radio" id="item_2_3" name="item_2" value="会对孩子有要求，同时会坚持自己的想法">会对孩子有要求，同时会坚持自己的想法<br>
                            <input type="radio" id="item_2_4" name="item_2" value="像个大孩子一样，融入到孩子中去">像个大孩子一样，融入到孩子中去<br>
                        </form>
                        <br>
                        <p>3. 面对他人对自己的赞美:</p>
                        <form action="">
                            <input type="radio" id="item_3_1" name="item_3" value="更喜欢和熟悉的伙伴玩耍">更喜欢和熟悉的伙伴玩耍 <br>
                            <input type="radio" id="item_3_2" name="item_3" value="更喜欢和熟悉的伙伴玩耍">更喜欢和熟悉的伙伴玩耍<br>
                            <input type="radio" id="item_3_3" name="item_3" value="更喜欢和熟悉的伙伴玩耍">更喜欢和熟悉的伙伴玩耍<br>
                            <input type="radio" id="item_3_4" name="item_3" value="更喜欢和熟悉的伙伴玩耍">更喜欢和熟悉的伙伴玩耍<br>
                        </form>
                        <br>
                        <p>4. 在帮助他人的问题上，我的内心想法是：</p>
                        <form action="">
                            <input type="radio" id="item_4_1" name="item_4" value="无所谓，不会因为别人赞美而有情绪波动">无所谓，不会因为别人赞美而有情绪波动 <br>
                            <input type="radio" id="item_4_2" name="item_4" value="我更在乎对方是否欣赏我的能力，不需要无关痛痒的赞美">我更在乎对方是否欣赏我的能力，不需要无关痛痒的赞美<br>
                            <input type="radio" id="item_4_3" name="item_4" value="怀疑赞美是否出自真心，或者会刻意逃避众人的注意">怀疑赞美是否出自真心，或者会刻意逃避众人的注意<br>
                            <input type="radio" id="item_4_4" name="item_4" value="很开心，溢美之词让人感到愉悦">很开心，溢美之词让人感到愉悦<br>
                        </form>
                        <br>
                        <p>5 . 对于规则，我内心的态度是：</p>
                        <form action="">
                            <input type="radio" id="item_5_1" name="item_5" value="不愿违反规则，但可能因为松散而无法达到规则的要求">不愿违反规则，但可能因为松散而无法达到规则的要求 <br>
                            <input type="radio" id="item_5_2" name="item_5" value="倾向打破规则，希望由自己来制定规则而不是遵守规则">倾向打破规则，希望由自己来制定规则而不是遵守规则<br>
                            <input type="radio" id="item_5_3" name="item_5" value="严格遵守规则，并且竭尽全力做到规则内的最好">严格遵守规则，并且竭尽全力做到规则内的最好<br>
                            <input type="radio" id="item_5_4" name="item_5" value="不喜欢被规则约束，不按规则出牌会觉得新鲜有趣">不喜欢被规则约束，不按规则出牌会觉得新鲜有趣<br>
                        </form>
                        <br>
                        <p>6. 面对生活，我更像 ：</p>
                        <form action="">
                            <input type="radio" id="item_6_1" name="item_6" value="平和派：我自己觉得不错就可以，不用考虑外面的世界如何">平和派：我自己觉得不错就可以，不用考虑外面的世界如何 <br>
                            <input type="radio" id="item_6_2" name="item_6" value="上进派：不进则退，必须保持进步">上进派：不进则退，必须保持进步<br>
                            <input type="radio" id="item_6_3" name="item_6" value="小心翼翼派：未雨绸缪，最好在问题未发生之前想好所有可能 ">小心翼翼派：未雨绸缪，最好在问题未发生之前想好所有可能<br>
                            <input type="radio" id="item_6_4" name="item_6" value="乐天派：活在当下、过好每一天最重要">乐天派：活在当下、过好每一天最重要<br>
                        </form>
                        <br>
                        <p>7. 我认为自己在行为上的基本特点是：</p>
                        <form action="">
                            <input type="radio" id="item_7_1" name="item_7" value="慢条斯理，按部就班，能与周围的人协调一致">慢条斯理，按部就班，能与周围的人协调一致<br>
                            <input type="radio" id="item_7_2" name="item_7" value="目标明确，集中精力，为实现目标而努力，善于抓住核心要点">目标明确，集中精力，为实现目标而努力，善于抓住核心要点<br>
                            <input type="radio" id="item_7_3" name="item_7" value="慎重小心，为做好预防及善后，会不惜一切而尽心操劳 ">慎重小心，为做好预防及善后，会不惜一切而尽心操劳<br>
                            <input type="radio" id="item_7_4" name="item_7" value="丰富跃动，不喜欢制度和约束，倾向于快速反应">丰富跃动，不喜欢制度和约束，倾向于快速反应<br>
                        </form>
                        <br>
                        <p>8. 当我做错事时，我倾向于：</p>
                        <form action="">
                            <input type="radio" id="item_8_1" name="item_8" value="害怕，但表面不露声色">害怕，但表面不露声色 <br>
                            <input type="radio" id="item_8_2" name="item_8" value="内心已经明白是自己的问题，但总是不愿承认、总是辩驳">内心已经明白是自己的问题，但总是不愿承认、总是辩驳<br>
                            <input type="radio" id="item_8_3" name="item_8" value="很长时间内都会感到愧疚、痛苦、压抑 ">很长时间内都会感到愧疚、痛苦、压抑<br>
                            <input type="radio" id="item_8_4" name="item_8" value="希望逃避批评，感到十分难为情">希望逃避批评，感到十分难为情<br>
                        </form>
                        <br>
                        <p>9. 当结束一段刻骨铭心的感情时，我会：</p>
                        <form action="">
                            <input type="radio" id="item_9_1" name="item_9" value="很难过，只能靠时间治愈">很难过，只能靠时间治愈<br>
                            <input type="radio" id="item_9_2" name="item_9" value="即使很受伤，也要努力把过去的影子甩掉">即使很受伤，也要努力把过去的影子甩掉<br>
                            <input type="radio" id="item_9_3" name="item_9" value="深陷在悲伤的情绪中，在相当长的时期里难以自拔，也不愿再接受新的人">深陷在悲伤的情绪中，在相当长的时期里难以自拔，也不愿再接受新的人<br>
                            <input type="radio" id="item_9_4" name="item_9" value="痛不欲生，但可以通过倾诉或其他发泄渠道得以缓解">痛不欲生，但可以通过倾诉或其他发泄渠道得以缓解<br>
                        </form>
                        <br>
                        <p>10. 面对他人的倾诉，我基本上： </p>
                        <form action="">
                            <input type="radio" id="item_10_1" name="item_10" value="比较有同理心，基本能够认同并理解对方的感受">比较有同理心，基本能够认同并理解对方的感受 <br>
                            <input type="radio" id="item_10_2" name="item_10" value="总是可以快速做出定论或判断">总是可以快速做出定论或判断<br>
                            <input type="radio" id="item_10_3" name="item_10" value="通过分析和推理，帮助对方厘清思路">通过分析和推理，帮助对方厘清思路<br>
                            <input type="radio" id="item_10_4" name="item_10" value="可能会随着他的情绪起伏而起伏，也会发表一些评论或意见">可能会随着他的情绪起伏而起伏，也会发表一些评论或意见<br>
                        </form>
                        <br>
                        <p>11. 我在以下哪个群体中交流较感满足？ </p>
                        <form action="">
                            <input type="radio" id="item_11_1" name="item_11" value="轻松惬意的氛围中，大家心平气和地达成共识，即便结论并不具有指导意义">轻松惬意的氛围中，大家心平气和地达成共识，即便结论并不具有指导意义
                            <input type="radio" id="item_11_2" name="item_11" value="彼此展开充分激烈的辩论并有收获">彼此展开充分激烈的辩论并有收获<br>
                            <input type="radio" id="item_11_3" name="item_11" value="详细地探讨各种因素的影响和利弊">详细地探讨各种因素的影响和利弊<br>
                            <input type="radio" id="item_11_4" name="item_11" value="很开心并且随意无拘束地闲谈">很开心并且随意无拘束地闲谈<br>
                        </form>
                        <br>
                        <p>12. 在内心的真实想法里，我觉得工作: </p>
                        <form action="">
                            <input type="radio" id="item_12_1" name="item_12" value="做熟悉、有能力完成的工作就好，没必要搞太大压力">做熟悉、有能力完成的工作就好，没必要搞太大压力<br>
                            <input type="radio" id="item_12_2" name="item_12" value="应该以最快的速度完成，且争取去完成更多的任务">应该以最快的速度完成，且争取去完成更多的任务<br>
                            <input type="radio" id="item_12_3" name="item_12" value="只要决定做，必须做好，否则不如不做">只要决定做，必须做好，否则不如不做<br>
                            <input type="radio" id="item_12_4" name="item_12" value="工作必须好玩，做不喜欢的工作太痛苦了">工作必须好玩，做不喜欢的工作太痛苦了见<br>
                        </form>
                        <br>
                        <p>13. 如果我是领导，我希望下属这么评价我： </p>
                        <form action="">
                            <input type="radio" id="item_13_1" name="item_13" value="可以亲近的、时常为下属着想的">可以亲近的、时常为下属着想的 <br>
                            <input type="radio" id="item_13_2" name="item_13" value="有很强的能力和富有领导力的">有很强的能力和富有领导力的<br>
                            <input type="radio" id="item_13_3" name="item_13" value="强调公平、公正对待员工、可信赖">强调公平、公正对待员工、可信赖<br>
                            <input type="radio" id="item_13_4" name="item_13" value="富有感染力，深受下属喜欢">富有感染力，深受下属喜欢<br>
                        </form>
                        <br>
                        <p>14. 我对认同的需求是： </p>
                        <form action="">
                            <input type="radio" id="item_14_1" name="item_14" value="无论如何生活都将继续，与别人是否认同无关">无论如何生活都将继续，与别人是否认同无关 <br>
                            <input type="radio" id="item_14_2" name="item_14" value="英群体认同就好了，其他人群不重要">英群体认同就好了，其他人群不重要<br>
                            <input type="radio" id="item_14_3" name="item_14" value="我在乎的人认同就好，其他人的观点无所谓">我在乎的人认同就好，其他人的观点无所谓<br>
                            <input type="radio" id="item_14_4" name="item_14" value="希望所有人都能认同我">希望所有人都能认同我<br>
                        </form>
                        <br>
                        <p>15. 以下有四组格言，哪组整体上最符合我的感觉：</p>
                        <form action="">
                            <input type="radio" id="item_15_1" name="item_15" value="最深刻的真理是最简单和最平凡的；知足是人生最大的幸福">最深刻的真理是最简单和最平凡的；知足是人生最大的幸福<br>
                            <input type="radio" id="item_15_2" name="item_15"
                                   value="走自己的路，让人家去说吧；有所成就是人生唯一的真正的乐趣">走自己的路，让人家去说吧；有所成就是人生唯一的真正的乐趣<br>
                            <input type="radio" id="item_15_3" name="item_15" value="一个不注意小事情的人，永远不会成功大事业；谨慎比大胆要有力量得多">一个不注意小事情的人，永远不会成功大事业；谨慎比大胆要有力量得多<br>
                            <input type="radio" id="item_15_4" name="item_15"
                                   value="幸福在于对生命的喜悦和激情；任何时候都要最真实地对待你自己，这比什么都重要">幸福在于对生命的喜悦和激情；任何时候都要最真实地对待你自己，这比什么都重要<br>
                        </form>
                        <br>
                        <p>16. 朋友一般倾向于这么评价我： </p>
                        <form action="">
                            <input type="radio" id="item_16_1" name="item_16" value="喜欢与朋友交流、倾诉，也有一定的感染力">喜欢与朋友交流、倾诉，也有一定的感染力 <br>
                            <input type="radio" id="item_16_2" name="item_16" value="能够提出很多周全的问题，而且会提供精细的解说">能够提出很多周全的问题，而且会提供精细的解说<br>
                            <input type="radio" id="item_16_3" name="item_16" value="敢于直言，会直率而犀利地谈论不喜欢的人、事、物">敢于直言，会直率而犀利地谈论不喜欢的人、事、物<br>
                            <input type="radio" id="item_16_4" name="item_16" value="比较沉默，通常是倾听者">比较沉默，通常是倾听者<br>
                        </form>
                        <br>
                        <p>17. 我过往的老师最有可能这么评价我： </p>
                        <form action="">
                            <input type="radio" id="item_17_1" name="item_17" value="善于表达和抒发感情，情绪波动较大">善于表达和抒发感情，情绪波动较大 <br>
                            <input type="radio" id="item_17_2" name="item_17" value="不够合群，注重自己的隐私，独来独往">不够合群，注重自己的隐私，独来独往<br>
                            <input type="radio" id="item_17_3" name="item_17" value="强调自己的兴趣，行为习惯敏捷独立">强调自己的兴趣，行为习惯敏捷独立<br>
                            <input type="radio" id="item_17_4" name="item_17" value="比较温和稳定、看起来反应较慢">比较温和稳定、看起来反应较慢<br>
                        </form>
                        <br>
                        <p>18. 在工作上，我表现出来更多的是： </p>
                        <form action="">
                            <input type="radio" id="item_18_1" name="item_18" value="充满热情、创意，有很多想法，显得很机灵">充满热情、创意，有很多想法，显得很机灵 <br>
                            <input type="radio" id="item_18_2" name="item_18" value="为人可靠、心思细腻，细节的工作表现得更好">为人可靠、心思细腻，细节的工作表现得更好<br>
                            <input type="radio" id="item_18_3" name="item_18" value="有推动力，做事直截了当、干脆利落">有推动力，做事直截了当、干脆利落<br>
                            <input type="radio" id="item_18_4" name="item_18" value="擅于协调，有耐心、适应能力强">擅于协调，有耐心、适应能力强<br>
                        </form>
                        <br>
                        <p>19. 在人际关系上，我最在意的是： </p>
                        <form action="">
                            <input type="radio" id="item_19_1" name="item_19" value="得到他人的赞美和欢迎">得到他人的赞美和欢迎 <br>
                            <input type="radio" id="item_19_2" name="item_19" value="得到他人的理解和欣赏">得到他人的理解和欣赏<br>
                            <input type="radio" id="item_19_3" name="item_19" value="得到他人的感激和尊敬">得到他人的感激和尊敬<br>
                            <input type="radio" id="item_19_4" name="item_19" value="得到他人的认可和接纳">得到他人的认可和接纳<br>
                        </form>
                        <br>
                        <p>20. 如果有人深深惹恼我时，我会：</p>
                        <form action="">
                            <input type="radio" id="item_20_1" name="item_20" value="内心感到受伤，但最终很多时候还是会原谅对方">内心感到受伤，但最终很多时候还是会原谅对方 <br>
                            <input type="radio" id="item_20_2" name="item_20" value="深深感到愤怒，我会牢记、未来一定会远离那个家伙">深深感到愤怒，我会牢记、未来一定会远离那个家伙<br>
                            <input type="radio" id="item_20_3" name="item_20" value="会火冒三丈，并且内心期待有机会狠狠回应">会火冒三丈，并且内心期待有机会狠狠回应<br>
                            <input type="radio" id="item_20_4" name="item_20" value="避免摊牌，因为还不到那个地步或者自己再去找新朋友">避免摊牌，因为还不到那个地步或者自己再去找新朋友<br>
                        </form>
                        <br>
                        <p>21. 通常我完成任务的方式是： </p>
                        <form action="">
                            <input type="radio" id="item_21_1" name="item_21" value="截止日代表生产力，我一般都拖到最后完成">截止日代表生产力，我一般都拖到最后完成 <br>
                            <input type="radio" id="item_21_2" name="item_21" value="按照自己的程序严格执行，注重细节，不愿意麻烦别人">按照自己的程序严格执行，注重细节，不愿意麻烦别人<br>
                            <input type="radio" id="item_21_3" name="item_21" value="先做，快速做">先做，快速做<br>
                            <input type="radio" id="item_21_4" name="item_21" value="使用传统的方法按部就班，需要时从他人处得到帮忙">使用传统的方法按部就班，需要时从他人处得到帮忙<br>
                        </form>
                        <br>
                        <p>22. 我做事情，经常： </p>
                        <form action="">
                            <input type="radio" id="item_22_1" name="item_22" id="item_22_1" name="item_22" value="不喜欢长期重复做相同的事情，缺乏长性<">不喜欢长期重复做相同的事情，缺乏长性
                            <input type="radio" id="item_22_2" name="item_22" value="期待好的结果又总被不利因素干扰，有点纠结">期待好的结果又总被不利因素干扰，有点纠结<br>
                            <input type="radio" id="item_22_3" name="item_22" value="往往考虑简单，行事过于草率，缺少耐心">往往考虑简单，行事过于草率，缺少耐心<br>
                            <input type="radio" id="item_22_4" name="item_22" value="缺少紧迫，行动迟缓，难下决心">缺少紧迫，行动迟缓，难下决心<br>
                        </form>
                        <br>
                        <p>23. 在人际交往时，我：</p>
                        <form action="">
                            <input type="radio" id="item_23_1" name="item_23" value="相比较独处，我更喜欢与他人一起">相比较独处，我更喜欢与他人一起 <br>
                            <input type="radio" id="item_23_2" name="item_23" value="比较慢热，往往让人觉得有距离感">比较慢热，往往让人觉得有距离感<br>
                            <input type="radio" id="item_23_3" name="item_23" value="希望在人际关系中占据主导地位">希望在人际关系中占据主导地位<br>
                            <input type="radio" id="item_23_4" name="item_23" value="顺其自然，不温不火，相对被动">顺其自然，不温不火，相对被动<br>
                        </form>
                        <br>
                        <p>24. 恋爱关系中，我最希望对方： </p>
                        <form action="">
                            <input type="radio" id="item_24_1" name="item_24" value="经常赞美我，让我享受开心、被关怀且有一定自由">经常赞美我，让我享受开心、被关怀且有一定自由
                            <input type="radio" id="item_24_2" name="item_24" value="能够觉察到我细微的需求，可以与我保持默契">能够觉察到我细微的需求，可以与我保持默契断<br>
                            <input type="radio" id="item_24_3" name="item_24" value="得到对方的认可，我是正确的并且我对其是有价值的">得到对方的认可，我是正确的并且我对其是有价值的<br>
                            <input type="radio" id="item_24_4" name="item_24" value="尊重我，可以安静地相处">尊重我，可以安静地相处<br>
                        </form>
                        <br>
                        <p>25. 工作之外，我的控制欲最贴近： </p>
                        <form action="">
                            <input type="radio" id="item_25_1" name="item_25" value="自控能力较弱、对他人没有控制欲，只有感染带动他人的欲望">自控能力较弱、对他人没有控制欲，只有感染带动他人的欲望
                            <br>
                            <input type="radio" id="item_25_2" name="item_25" value="不会主动控制，倾向于用规则来保持对自己和他人的要求">不会主动控制，倾向于用规则来保持对自己和他人的要求<br>
                            <input type="radio" id="item_25_3" name="item_25"
                                   value="内心是有控制欲的，希望别人服从于我，但不一定会表现出来">内心是有控制欲的，希望别人服从于我，但不一定会表现出来<br>
                            <input type="radio" id="item_25_4" name="item_25" value="没兴趣影响别人，也不愿别人来控制我">没兴趣影响别人，也不愿别人来控制我<br>
                        </form>
                        <br>
                        <p>26. 我认为自己在情感上的基本特点是： </p>
                        <form action="">
                            <input type="radio" id="item_26_1" name="item_26" value="情绪多变，经常波动">情绪多变，经常波动<br>
                            <input type="radio" id="item_26_2" name="item_26" value="内心感情起伏大，一旦受伤难以平复，但外表总是自我抑制">内心感情起伏大，一旦受伤难以平复，但外表总是自我抑制<br>
                            <input type="radio" id="item_26_3" name="item_26" value="从不拖泥带水，如果感情不稳定，会比较容易发怒">从不拖泥带水，如果感情不稳定，会比较容易发怒<br>
                            <input type="radio" id="item_26_4" name="item_26" value="天性乐观，情绪总是四平八稳">天性乐观，情绪总是四平八稳<br>
                        </form>
                        <br>
                        <p>27. 在大多数时候，我的内心更想要： </p>
                        <form action="">
                            <input type="radio" id="item_27_1" name="item_27" value="喜欢与众不同、挑战刺激，经常冒出新的主意和想法">喜欢与众不同、挑战刺激，经常冒出新的主意和想法 <br>
                            <input type="radio" id="item_27_2" name="item_27" value="平静、安全，保持头脑冷静，不易冲动">平静、安全，保持头脑冷静，不易冲动<br>
                            <input type="radio" id="item_27_3" name="item_27" value="有强烈的“赢”的欲望，生命中处处都是挑战和竞赛">有强烈的“赢”的欲望，生命中处处都是挑战和竞赛<br>
                            <input type="radio" id="item_27_4" name="item_27" value="对自己的现状很满足，觉得很稳定，很少真正羡慕他人">对自己的现状很满足，觉得很稳定，很少真正羡慕他人<br>
                        </form>
                        <br>
                        <p>28. 说话时，我更看重： </p>
                        <form action="">
                            <input type="radio" id="item_28_1" name="item_28" value="感觉效果，有时可能略显夸张">感觉效果，有时可能略显夸张 <br>
                            <input type="radio" id="item_28_2" name="item_28" value="描述精确，有时可能过于冗长">描述精确，有时可能过于冗长<br>
                            <input type="radio" id="item_28_3" name="item_28"
                                   value="能不能达成结果更重要，有时可能过于直接，会让别人不高兴">能不能达成结果更重要，有时可能过于直接，会让别人不高兴<br>
                            <input type="radio" id="item_28_4" name="item_28" value="看重对方的感受，如果对方接受不了，有时可能会隐藏真实的想法">看重对方的感受，如果对方接受不了，有时可能会隐藏真实的想法<br>
                        </form>
                        <br>
                        <p>29. 如果爬山旅游，大多数情况下，下山回来的路线会选择： </p>
                        <form action="">
                            <input type="radio" id="item_29_1" name="item_29" value="新路线，因为好玩有趣">新路线，因为好玩有趣 <br>
                            <input type="radio" id="item_29_2" name="item_29" value="原路线，因为安全稳妥">原路线，因为安全稳妥<br>
                            <input type="radio" id="item_29_3" name="item_29" value="新路线，希望挑战困难">新路线，希望挑战困难<br>
                            <input type="radio" id="item_29_4" name="item_29" value="原路线，因为方便省心">原路线，因为方便省心见<br>
                        </form>
                        <br>
                        <p>30. 关于人生观，我的内心想法是： </p>
                        <form action="">
                            <input type="radio" id="item_30_1" name="item_30" value="希望能有各种各样的人生体验，所以想法极其多样化">希望能有各种各样的人生体验，所以想法极其多样化 <br>
                            <input type="radio" id="item_30_2" name="item_30" value="总是可以快速做出定论或判断">总是可以快速做出定论或判断<br>
                            <input type="radio" id="item_30_3" name="item_30" value="更加在乎取得一切有可能的成就">更加在乎取得一切有可能的成就<br>
                            <input type="radio" id="item_30_4" name="item_30" value="毫不喜欢风险，喜欢享受稳定或现状">毫不喜欢风险，喜欢享受稳定或现状<br>
                        </form>
                        <br>
                    </div>
                    <input type="button" value="提交" class="sub"
                           style="width:70px;height: 35px;background-color:#6d9c01;color:#fff;border:1px solid #6d9c01;border-radius:3px;">
                </div>
            </div>
        </div>
    </section>

    <script>
        var layer;
        $(function () {
            layui.use('layer', function () {
                layer = layui.layer;
            });
            $(".sub").on("click", function () {
                var options = $(".test_con_btn").find('input');
                console.log(options);
                var datas = [];
                options.each(function () {
                    if ($(this).prop('checked')) {
                        var data = {};
                        data.selector = $(this).attr('id');
                        data.selectorContent = $(this).val();
                        datas.push(data);
                    }
                });
                var datasStr = JSON.stringify(datas);
                console.log(datas);
                $.ajax({
                    url: '${path}/h5views/docharacter',
                    data: {"datas": datasStr},
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        layer.alert(data.msg);
                        if (data.code == -9) {
                            window.location.href = "pcm/login";
                        } else if (data.code == 0) {
                            layer.msg(data.msg);
                        }
                    }
                });
            });
        })
    </script>


    <!--底部-->
    <footer class="br_foot">
        <div class="br_dflex">
            <div class="home"><a href="/"><i class="icon"></i> <em>首页</em></a></div>
            <div class="br_flex dh" style="margin-left: -36px">
                <a href="footer-help.jsp">帮助</a><em></em>
                <a href="${path}/hm/login">登录</a><em></em>
                <a href="${path}/hm/register">注册</a><em></em>
                <p>Copyright © 2019 beirui.com<br/>
                    贝睿网 版权所有</p>
            </div>
        </div>
    </footer>

</div>
</body>
</html>
