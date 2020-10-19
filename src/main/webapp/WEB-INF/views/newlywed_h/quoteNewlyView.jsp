<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合約</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css ">
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/support/bgMain.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/support/bgMall.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ContractBuild.css">
</head>
<body>

	<!-- onLoad="setFocusToUserId()"不知道是什麼 -->
	<c:set var="funcName" value="REG" scope="session" />
	<jsp:include page="/fragment/topMVC.jsp" />
	<!-- container -->
	<!-- 		</h1> -->

	<!-- 引入共同的頁首 -->
	<div class="row" style="padding-top: 30px;">
		<jsp:include
			page="/WEB-INF/views/newlywed_h/fragment/newlywedSidebar.jsp" />

		<div class="bgMainGalleryDiv MallMain col-lg-9 mb-4">
			<!-- 		<div class="bgMainGalleryDiv MallMain"> -->
			<!-- 		內容建立位置-------------- -->
			<c:set var="nowTime" value="${NowTime}" />
			<c:set var="quoteContract" value="${QuoteContractBean}" />
<!-- 			n_MemberBean新人→m_memberBean -->
			<c:set var="m_memberBean" value="${n_MemberBean}" />
<!-- 			p_MemberBean合作商→MemberBean -->
			<c:set var="memberBean" value="${p_MemberBean}" />
			<c:set var="partnerBean" value="${PartnerBean}" />

			<!--	合約簽名div -->
			<div id="aaa" class="coller" style="max-width: 1000px;">
				<div class="col" id="capture" style="">
					<h3 style="color: #000;">婚紗攝影服務定型化契約</h3>
					<br>
					<h4 style="color: #000;">合約名稱: ${QuoteContractBean.qcName}
						合約編號:${QuoteContractBean.qcId}</h4>
					<h5 style="color: #000;">中華民國108年8月2日經濟部經商字第10802417860號函修訂</h5>
					<!-- 								合約div標籤結束 -->
					<br>
					<div class="col">
						<div style="width: 100%;">
							<label class="fontSize"> 壹、前言</label><br>&nbsp; <label
								class="fontSize">
								本契約所稱婚紗攝影服務，指提供婚紗拍攝及禮服租用之服務。但單純提供禮服租用者，不適用之。
								本契約於中華民國(以下同)${QuoteContractBean.qcDate}經消費者攜回審閱三日(契約審閱期間至少三日)。</label><br>&nbsp;
							<br>&nbsp; <label class="fontSize"> 貳、契約條款</label><br>&nbsp;
							<label class="fontSize">
								茲為消費者(以下簡稱甲方)與業者(以下簡稱乙方)間之婚紗攝影服務事宜，雙方同意訂定本契約條款如下： <br> 第一條
								服務範圍<br> <br> &nbsp;本契約服務之內容詳如附件「婚紗攝影服務項目」。 <br>
								第二條 契約總金額<br> <br>&nbsp;本契約之總金額為新臺幣(以下同)${QuoteContractBean.qcTotalAmount}元，除另有約定外，乙方不得增收其他服務報酬及費用。<br>
								第三條 服務報酬及押金之交付<br> <br>
								&nbsp;一、定金：${QuoteContractBean.qcDeposit}元<br>
								&nbsp;&nbsp;乙方收取前項各款金額之比例限制，應依下列規定辦理：<br>
								&nbsp;一、前項第一款金額不得逾契約總金額百分之二十。<br>
								&nbsp;二、前項第一款及第二款金額之累計，不得逾契約總金額百 分之五十；<br>
								&nbsp;&nbsp;前項第一款至第三款金額之累計，不得逾契約總金額百分之六十；前項第一款至第四款金額之累
								計，不得逾契約總金額百分之八十。<br> &nbsp;三、前項第七款金額不得逾契約總金額百分之十。<br>
								第四條 瑕疵擔保責任<br> <br> &nbsp;乙方依據本契約完成之相關工作，應使其具備約定之品質及
								無減少或滅失價值或不適於通常或約定使用之瑕疵。<br> 第五條 消費者之協力義務<br> <br>
								&nbsp;雙方約定之化妝、試穿、拍攝、外景拍攝等日期之工作，需 甲方協力行為始能完成而甲方未為者，乙方應定七日以上期
								限，催告甲方為之。 甲方無正當理由未於前項期限內為其行為者，乙方得解除契 約，並得請求賠償因解除契約所生之損害。<br>
								第六條受領遲延之責任<br> <br> &nbsp;甲方應於約定之日期選定樣片或取件。
								甲方違反前項約定者，乙方應定七日以上之期限，催告甲方 選定樣片或取件。 甲方未於前項期限內選定樣片或取件者，乙方自期限屆滿之
								日起，僅就故意或重大過失之行為，負保管責任。 乙方自第二項期限屆滿之日起六個月後得不負保管責任。<br> 第七條
								瑕疵修補義務<br> <br> &nbsp;經甲方選定樣片後，因照片製作有瑕疵者，甲方得請求乙方
								於約定期限內修補或重新製作。 乙方未於前項期限內修補或重新製作，或其瑕疵不能修補 者，甲方得解除契約或請求減少報酬。
								因可歸責於乙方之事由，致發生第一項瑕疵者，甲方除依前 二項之規定主張外，並得請求損害賠償。<br> 第八條
								禮服租用押金之返還及賠償<br> <br> &nbsp;
								租用之禮服無毀損、滅失情形，或因不可歸責於甲方之事由 致毀損、滅失者，乙方應返還收受之押金。
								因可歸責於甲方之事由，致租用之禮服有毀損、滅失之情形 者，乙方求償金額以押金為限。但乙方如能證明所受損害超 過押金者，不在此限。<br>
								第九條 選定樣片及照片之著作權歸屬<br> <br> &nbsp;
								經甲方選定之樣片及照片，除另有約定外，其著作人為乙 方，著作財產權人為甲方。<br> 第十條
								未經選定樣片及照片之使用限制<br> <br> &nbsp;
								未經甲方選定之其他樣片及照片，除經書面同意者外，乙 方不得使用，並應銷毀之。 乙方違反前項約定致生損害者，應負損害賠償責任。<br>
								第十一條 危險負擔<br> <br> &nbsp; 因不可歸責於雙方之事由，致一方之給付一部或全部不能
								者，依民法第二百六十六條規定辦理。 前項情形，如乙方提出之替代方案經甲方書面同意者，契 約以重新協議之內容延續。<br>
								第十二條 業者給付遲延責任<br> <br> &nbsp;因可歸責於乙方之事由致給付遲延者，甲方得逕行解除契
								約，並得請求損害賠償。 因不可歸責於乙方之事由致給付遲延者，乙方不負遲延責 任。<br> 第十三條 消費者終止契約<br>
								<br> &nbsp; 甲方得隨時終止契約。 終止契約時，乙方得請求契約終止前已提供服務之報酬；
								其另受有損害者，並得請求賠償。<br> 第十四條 指定攝影師或造型師之變更<br> <br>
								&nbsp;甲方如指定攝影師或造型師者，乙方不得任意更換該被指 定人員。 前項被指定人員因故無法提供服務時，乙方應立即通知甲
								方重新選定。 前項情形，甲方已支付指定費而不願重新選定者，得終止 契約，並得請求加倍返還所收取之指定費。終止契約時，
								乙方應退還尚未提供服務之報酬。<br> 第十五條 個人資料之保護 <br> <br> &nbsp;
								乙方對甲方個人資料之蒐集、處理及利用，應依個人資料 保護法規定處理。<br> 第十六條 法律適用與法院管轄<br>
								<br> &nbsp;本契約之解釋適用，以中華民國法律為準據法。 因本契約所生之一切爭執，雙方同意以○地方法院為第一
								審管轄法院，但不得排除消費者保護法第四十七條及民事 訴訟法第四百三十六條之九規定小額訴訟管轄法院之適 用。<br>
								第十七條 補充規定<br> <br> &nbsp;本契約如有未盡事宜，依民法、消費者保護法及相關法令
								處理之。<br> 第十八條 契約書收執<br> <br>
								&nbsp;本契約一式二份，由甲方及乙方各執一份為憑。<br>
							</label> <label class="fontSize"> 叁、附加條件</label><br>&nbsp; <label
								class="fontSize">
								服務日期:${QuoteContractBean.qcExecutionDate}<br>
								附加內容:${QuoteContractBean.qcContent}<br>
								合約到期日:${QuoteContractBean.qcDateLine}
							</label>

							<div class="row" style="width: 100%">
								<div style="width: 50%">
									<label class="fontSize"> 立契約人：<br>
										甲方:${QuoteContractBean.n_Name}<br>
										甲方帳號:${QuoteContractBean.m_Id}<br>
										身分證字號：${m_memberBean.m_Socialnum} <br>
										地址：${m_memberBean.m_Add} <br> 電子郵件信箱：${m_memberBean.m_Id} <br>
										電話：${ m_memberBean.m_Phone}<br> 簽約時間:<fmt:formatDate
											value='${nowTime}' type='date' /><br> 甲方簽名:<br>
<!-- 											base64轉img -->
											<img src='${QuoteContractBean.s_base64}' height='240' width='240'/>

							
									</label>

								</div>
								<br>
								<div style="width: 50%">
									<label class="fontSize"><br>
										乙方：${QuoteContractBean.p_storeName}(公司/商號)<br> 乙方帳號:
										${memberBean.m_Id}<br> 負責人：${ memberBean.m_Name}<br>
										所在地：${memberBean.m_Add}<br> 電子郵件信箱：${memberBean.m_Id}<br>
										電話：${ memberBean.m_Phone}<br> 聯絡電話：${ memberBean.m_Phone}<br>
										乙方簽章:<br> <!--	圖片 --> <img height='240' width='240'
										src="<c:url value='/quotecontract/getPartnerImage?id=${partnerBean.p_id}' />">

									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
</div>
</div>


<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/html2canvas.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/fragment/footerMVC.jsp" />
</body>
</html>
