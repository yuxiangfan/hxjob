<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();	
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>"/>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta http-equiv="Cache-Control" content="no-transform ">
		<meta name="viewport" content="width=device-width">
		<title>贝睿招聘</title>
		<link rel="stylesheet" href="resources/pc/css/public.css" />
		<link rel="stylesheet" href="resources/pc/css/evaluation.css" />
		<link rel="stylesheet" href="resources/pc/css/component.css" />
		<script src="resources/pc/js/jquery-2.1.0.min.js"></script>
		<script src="resources/layui/layui.js"></script>
	</head>
	<body>
		<div class="container ps_con clearfix">
			<div class="form-header-group ">
				<div class="header-text httac htvam">
					<h1 class="form-header" data-component="header">
						贝睿性格测试
					</h1>
					<div class="form-subHeader">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是一份来自专业金融职前培训机构-贝睿的一份基于性格色彩学的测评，它将有助于测试者深入了解自己的深层次性格，从而帮助自己得到更好的职业定位。
					</div>
				</div>
			</div>
			<div class="form-header-group_2">
				<span class="input input--minoru">
					<input class="input__field input__field--yoko" type="text" id="input-16">
					<label class="input__label input__label--yoko" for="input-16">
						<span class="input__label-content input__label-content--yoko">邮箱</span>
					</label>
				</span>
			</div>
			<div class="form-header-group_3">
				<ul style="padding: 0px 0px 0px 0px; margin-left: 40px;">
					<li>
						<p class="problem">1. 当我还是个孩子的时候，我：</p>
						<div class="answer">
							<input type="radio" id="item_1_1" name="item_1" >
							<label class="item_label" for="item_1_1">更喜欢和熟悉的伙伴一起玩耍</label>
						</div>
						<div class="answer">
							<input id="item_1_2" type="radio" name="item_1">
							<label class="item_label" for="item_1_2">是孩子王，大家经常听我的决定</label>
						</div>
						<div class="answer">
							<input id="item_1_3" type="radio" name="item_1">
							<label class="item_label" for="item_1_3">羞于见生人，会有意识地回避</label><br />
						</div>
						<div class="answer">
							<input id="item_1_4" type="radio" name="item_1">
							<label class="item_label" for="item_1_4">乐观积极、调皮可爱</label>
						</div>
					</li>
					
					<li>
						<p class="problem">2. 如果我是父母，也许我是：</p>
						<div class="answer">
							<input type="radio" id="item_2_1" name="item_2" >
							<label class="item_label" for="item_2_1">对孩子宽容、可以听得进去孩子的意见和建议</label>
						</div>
						<div class="answer">
							<input id="item_2_2" type="radio" name="item_2">
							<label class="item_label" for="item_2_2">在孩子面前保持威严，说一不二</label>
						</div>
						<div class="answer">
							<input id="item_2_3" type="radio" name="item_2">
							<label class="item_label" for="item_2_3">会对孩子有要求，同时会坚持自己的想法</label><br />
						</div>
						<div class="answer">
							<input id="item_2_4" type="radio" name="item_2">
							<label class="item_label" for="item_2_4">像个大孩子一样，融入到孩子中去</label>
						</div>
					</li>
					
					<li>
						<p class="problem">3. 面对他人对自己的赞美：</p>
						<div class="answer">
							<input type="radio" id="item_3_1" name="item_3" >
							<label class="item_label" for="item_3_1">无所谓，不会因为别人赞美而有情绪波动</label>
						</div>
						<div class="answer">
							<input id="item_3_2" type="radio" name="item_3">
							<label class="item_label" for="item_3_2">我更在乎对方是否欣赏我的能力，不需要无关痛痒的赞美</label>
						</div>
						<div class="answer">
							<input id="item_3_3" type="radio" name="item_3">
							<label class="item_label" for="item_3_3">怀疑赞美是否出自真心，或者会刻意逃避众人的注意</label><br />
						</div>
						<div class="answer">
							<input id="item_3_4" type="radio" name="item_3">
							<label class="item_label" for="item_3_4">很开心，溢美之词让人感到愉悦</label>
						</div>
					</li>
					
					<li>
						<p class="problem">4. 在帮助他人的问题上，我的内心想法是：</p>
						<div class="answer">
							<input type="radio" id="item_4_1" name="item_4" >
							<label class="item_label" for="item_4_1">无所谓，不会因为别人赞美而有情绪波动</label>
						</div>
						<div class="answer">
							<input id="item_4_2" type="radio" name="item_4">
							<label class="item_label" for="item_4_2">我更在乎对方是否欣赏我的能力，不需要无关痛痒的赞美</label>
						</div>
						<div class="answer">
							<input id="item_4_3" type="radio" name="item_4">
							<label class="item_label" for="item_4_3">怀疑赞美是否出自真心，或者会刻意逃避众人的注意</label><br />
						</div>
						<div class="answer">
							<input id="item_4_4" type="radio" name="item_4">
							<label class="item_label" for="item_4_4">很开心，溢美之词让人感到愉悦</label>
						</div>
					</li>
					
					<li>
						<p class="problem">5 . 对于规则，我内心的态度是： </p>
						<div class="answer">
							<input type="radio" id="item_5_1" name="item_5" >
							<label class="item_label" for="item_5_1">不愿违反规则，但可能因为松散而无法达到规则的要求</label>
						</div>
						<div class="answer">
							<input id="item_5_2" type="radio" name="item_5">
							<label class="item_label" for="item_5_2">倾向打破规则，希望由自己来制定规则而不是遵守规则</label>
						</div>
						<div class="answer">
							<input id="item_5_3" type="radio" name="item_5">
							<label class="item_label" for="item_5_3">严格遵守规则，并且竭尽全力做到规则内的最好</label><br />
						</div>
						<div class="answer">
							<input id="item_5_4" type="radio" name="item_5">
							<label class="item_label" for="item_5_4">不喜欢被规则约束，不按规则出牌会觉得新鲜有趣</label>
						</div>
					</li>
					
					<li>
						<p class="problem">6. 面对生活，我更像 ： </p>
						<div class="answer">
							<input type="radio" id="item_6_1" name="item_6" >
							<label class="item_label" for="item_6_1">平和派：我自己觉得不错就可以，不用考虑外面的世界如何</label>
						</div>
						<div class="answer">
							<input id="item_6_2" type="radio" name="item_6">
							<label class="item_label" for="item_6_2">上进派：不进则退，必须保持进步</label>
						</div>
						<div class="answer">
							<input id="item_6_3" type="radio" name="item_6">
							<label class="item_label" for="item_6_3">小心翼翼派：未雨绸缪，最好在问题未发生之前想好所有可能</label><br />
						</div>
						<div class="answer">
							<input id="item_6_4" type="radio" name="item_6">
							<label class="item_label" for="item_6_4">乐天派：活在当下、过好每一天最重要</label>
						</div>
					</li>
					
					<li>
						<p class="problem">7. 我认为自己在行为上的基本特点是： </p>
						<div class="answer">
							<input type="radio" id="item_7_1" name="item_7" >
							<label class="item_label" for="item_7_1">慢条斯理，按部就班，能与周围的人协调一致</label>
						</div>
						<div class="answer">
							<input id="item_7_2" type="radio" name="item_7">
							<label class="item_label" for="item_7_2">目标明确，集中精力，为实现目标而努力，善于抓住核心要点</label>
						</div>
						<div class="answer">
							<input id="item_7_3" type="radio" name="item_7">
							<label class="item_label" for="item_7_3">慎重小心，为做好预防及善后，会不惜一切而尽心操劳</label><br />
						</div>
						<div class="answer">
							<input id="item_7_4" type="radio" name="item_7">
							<label class="item_label" for="item_7_4">丰富跃动，不喜欢制度和约束，倾向于快速反应</label>
						</div>
					</li>
					
					<li>
						<p class="problem">8. 当我做错事时，我倾向于： </p>
						<div class="answer">
							<input type="radio" id="item_8_1" name="item_8" >
							<label class="item_label" for="item_8_1">害怕，但表面不露声色</label>
						</div>
						<div class="answer">
							<input id="item_8_2" type="radio" name="item_8">
							<label class="item_label" for="item_8_2">内心已经明白是自己的问题，但总是不愿承认、总是辩驳</label>
						</div>
						<div class="answer">
							<input id="item_8_3" type="radio" name="item_8">
							<label class="item_label" for="item_8_3">很长时间内都会感到愧疚、痛苦、压抑</label><br />
						</div>
						<div class="answer">
							<input id="item_8_4" type="radio" name="item_8">
							<label class="item_label" for="item_8_4">希望逃避批评，感到十分难为情</label>
						</div>
					</li>
					
					<li>
						<p class="problem">9. 当结束一段刻骨铭心的感情时，我会： </p>
						<div class="answer">
							<input type="radio" id="item_9_1" name="item_9" >
							<label class="item_label" for="item_9_1">很难过，只能靠时间治愈</label>
						</div>
						<div class="answer">
							<input id="item_9_2" type="radio" name="item_9">
							<label class="item_label" for="item_9_2">即使很受伤，也要努力把过去的影子甩掉</label>
						</div>
						<div class="answer">
							<input id="item_9_3" type="radio" name="item_9">
							<label class="item_label" for="item_9_3">深陷在悲伤的情绪中，在相当长的时期里难以自拔，也不愿再接受新的人</label><br />
						</div>
						<div class="answer">
							<input id="item_9_4" type="radio" name="item_9">
							<label class="item_label" for="item_9_4">痛不欲生，但可以通过倾诉或其他发泄渠道得以缓解</label>
						</div>
					</li>
					
					<li>
						<p class="problem">10. 面对他人的倾诉，我基本上：  </p>
						<div class="answer">
							<input type="radio" id="item_10_1" name="item_10" >
							<label class="item_label" for="item_10_1">比较有同理心，基本能够认同并理解对方的感受</label>
						</div>
						<div class="answer">
							<input id="item_10_2" type="radio" name="item_10">
							<label class="item_label" for="item_10_2">总是可以快速做出定论或判断</label>
						</div>
						<div class="answer">
							<input id="item_10_3" type="radio" name="item_10">
							<label class="item_label" for="item_10_3">通过分析和推理，帮助对方厘清思路</label><br />
						</div>
						<div class="answer">
							<input id="item_10_4" type="radio" name="item_10">
							<label class="item_label" for="item_10_4">可能会随着他的情绪起伏而起伏，也会发表一些评论或意见</label>
						</div>
					</li>
					
					<li>
						<p class="problem">11. 我在以下哪个群体中交流较感满足？  </p>
						<div class="answer">
							<input type="radio" id="item_11_1" name="item_11" >
							<label class="item_label" for="item_11_1">轻松惬意的氛围中，大家心平气和地达成共识，即便结论并不具有指导意义</label>
						</div>
						<div class="answer">
							<input id="item_11_2" type="radio" name="item_11">
							<label class="item_label" for="item_11_2">彼此展开充分激烈的辩论并有收获</label>
						</div>
						<div class="answer">
							<input id="item_11_3" type="radio" name="item_11">
							<label class="item_label" for="item_11_3">详细地探讨各种因素的影响和利弊</label><br />
						</div>
						<div class="answer">
							<input id="item_11_4" type="radio" name="item_11">
							<label class="item_label" for="item_11_4">很开心并且随意无拘束地闲谈</label>
						</div>
					</li>
					
					<li>
						<p class="problem">12. 在内心的真实想法里，我觉得工作:  </p>
						<div class="answer">
							<input type="radio" id="item_12_1" name="item_12" >
							<label class="item_label" for="item_12_1">做熟悉、有能力完成的工作就好，没必要搞太大压力</label>
						</div>
						<div class="answer">
							<input id="item_12_2" type="radio" name="item_12">
							<label class="item_label" for="item_12_2">应该以最快的速度完成，且争取去完成更多的任务</label>
						</div>
						<div class="answer">
							<input id="item_12_3" type="radio" name="item_12">
							<label class="item_label" for="item_12_3">只要决定做，必须做好，否则不如不做</label><br />
						</div>
						<div class="answer">
							<input id="item_12_4" type="radio" name="item_12">
							<label class="item_label" for="item_12_4">工作必须好玩，做不喜欢的工作太痛苦了</label>
						</div>
					</li>
					
					<li>
						<p class="problem">13. 如果我是领导，我希望下属这么评价我：  </p>
						<div class="answer">
							<input type="radio" id="item_13_1" name="item_13" >
							<label class="item_label" for="item_13_1">可以亲近的、时常为下属着想的</label>
						</div>
						<div class="answer">
							<input id="item_13_2" type="radio" name="item_13">
							<label class="item_label" for="item_13_2">有很强的能力和富有领导力的</label>
						</div>
						<div class="answer">
							<input id="item_13_3" type="radio" name="item_13">
							<label class="item_label" for="item_13_3">强调公平、公正对待员工、可信赖</label><br />
						</div>
						<div class="answer">
							<input id="item_13_4" type="radio" name="item_13">
							<label class="item_label" for="item_13_4">富有感染力，深受下属喜欢</label>
						</div>
					</li>
					
					<li>
						<p class="problem">14. 我对认同的需求是：  </p>
						<div class="answer">
							<input type="radio" id="item_14_1" name="item_14" >
							<label class="item_label" for="item_14_1">无论如何生活都将继续，与别人是否认同无关</label>
						</div>
						<div class="answer">
							<input id="item_14_2" type="radio" name="item_14">
							<label class="item_label" for="item_14_2">精英群体认同就好了，其他人群不重要</label>
						</div>
						<div class="answer">
							<input id="item_14_3" type="radio" name="item_14">
							<label class="item_label" for="item_14_3">我在乎的人认同就好，其他人的观点无所谓</label><br />
						</div>
						<div class="answer">
							<input id="item_14_4" type="radio" name="item_14">
							<label class="item_label" for="item_14_4">希望所有人都能认同我</label>
						</div>
					</li>
					
					<li>
						<p class="problem">15. 以下有四组格言，哪组整体上最符合我的感觉：  </p>
						<div class="answer">
							<input type="radio" id="item_15_1" name="item_15" >
							<label class="item_label" for="item_15_1">最深刻的真理是最简单和最平凡的；知足是人生最大的幸福</label>
						</div>
						<div class="answer">
							<input id="item_15_2" type="radio" name="item_15">
							<label class="item_label" for="item_15_2">走自己的路，让人家去说吧；有所成就是人生唯一的真正的乐趣</label>
						</div>
						<div class="answer">
							<input id="item_15_3" type="radio" name="item_15">
							<label class="item_label" for="item_15_3">一个不注意小事情的人，永远不会成功大事业；谨慎比大胆要有力量得多</label><br />
						</div>
						<div class="answer">
							<input id="item_15_4" type="radio" name="item_15">
							<label class="item_label" for="item_15_4">幸福在于对生命的喜悦和激情；任何时候都要最真实地对待你自己，这比什么都重要</label>
						</div>
					</li>
					
					<li>
						<p class="problem">16. 朋友一般倾向于这么评价我：  </p>
						<div class="answer">
							<input type="radio" id="item_16_1" name="item_16" >
							<label class="item_label" for="item_16_1">喜欢与朋友交流、倾诉，也有一定的感染力</label>
						</div>
						<div class="answer">
							<input id="item_16_2" type="radio" name="item_16">
							<label class="item_label" for="item_16_2">能够提出很多周全的问题，而且会提供精细的解说</label>
						</div>
						<div class="answer">
							<input id="item_16_3" type="radio" name="item_16">
							<label class="item_label" for="item_16_3">敢于直言，会直率而犀利地谈论不喜欢的人、事、物</label><br />
						</div>
						<div class="answer">
							<input id="item_16_4" type="radio" name="item_16">
							<label class="item_label" for="item_16_4">比较沉默，通常是倾听者</label>
						</div>
					</li>
					
					<li>
						<p class="problem">17. 我过往的老师最有可能这么评价我：   </p>
						<div class="answer">
							<input type="radio" id="item_17_1" name="item_17" >
							<label class="item_label" for="item_17_1">善于表达和抒发感情，情绪波动较大</label>
						</div>
						<div class="answer">
							<input id="item_17_2" type="radio" name="item_17">
							<label class="item_label" for="item_17_2">不够合群，注重自己的隐私，独来独往</label>
						</div>
						<div class="answer">
							<input id="item_17_3" type="radio" name="item_17">
							<label class="item_label" for="item_17_3">强调自己的兴趣，行为习惯敏捷独立</label><br />
						</div>
						<div class="answer">
							<input id="item_17_4" type="radio" name="item_17">
							<label class="item_label" for="item_17_4">比较温和稳定、看起来反应较慢</label>
						</div>
					</li>
					
					<li>
						<p class="problem">18. 在工作上，我表现出来更多的是：   </p>
						<div class="answer">
							<input type="radio" id="item_18_1" name="item_18" >
							<label class="item_label" for="item_18_1">充满热情、创意，有很多想法，显得很机灵</label>
						</div>
						<div class="answer">
							<input id="item_18_2" type="radio" name="item_18">
							<label class="item_label" for="item_18_2">为人可靠、心思细腻，细节的工作表现得更好</label>
						</div>
						<div class="answer">
							<input id="item_18_3" type="radio" name="item_18">
							<label class="item_label" for="item_18_3">有推动力，做事直截了当、干脆利落</label><br />
						</div>
						<div class="answer">
							<input id="item_18_4" type="radio" name="item_18">
							<label class="item_label" for="item_18_4">擅于协调，有耐心、适应能力强</label>
						</div>
					</li>
					
					<li>
						<p class="problem">19. 在人际关系上，我最在意的是：</p>
						<div class="answer">
							<input type="radio" id="item_19_1" name="item_19" >
							<label class="item_label" for="item_19_1">得到他人的赞美和欢迎</label>
						</div>
						<div class="answer">
							<input id="item_19_2" type="radio" name="item_19">
							<label class="item_label" for="item_19_2">得到他人的理解和欣赏</label>
						</div>
						<div class="answer">
							<input id="item_19_3" type="radio" name="item_19">
							<label class="item_label" for="item_19_3">得到他人的感激和尊敬</label><br />
						</div>
						<div class="answer">
							<input id="item_19_4" type="radio" name="item_19">
							<label class="item_label" for="item_19_4">得到他人的认可和接纳</label>
						</div>
					</li>
					
					<li>
						<p class="problem">20. 如果有人深深惹恼我时，我会：</p>
						<div class="answer">
							<input type="radio" id="item_20_1" name="item_20" >
							<label class="item_label" for="item_20_1">内心感到受伤，但最终很多时候还是会原谅对方</label>
						</div>
						<div class="answer">
							<input id="item_20_2" type="radio" name="item_20">
							<label class="item_label" for="item_20_2">深深感到愤怒，我会牢记、未来一定会远离那个家伙</label>
						</div>
						<div class="answer">
							<input id="item_20_3" type="radio" name="item_20">
							<label class="item_label" for="item_20_3">会火冒三丈，并且内心期待有机会狠狠回应</label><br />
						</div>
						<div class="answer">
							<input id="item_20_4" type="radio" name="item_20">
							<label class="item_label" for="item_20_4">避免摊牌，因为还不到那个地步或者自己再去找新朋友</label>
						</div>
					</li>
					
					<li>
						<p class="problem">21. 通常我完成任务的方式是： </p>
						<div class="answer">
							<input type="radio" id="item_21_1" name="item_21" >
							<label class="item_label" for="item_21_1">截止日代表生产力，我一般都拖到最后完成</label>
						</div>
						<div class="answer">
							<input id="item_21_2" type="radio" name="item_21">
							<label class="item_label" for="item_21_2">按照自己的程序严格执行，注重细节，不愿意麻烦别人</label>
						</div>
						<div class="answer">
							<input id="item_21_3" type="radio" name="item_21">
							<label class="item_label" for="item_21_3">先做，快速做</label><br />
						</div>
						<div class="answer">
							<input id="item_21_4" type="radio" name="item_21">
							<label class="item_label" for="item_21_4">使用传统的方法按部就班，需要时从他人处得到帮忙</label>
						</div>
					</li>
					
					<li>
						<p class="problem">22. 我做事情，经常：</p>
						<div class="answer">
							<input type="radio" id="item_22_1" name="item_22" >
							<label class="item_label" for="item_22_1">不喜欢长期重复做相同的事情，缺乏长性</label>
						</div>
						<div class="answer">
							<input id="item_22_2" type="radio" name="item_22">
							<label class="item_label" for="item_22_2">期待好的结果又总被不利因素干扰，有点纠结</label>
						</div>
						<div class="answer">
							<input id="item_22_3" type="radio" name="item_22">
							<label class="item_label" for="item_22_3">往往考虑简单，行事过于草率，缺少耐心</label><br />
						</div>
						<div class="answer">
							<input id="item_22_4" type="radio" name="item_22">
							<label class="item_label" for="item_22_4">缺少紧迫，行动迟缓，难下决心</label>
						</div>
					</li>
					
					<li>
						<p class="problem">23. 在人际交往时，我：</p>
						<div class="answer">
							<input type="radio" id="item_23_1" name="item_23" >
							<label class="item_label" for="item_23_1">相比较独处，我更喜欢与他人一起</label>
						</div>
						<div class="answer">
							<input id="item_23_2" type="radio" name="item_23">
							<label class="item_label" for="item_23_2">比较慢热，往往让人觉得有距离感</label>
						</div>
						<div class="answer">
							<input id="item_23_3" type="radio" name="item_23">
							<label class="item_label" for="item_23_3">希望在人际关系中占据主导地位</label><br />
						</div>
						<div class="answer">
							<input id="item_23_4" type="radio" name="item_23">
							<label class="item_label" for="item_23_4">顺其自然，不温不火，相对被动</label>
						</div>
					</li>
					
					<li>
						<p class="problem">24. 恋爱关系中，我最希望对方：</p>
						<div class="answer">
							<input type="radio" id="item_24_1" name="item_24" >
							<label class="item_label" for="item_24_1">经常赞美我，让我享受开心、被关怀且有一定自由</label>
						</div>
						<div class="answer">
							<input id="item_24_2" type="radio" name="item_24">
							<label class="item_label" for="item_24_2">能够觉察到我细微的需求，可以与我保持默契</label>
						</div>
						<div class="answer">
							<input id="item_24_3" type="radio" name="item_24">
							<label class="item_label" for="item_24_3">得到对方的认可，我是正确的并且我对其是有价值的</label><br />
						</div>
						<div class="answer">
							<input id="item_24_4" type="radio" name="item_24">
							<label class="item_label" for="item_24_4">尊重我，可以安静地相处</label>
						</div>
					</li>
					
					<li>
						<p class="problem">25. 工作之外，我的控制欲最贴近：</p>
						<div class="answer">
							<input type="radio" id="item_25_1" name="item_25" >
							<label class="item_label" for="item_25_1">自控能力较弱、对他人没有控制欲，只有感染带动他人的欲望</label>
						</div>
						<div class="answer">
							<input id="item_25_2" type="radio" name="item_25">
							<label class="item_label" for="item_25_2">不会主动控制，倾向于用规则来保持对自己和他人的要求</label>
						</div>
						<div class="answer">
							<input id="item_25_3" type="radio" name="item_25">
							<label class="item_label" for="item_25_3">内心是有控制欲的，希望别人服从于我，但不一定会表现出来</label><br />
						</div>
						<div class="answer">
							<input id="item_25_4" type="radio" name="item_25">
							<label class="item_label" for="item_25_4">没兴趣影响别人，也不愿别人来控制我</label>
						</div>
					</li>
					
					<li>
						<p class="problem">26. 我认为自己在情感上的基本特点是：</p>
						<div class="answer">
							<input type="radio" id="item_26_1" name="item_26" >
							<label class="item_label" for="item_26_1">情绪多变，经常波动</label>
						</div>
						<div class="answer">
							<input id="item_26_2" type="radio" name="item_26">
							<label class="item_label" for="item_26_2">内心感情起伏大，一旦受伤难以平复，但外表总是自我抑制</label>
						</div>
						<div class="answer">
							<input id="item_26_3" type="radio" name="item_26">
							<label class="item_label" for="item_26_3">从不拖泥带水，如果感情不稳定，会比较容易发怒</label><br />
						</div>
						<div class="answer">
							<input id="item_26_4" type="radio" name="item_26">
							<label class="item_label" for="item_26_4">天性乐观，情绪总是四平八稳</label>
						</div>
					</li>
					
					<li>
						<p class="problem">27. 在大多数时候，我的内心更想要： </p>
						<div class="answer">
							<input type="radio" id="item_27_1" name="item_27" >
							<label class="item_label" for="item_27_1">喜欢与众不同、挑战刺激，经常冒出新的主意和想法</label>
						</div>
						<div class="answer">
							<input id="item_27_2" type="radio" name="item_27">
							<label class="item_label" for="item_27_2">平静、安全，保持头脑冷静，不易冲动</label>
						</div>
						<div class="answer">
							<input id="item_27_3" type="radio" name="item_27">
							<label class="item_label" for="item_27_3">有强烈的“赢”的欲望，生命中处处都是挑战和竞赛</label><br />
						</div>
						<div class="answer">
							<input id="item_27_4" type="radio" name="item_27">
							<label class="item_label" for="item_27_4">对自己的现状很满足，觉得很稳定，很少真正羡慕他人</label>
						</div>
					</li>
					
					<li>
						<p class="problem">28. 说话时，我更看重：  </p>
						<div class="answer">
							<input type="radio" id="item_28_1" name="item_28" >
							<label class="item_label" for="item_28_1">感觉效果，有时可能略显夸张</label>
						</div>
						<div class="answer">
							<input id="item_28_2" type="radio" name="item_28">
							<label class="item_label" for="item_28_2">描述精确，有时可能过于冗长</label>
						</div>
						<div class="answer">
							<input id="item_28_3" type="radio" name="item_28">
							<label class="item_label" for="item_28_3">能不能达成结果更重要，有时可能过于直接，会让别人不高兴</label><br />
						</div>
						<div class="answer">
							<input id="item_28_4" type="radio" name="item_28">
							<label class="item_label" for="item_28_4">看重对方的感受，如果对方接受不了，有时可能会隐藏真实的想法</label>
						</div>
					</li>
					
					<li>
						<p class="problem">29. 如果爬山旅游，大多数情况下，下山回来的路线会选择：  </p>
						<div class="answer">
							<input type="radio" id="item_29_1" name="item_29" >
							<label class="item_label" for="item_29_1">新路线，因为好玩有趣</label>
						</div>
						<div class="answer">
							<input id="item_29_2" type="radio" name="item_29">
							<label class="item_label" for="item_29_2">原路线，因为安全稳妥</label>
						</div>
						<div class="answer">
							<input id="item_29_3" type="radio" name="item_29">
							<label class="item_label" for="item_29_3">新路线，希望挑战困难</label><br />
						</div>
						<div class="answer">
							<input id="item_29_4" type="radio" name="item_29">
							<label class="item_label" for="item_29_4">原路线，因为方便省心</label>
						</div>
					</li>
					
					<li>
						<p class="problem">30. 关于人生观，我的内心想法是：   </p>
						<div class="answer">
							<input type="radio" id="item_30_1" name="item_30" >
							<label class="item_label" for="item_30_1">希望能有各种各样的人生体验，所以想法极其多样化</label>
						</div>
						<div class="answer">
							<input id="item_30_2" type="radio" name="item_30">
							<label class="item_label" for="item_30_2">在合理的基础上，谨慎确定目标，一旦确定会坚定不移地去做</label>
						</div>
						<div class="answer">
							<input id="item_30_3" type="radio" name="item_30">
							<label class="item_label" for="item_30_3">更加在乎取得一切有可能的成就</label><br />
						</div>
						<div class="answer">
							<input id="item_30_4" type="radio" name="item_30">
							<label class="item_label" for="item_30_4">毫不喜欢风险，喜欢享受稳定或现状</label>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</body>
	<script>
		$(".form-header-group_3").find('input').each(function(){
			 <c:forEach items="${characterDetails}" var="d">
		        if($(this).attr('id')=='${d.selector}'){
		        	$(this).prop('checked',true);
		        }
		    </c:forEach>
		});
		
	</script>
	
</html>




