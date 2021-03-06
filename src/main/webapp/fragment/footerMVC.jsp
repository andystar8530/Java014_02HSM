<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
<!-- Footer -->
<footer class="py-5 footer-light mt-0 mb-0"
	style="background-color: #EDEFFD; color: #000;">
	<div class="container">
		<div class="row">
			<div class="col-md-3 item">
				<h3>網站導覽</h3>
				<ul>
					<li><a href="<c:url value ='/getALLByService/婚禮佈置' />">婚禮佈置</a></li>
					<li><a href="<c:url value ='/getALLByService/婚禮攝影' />">婚禮攝影</a></li>
					<li><a href="<c:url value ='/getALLByService/新娘秘書' />">新娘秘書</a></li>
					<li><a href="<c:url value ='/getALLByService/婚禮主持' />">婚禮主持</a></li>
					<li><a
						href="<c:url value='/_03_listProducts/DisplayPageProducts2' />">小物商城</a></li>
					<li><a href="<c:url value='/_04_forum/posts'/>">討論區</a></li>
				</ul>
			</div>
			<div class="col-md-3 item">
				<h3>平台說明</h3>
				<ul>
					<li><a href="#" data-toggle="modal"
						data-target="#staticBackdrop1">隱私權說明</a></li>
					<li><a href="#" data-toggle="modal"
						data-target="#staticBackdrop2">免責聲明</a></li>
				</ul>
			</div>
			<div class="col-md-3 item">
				<h3>關於我們</h3>
				<ul>
<!-- 					<li><a href="#">關於姻緣聚繪</a></li> -->
					<li><a href="<c:url value='/support/Plateannouncements' />">最新公告</a></li>
					<li><a href="#" data-toggle="modal"
						data-target="#staticBackdrop3">服務條款</a></li>
				</ul>
			</div>
			<div class="col-md-3 item text">
				<h3>聯絡我們</h3>
				<ul>
					<li>地址：106台北市大安區忠孝東路三段1號</li>
					<li>電話：02 2771 2171</li>
				</ul>
			</div>
			<div class="col item social mt-5 ">
				<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
					class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-youtube"></i></a><a
					href="#"><i class="fa fa-instagram"></i></a><a href="#"><i
					class="fa fa-google"></i></a>
			</div>
		</div>
		<p class="m-0 text-center ">Copyright &copy; 姻 緣 聚 繪 2020</p>
	</div>
	<!-- /.container -->
</footer>
<!-- icon -->
<script src="https://kit.fontawesome.com/8e822d04fb.js"
	crossorigin="anonymous"></script>



<!-- Modal -->
<div class="modal fade" id="staticBackdrop1" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel1" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header bg-pink">
				<h5 class="modal-title" id="staticBackdropLabel1"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h2 class="text-center h4 mb-4" data-v-0f50a749>隱私權政策</h2>
				<p data-v-0f50a749>非常歡迎您光臨「姻緣聚繪網站」（以下簡稱本網站），為了讓您能夠安心使用本網站的各項服務與資訊，特此向您說明本網站的隱私權保護政策，以保障您的權益，請您詳閱下列內容：</p>
				<h3 class="h5" data-v-0f50a749>一、隱私權保護政策的適用範圍</h3>
				<p data-v-0f50a749>隱私權保護政策內容，包括本網站如何處理在您使用網站服務時收集到的個人識別資料。隱私權保護政策不適用於本網站以外的相關連結網站，也不適用於非本網站所委託或參與管理的人員。</p>
				<h3 class="h5" data-v-0f50a749>二、個人資料的蒐集、處理及利用方式</h3>
				<p data-v-0f50a749>
					當您造訪本網站或使用本網站所提供之功能服務時，我們將視該服務功能性質，請您提供必要的個人資料，並在該特定目的範圍內處理及利用您的個人資料；非經您書面同意，本網站不會將個人資料用於其他用途。
					本網站在您使用服務信箱、問卷調查等互動性功能時，會保留您所提供的姓名、電子郵件地址、聯絡方式及使用時間等。
					於一般瀏覽時，伺服器會自行記錄相關行徑，包括您使用連線設備的IP位址、使用時間、使用的瀏覽器、瀏覽及點選資料記錄等，做為我們增進網站服務的參考依據，此記錄為內部應用，決不對外公佈。
					為提供精確的服務，我們會將收集的問卷調查內容進行統計與分析，分析結果之統計數據或說明文字呈現，除供內部研究外，我們會視需要公佈統計數據及說明文字，但不涉及特定個人之資料。
				</p>
				<h3 class="h5" data-v-0f50a749>三、資料之保護</h3>
				<p data-v-0f50a749>本網站主機均設有防火牆、防毒系統等相關的各項資訊安全設備及必要的安全防護措施，加以保護網站及您的個人資料採用嚴格的保護措施，只由經過授權的人員才能接觸您的個人資料，相關處理人員皆簽有保密合約，如有違反保密義務者，將會受到相關的法律處分。
					如因業務需要有必要委託其他單位提供服務時，本網站亦會嚴格要求其遵守保密義務，並且採取必要檢查程序以確定其將確實遵守。
					四、網站對外的相關連結</p>
				<p data-v-0f50a749>本網站的網頁提供其他網站的網路連結，您也可經由本網站所提供的連結，點選進入其他網站。但該連結網站不適用本網站的隱私權保護政策，您必須參考該連結網站中的隱私權保護政策。</p>
				<h3 class="h5" data-v-0f50a749>五、與第三人共用個人資料之政策</h3>
				<p data-v-0f50a749>本網站絕不會提供、交換、出租或出售任何您的個人資料給其他個人、團體、私人企業或公務機關，但有法律依據或合約義務者，不在此限。</p>
				<h4 class="h6" data-v-0f50a749>前項但書之情形包括不限於：</h4>
				<ul data-v-0f50a749>
					<li data-v-0f50a749>經由您書面同意。</li>
					<li data-v-0f50a749>法律明文規定。</li>
					<li data-v-0f50a749>為免除您生命、身體、自由或財產上之危險。</li>
					<li data-v-0f50a749>與公務機關或學術研究機構合作，基於公共利益為統計或學術研究而有必要，且資料經過提供者處理或蒐集著依其揭露方式無從識別特定之當事人。</li>
					<li data-v-0f50a749>當您在網站的行為，違反服務條款或可能損害或妨礙網站與其他使用者權益或導致任何人遭受損害時，經網站管理單位研析揭露您的個人資料是為了辨識、聯絡或採取法律行動所必要者。</li>
					<li data-v-0f50a749>有利於您的權益。</li>
					<li data-v-0f50a749>本網站委託商家協助蒐集、處理或利用您的個人資料時，將對委外商家或個人善盡監督管理之責。</li>
				</ul>
				<h3 class="h5" data-v-0f50a749>六、Cookie之使用</h3>
				<p data-v-0f50a749>為了提供您最佳的服務，本網站會在您的電腦中放置並取用我們的Cookie，若您不願接受Cookie的寫入，您可在您使用的瀏覽器功能項中設定隱私權等級為高，即可拒絕Cookie的寫入，但可能會導至網站某些功能無法正常執行
					。</p>
				<h3 class="h5" data-v-0f50a749>七、隱私權保護政策之修正</h3>
				<p data-v-0f50a749>本網站隱私權保護政策將因應需求隨時進行修正，修正後的條款將刊登於網站上。
			</div>
			<div class="modal-footer " style="background-color: #EDEFFD;">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<!--         <button type="button" class="btn btn-primary">Understood</button> -->
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop2" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel2" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header bg-pink">
				<h5 class="modal-title" id="staticBackdropLabel2"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h2 class="text-center h4 mb-4">免責聲明</h2>
				<div class="texts">
					<p class="whos">
						<b>當您成為姻緣聚繪(以下稱「本網站」)的用戶後，即表示你已詳細閱讀及明確瞭解姻緣聚繪之服務條款、隱私權聲明，並同意在下列情況時姻緣聚繪毋需承擔任何責任：</b>
					</p>
					<p>A、
						您使用本服務之風險由您個人負擔。用戶同意使用「本網站」各項服務系基於用戶的個人意願，並同意自負任何風險，包括因為自「本網站」下載資料或圖片，或自「本網站」服務中獲得之資料導致發生任何資源流失等結果。</p>
					<p>B、
						「本網站」就各項服務，不負任何明示或默示之擔保責任。「本網站」不保證各項服務之穩定、安全、無誤、及不中斷；用戶明示承擔使用本服務之所有風險及可能致生之任何損害。</p>
					<p>C、
						用戶在「本網站」上填寫的個人資料、物件資訊、上傳照片等行為，純屬用戶個人行為，「本網站」對其內容之真實性或完整性不負有任何責任。</p>
					<p>D、
						對於透過「本網站」銷售/出租之物件或其他服務，「本網站」對其交易過程及物件/服務本身，均不負任何瑕疵擔保責任。用戶瞭解您透過「本網站」所購得/承租之物件或服務，完全由物件或服務提供人負全責，若有任何瑕疵或擔保責任，均與「本網站」無關。</p>
					<p>E、 由於與本網站連結的其他網站所造成之個人資料洩露及由此而導致的任何法律爭議和後果均與「本網站」無關。</p>
					<p>F、
						「本網站」上刊登的個人廣告、商業廣告及各種商品的促銷資訊，除非屬於本站所自行出售，其內容均係由該個人、廣告商或商品、服務提供人所為，因此產生的糾紛本網站概不負責，「本網站」僅係提供刊登的媒介。</p>
					<p>G、
						「本網站」服務受限於用戶之介接電路或網際網路頻寬及用戶終端設備之品質等因素之影響而有所差異，用戶應確保其自行租用之專線電路、寬頻上網之電路或網路或電話電路等正常運作。用戶同意「本網站」無須對電路及網路之連接品質或傳輸速率等、用戶所擷取資訊資源之正確性與完整及用戶主機運算效能等負責，「本網站」亦毋庸因上開任何因素直接或間接所致「本網站」服務無法使用負任何責任。用戶之系統如發生遭第三人經由網際網路入侵、破壞或擷取其資料等侵害情形，因此所生直接或間接之損失，「本網站」不負賠償責任。</p>
					<p>H、
						如遇電信事業系統發生障礙，「本網站」將依電信事業官方公告之服務層級協議協助用戶儘速排除障礙。如因系統或設備障礙、阻斷等情形，以致發生錯誤、遲滯、中斷或不能傳遞而無法提供「本網站」服務造成損害時，其所生之損害，除按電信事業官方公告外，「本網站」不負任何損害賠償責任。任何非「本網站」提供之第三方軟體服務異常而造成「本網站」服務中斷時，「本網站」均毋庸負任何責任。</p>
					<p>I、
						在無可避免的主機維修、升級、更新、無法控制的因素，及需要重新提供「本網站」服務內容，「本網站」均依電信事業官方所提供之訊息，於暫停主機運作前，通知用戶並協助用戶保持服務之正常情形。暫停服務期間或因必要之測試檢修，而造成不能正常運行時，
						用戶同意「本網站」毋庸負擔任何責任。</p>
					<p>J、
						對於用戶透過「本網站」發佈虛假資訊、及欺騙、敲詐行為者，純屬用戶個人行為，「本網站」對因此而產生的一切糾紛不負有任何責任！特此聲明！</p>
					<p>K、
						「本網站」僅提供資訊交流參考平台，並不涉入其中任何諮詢、交易。「本網站」對各企業及其他相關資訊亦不做任何實質或形式上之審查。就「本網站」所載一切企業資料、產品資料等資訊、文字、照片、圖形、產權、廣告內容或其他資料(以下簡稱『內容』)
						無論其為公開張貼或私下傳送，若有不實或違法情事，均為『內容』提供者之責任，本站概不負責也不承擔任何法律責任。</p>
				</div>
			</div>
			<div class="modal-footer " style="background-color: #EDEFFD;">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<!--         <button type="button" class="btn btn-primary">Understood</button> -->
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop3" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel3" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header bg-pink">
				<h5 class="modal-title" id="staticBackdropLabel3"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h2 class="helptitle">服務條款</h2>
				<div class="texts">
					<h3>第一章 總則</h3>
					<h4>
						<span>■</span>【第一條 目的】
					</h4>
					<p class="nono">
						本服務條款係基於「本公司」對所屬之姻緣聚繪網站(以下簡稱為「本網站」)，在其所提供的網上服務時，<b>會員必須是具備完全行為能力的自然人、或合法登記的法人或團體，並加入會員後即可開始，使用
							姻緣聚繪 所提供的服務。</b>本服務條款之訂立係釐清並規範本公司和會員之間的權利、義務和責任關係爲目的。
					</p>
					<h4>
						<span>■</span>【第二條 服務條款的公佈和使用】
					</h4>
					<p>
						<b>1、</b>本服務條款的內容告示在
						姻緣聚繪的網站上，使用者加入會員或一經到訪、瀏覽和使用本網站，即視為您已閱讀、了解並同意服務條款，若不同意請立即停止使用本網站。
					</p>
					<p>
						<b>2、</b>姻緣聚繪可隨時修訂本服務條款、隱私權保護政策、免責聲明及現今或嗣後頒布施行之各種規則，並將修訂或變更的內容公佈在
						姻緣聚繪 的網站上，至公佈之日起七日內會員無異議時，上開條款、規則、政策或聲明將自動生效。
					</p>
					<h4>
						<span>■</span>【第三條 網站性質】
					</h4>
					<p>
						<b>1、</b><b>姻緣聚繪 只提供一個第三方平臺服務，姻緣聚繪
							不做為使用者與會員簽訂交易合約的一方，而是提供使用者與會員連結平臺之第三方，因此使用者對於婚禮服務有關事項等相關問題皆直接與會員做連繫與交易，而非姻緣聚繪。</b>
					</p>
					<p>
						<b>2、</b><b>姻緣聚繪 並非交易之當事人，姻緣聚繪
							絕不介入使用者與會員間的任何買賣、服務或其他交易行為，對於使用者所獲得的服務或其他交易標的物亦不負任何擔保責任。</b>
					</p>
					<p>
						<b>3、</b><b>雖然姻緣聚繪 在提供服務時會使用商業上合理的技術進行管理並多加注意，但鑒於網路的性質，姻緣聚繪
							無法辨別及判斷物件來源及會員刊登資料是否真實，敬請交易雙方事前自行查明。如交易一方違反法律規定而出現的糾紛與不良結果，由交易雙方自行承擔所有責任，姻緣聚繪
							概不負責。此外，根據適用的相關法律，姻緣聚繪 可能不得限制或免除上述責任。在這種情況下，姻緣聚繪
							應在相關法律的範圍內承擔責任。索賠應於導致索賠原因之事件發生後盡速提出。無正當原因在適用申訴時限外延遲送出之索賠將可能被視為無效。僅受理善意的索賠。</b>
					</p>
					<h4>
						<span>■</span>【第四條 規則以外的準則】
					</h4>
					<p class="nono">本服務條款、隱私權聲明、免責聲明及姻緣聚繪現今或嗣後所頒布施行之各種規則未提及的事項將依個人資料保護法、電子簽章法、消費者保護法等之規定為之。</p>
					<br>
					<h3>第二章 申請服務和許可</h3>
					<h4>
						<span>■</span>【第五條 簽約的成立與使用單位】
					</h4>
					<p>
						<b>1、本服務條款是針對希望使用 姻緣聚繪
							服務之會員（申請加入會員）准許（加入會員成功）所訂立，會員必須是具備完全行為能力的自然人、或合法登記的法人或團體，您同意本服務條款，並加入會員後即可開始，使用
							姻緣聚繪 所提供的服務。</b>
					</p>
					<p>
						<b>2、加入成爲 姻緣聚繪
							會員，會員必須是具備完全行為能力的自然人、或合法登記的法人或團體。如未滿二十歲之未成年人進行本網站之買賣交易時，並應於您的家長（或監護人）閱讀、瞭解並同意本服務條款之所有內容及其後修改變更後，方得使用或繼續使用本服務。當您使用或繼續使用本服務時，即推定您的家長（或監護人）已閱讀、瞭解並同意接受本服務條款之所有內容及其後修改變更。若該未成年會員與交易相對人或其他第三人，因使用本網站服務所發生之糾紛，姻緣聚繪概不負責。</b>
					</p>
					<p>
						<b>3、</b>簽約使用以會員帳號為單位，申請通過之後，申請者即登記成為會員。
					</p>
					<h4>
						<span>■</span>【第六條 服務申請與登記資料】
					</h4>
					<p>
						<b>1、</b>在網路上申請使用服務，依照不同身份必填資料，具體如下：<br> <b>&lt;
							新人/找婚禮服務與店家之用戶 &gt;</b><br> ※會員本人使用的真實電子信箱(作為登入的會員帳號使用，APP用戶除外)<br>
						※會員本人使用的真實行動電話號碼(作為登入的會員帳號使用)<br> ※密碼<br> ※性別<br> <b>&lt;
							店家/提供婚禮相關服務之用戶 &gt;</b><br> ※會員本人使用的真實電子信箱(作為登入的會員帳號使用)<br>
						※會員本人使用的真實行動電話號碼<br> ※店家資料<br> ※密碼<br> ※發票處理資訊<br>
					</p>
					<p>
						<b>2、</b>上述資料必須正確及完整。用假名或他人的身份訊息加入會員者，無法得到法律上的保護且必須為此擔負民法和刑法上所有的責任。
					</p>
					<p>
						<b>3、</b>姻緣聚繪
						就會員註冊資料存有疑問，得暫時停止會員權利並要求會員提供證件確認身份，確認無誤後，會員方可繼續使用姻緣聚繪 提供之服務。
					</p>
					<p>
						<b>4、</b>登錄不實的資料被發現時網站管理者有權利直接停止服務或取消服務簽約，本公司或第三者所受到的損失由涉此事件的會員來承擔負責。
					</p>

					<h4>
						<span>■</span>【第七條 行銷】
					</h4>
					<p>本公司可藉由簡訊、電子郵件、電話等提供會員關於公司買賣服務和其他服務的相關資訊。</p>

					<h4>
						<span>■</span>【第八條 申請服務准許及限制】
					</h4>
					<p>
						<b>1、</b>欲加入會員者在確認第六條第1項所指示的一切資料登錄正確後，申請加入會員即可通過。
					</p>
					<p>
						<b>2、</b>本公司因設備或技術上不足，不得已的狀況下，本公司可以保留申請處理服務之期限。
					</p>
					<p>
						<b>3、</b>有以下任一情形者，不予同意加入會員：
					</p>
					<ul>
						<li><b>A、</b>以他人的名字申請。</li>
						<li><b>B、</b>申請服務時，登錄的資料不實。</li>
						<li><b>C、</b>未滿七歲無行為能力者。</li>
						<li><b>D、</b>違反本服務條款、其他網站規則或會員合約條款，被停權者要再加入者。前揭情事包括經 姻緣聚繪
							確認源自同一IP位址、同一Email或其他可資認定確係為同一被停權者時，亦適用之。</li>
						<li><b>E、</b>與已加入會員的註冊電話或電子信箱同樣時、</li>
						<li><b>F、</b>請求店家提供店家資料以外資料。</li>
						<li><b>G、</b>其他，未履行 姻緣聚繪 之申請使用條件時。</li>
					</ul>
					<br>
					<h3>第三章 使用服務</h3>
					<h4>
						<span>■</span>【第九條 管理會員帳號等】
					</h4>
					<p>
						<b>1、</b>會員帳號或密碼資料不能轉讓、出租或借貸予他人。
					</p>
					<p>
						<b>2、</b>無正當理由，會員不能與他人共用帳號。
					</p>
					<p>
						<b>3、</b>會員自身的帳號被偷竊或遭第三者盜用時，應立即通報 姻緣聚繪 客服，依照客服所指示的步驟處理。
					</p>
					<p>
						<b>4、</b>會員對自身的帳號和密碼因管理不善或不當之疏失，致所發生的一切後果應自行負責。
					</p>

					<h4>
						<span>■</span>【第十條 服務內容】
					</h4>
					<p class="haveul">1、姻緣聚繪 提供以下的服務：</p>
					<ul>
						<li><b>● </b>刊登婚禮相關服務。</li>
						<li><b>● </b>找店家服務。</li>
						<li><b>● </b>網站文字及圖檔服務。</li>
						<li><b>● </b>會員中心。</li>
						<li><b>● </b>公告版。</li>
						<li><b>● </b>其它本網站隨時決定提供給會員的服務項目。</li>
					</ul>
					<p>2、本網站之刊登婚禮服務，係指刊登人為婚禮服務之需要，於本網站刊登婚禮服務資訊服務，姻緣聚繪得因版面調整、定期更換版面設計或優化用戶操作介面之需要，調整刊登頁面中之色彩、版面配置、字體或位置等內容。</p>
					<p>3、服務刊登期間，會員同意姻緣聚繪得免費提供客戶查詢服務、自動配對或其他附屬服務，且會員同意姻緣聚繪得依其自主判斷決定限制客戶於聯絡資訊查詢系統搜尋之數量上限，並得得檢視、搜集、處理及利用會員方之搜尋人才紀錄。</p>
					<p>4、店家方同意姻緣聚繪於刊登期間內，得將店家方之服務刊登訊息等相關圖、文資訊免費於姻緣聚繪旗下經營之其他網站刊登、轉載或揭露，並得定期或不定期以電子郵件、手機簡訊或其他方式提供姻緣聚繪旗下相關網站各項服務或活動訊息予會員方；店家方另同意使用本站服務同時授權姻緣聚繪得使用或利用店家提供之商標及著作。</p>
					<p>5、姻緣聚繪對其提供的服務內容保有隨時變動的權利。</p>
					<p>6、姻緣聚繪
						依照服務的種類，各服務的特性、過程及方法等等相關事項都顯示在網頁上，會員應瞭解並遵循姻緣聚繪所公佈的服務事項。</p>
					<h4>
						<span>■</span>【第十一條 服務的維持和中斷】
					</h4>
					<p class="haveul">
						<b>1、</b>當有以下狀況發生，姻緣聚繪將暫時停止服務：
					</p>
					<ul>
						<li><b>A、</b> 為了進行系統設備檢修或障礙排除工作，不得不停止服務時。</li>
						<li><b>B、</b> 通訊事業者停止電子通訊服務時。</li>
						<li><b>C、</b> 如天災等其他不可歸責於本公司之事由，不得不停止服務時。</li>
					</ul>
					<p>
						<b>2、</b>姻緣聚繪為維護良好服務品質及遇有系統故障時，得定期檢修系統設備及為故障排除，於上開檢修及排除期間，將暫時停止系統服務，惟暫停期間不計入會員原有權益。
					</p>
					<p>
						<b>3、</b>店家與客戶會員雙方若經他人投訴、申訴、BBS反應、檢調警機關、媒體或民意代表揭露訂閱人之行為涉嫌不法情事或嚴重不當者，雙方同意姻緣聚繪得暫停已儲值、加值等服務之相關內容，或限制、調整姻緣聚繪所提供之會員權限，直至澄清事實之日止。
					</p>
					<br>
					<h3>第四章 服務使用</h3>
					<h4>
						<span>■</span>【第十二條 刊登物件】
					</h4>
					<p>
						<b>1、</b>由 姻緣聚繪 提供的服務，進行刊登婚禮服務、店家資料資訊刊登之會員，在刊登及修改時，一定要遵守「<a
							href="/abouts-post_rule.html" target="_blank">姻緣聚繪刊登規則</a>」、「<a
							href="/abouts-term_of_business.html" target="_blank">店家會員服務條款</a>」與「<a
							href="/abouts-term_of_business_premium.html" target="_blank">付費會員服務規範</a>」之規定。
					</p>
					<p>
						<b>2、</b>在 姻緣聚繪 網站上，刊登虛偽不實的訊息，造成自身或他人損失時，會員必須自己負責。
					</p>
					<p>
						<b>3、</b>刊登之內容：
					</p>
					<ul>
						<li>A、已經刊登的物品如欲追加或變更內容，仍需遵守姻緣聚繪刊登物件規則，所追加或變更的內容不得違反姻緣聚繪之相關規定，否則您不可以修改任何已經刊登之物品訊息。
						</li>
						<li>B、除非經姻緣聚繪事先之同意，已經成交之物品訊息，會員不可以刪除。</li>
					</ul>
					<p></p>
					<p>
						<b>4、</b>會員刊登的義務：
					</p>
					<ul>
						<li>A、會員不得刊登非法物件及虛假、偽造之訊息。</li>
						<li>B、會員必須對自己刊登於姻緣聚繪之訊息，保證其真實有效。如說明不足夠或完備時，導致糾紛時，會員應自行負責。</li>
						<li>C、若因不遵守姻緣聚繪相關規定，導致發生的一切後果由會員自行負責。</li>
						<li>D、姻緣聚繪得依其資料維護規範及相關規定終止會員帳戶服務與刪除所有刊登資料之權利。對於會員重複刊登商品或其他違規行為，姻緣聚繪有權對刊登資料進行刪除或修改。
						</li>
					</ul>
					<p></p>
					<p>
						<b>5、</b>會員停權規則：
					</p>
					<p class="pinp">
						姻緣聚繪有權依據「<a href="/abouts-freeze.html" target="_blank">停權處理規範</a>」對違規者停止其會員資格及姻緣聚繪旗下網站各項服務。
					</p>

					<h4>
						<span>■</span>【第十三條 款項圈存】
					</h4>
					<p>姻緣聚繪 有權因以下原因圈存相關人員的帳戶中的款項：</p>
					<ul>
						<li>A、非本人儲值的款項</li>
						<li>B、疑似從事詐騙活動之帳號</li>
						<li>C、檢警調及司法單位下公文要求圈存之款項</li>
						<li>D、申請退款之款項</li>
					</ul>

					<h4>
						<span>■</span>【第十四條 資料提供及處理】
					</h4>
					<p class="nono">姻緣聚繪
						認為必要時，得就會員註冊資料、刊登內容相關之事項等，要求會員即時提出說明及相關資料，並限制會員使用權利包含但不限於移除內容、下架物件、停權等。</p>
					<br>
					<h3>第五章 網站平台費用</h3>
					<h4>
						<span>■</span>【第十五條 店家會員】
					</h4>
					<p class="nono">
						店家會員使用帳戶基本功能皆為免費，使用前述功能，也代表該會員同意/接受「<a
							href="/abouts-term_of_business.html" target="_blank">店家會員服務條款</a>」條款內容。
					</p>
					<h4>
						<span>■</span>【第十六條 購買廣告方案費用】
					</h4>
					<p class="nono">
						姻緣聚繪 提供店家購買廣告方案的服務項目與內容，費用根據本站網頁之廣告方案購買資訊之呈現內容作收取，
						會員在購買本網站提供之服務時，應同意遵守「<a
							href="/abouts-term_of_business_premium.html" target="_blank">付費會員服務規範</a>」，並應詳閱相關廣告方案說明及使用期限，服務與內容逾期無法使用，會員需自行承擔所失，本公司概不負責。
					</p>
					<h4>
						<span>■</span>【第十七條 非姻緣聚繪收取之手續費】
					</h4>
					<p>
						<b>1、</b>您清楚並了解當您選擇使用以下付款方式，須向該銀行支付手續費，此手續費非姻緣聚繪收取，一旦購買成功，該手續費不會退還：
					</p>
					<ul>
						<li>A、銀行付款（包含線上及線下）</li>
						<li>B、信用卡付款</li>
					</ul>
					<p>
						<b>2、</b>前項由該銀行收取之手續費費用，詳見<a href="/abouts-payment.html"
							target="_blank">付款教學</a>。
					</p>
					<p>
						<b>3、</b>購買廣告方案時，店家依不同付款方式所產生之手續費用，一併納入購買廣告方案之訂單金額中做支付。
					</p>

					<h4>
						<span>■</span>【第十八條 付款】
					</h4>
					<p>
						姻緣聚繪 提供多種付款方式，詳細內容請見<a href="/abouts-payment.html" target="_blank">付款教學</a>。
					</p>

					<h4>
						<span>■</span>【第十九條 退費】
					</h4>
					<p>
						<b>1、</b><span class="mark_secondA300">本公司原則上一經付款成功，即表示您已經確認您開始進行姻緣聚繪所提供之全部服務，且視同您了解並使用本公司服務，故將不再退還存入您於本公司帳戶的費用。</span>
					</p>
					<p>
						<b>2、</b>若您例外擁有正當原因需進行退費，您需先聯絡本公司客服中心提出退款請求，且應向本公司說明退款原因。
					</p>
					<p>
						<b>3、</b>店家退款費用 = 原購買金額 - 服務使用區間 –
						退訂手續費。服務使用區間以月為單位，若未足月，則以一個月做計算；退訂手續費為原購買金額之20%。
					</p>
					<p>
						<b>4、</b>本公司收到您的退款申請後，會進行審核，經本公司審核同意您的退款申請且確認您的資料無誤後，本公司方才會進行退款，退款後原使用中網站附贈優惠與服務亦隨之終止，若姻緣聚繪
						因此遭受損害，您應賠償姻緣聚繪所受損失。
					</p>
					<br>
					<h3>第六章 保護個人資料</h3>
					<h4>
						<span>■</span>【第二十條 會員個人資料之蒐集、處理及利用】
					</h4>
					<p class="nono">
						關於您的會員註冊以及其他特定資料依本網站「<a href="/abouts-privacy.html"
							target="_blank">隱私權聲明</a>」受到保護與規範。您了解當您使用本服務時，您同意本網站依據「隱私權聲明」進行您個人資料的蒐集、處理與利用，包括跨國(境)間的國際傳輸與儲存及本網站及其關係企業內部之利用。本網站「隱私權聲明」之訂定均係依中華民國「個人資料保護法」為準則依據。
					</p>
					<br>
					<h3>第七章 移除內容與終止條款</h3>
					<h4>
						<span>■</span>【第二十一條 移除內容】
					</h4>
					<p class="nono">會員在姻緣聚繪 所刊登或發布之內容，應自行備份，當有違反法令、服務條款或其他姻緣聚繪
						內部規則之虞，姻緣聚繪 有權（但無義務）依其自行之考量，直接加以移除，而不需進行事先通知。會員因未進行備份而造成損失，姻緣聚繪
						概不負責。</p>
					<h4>
						<span>■</span>【第二十二條 終止契約或暫停服務】
					</h4>
					<p>
						<b>1、</b><b>姻緣聚繪 於下列情形，得不經事前通知終止契約或暫停服務：</b>
					</p>
					<ul>
						<li><b>A、</b> <b>有相當事證足認消費者有利用支付帳戶為洗錢、詐欺等犯罪行為或不法行為者。</b></li>
						<li><b>B、</b> <b>支付款項經法院裁定或檢察官命令扣押者。</b></li>
						<li><b>C、</b> <b>消費者提交虛偽之身分認證資料，經查證屬實者。</b></li>
						<li><b>D、</b> <b>因同一事由違反服務條款及內部規則達一定次數以上。</b></li>
					</ul>
					<p>
						<b>2、</b><b>會員之終止契約</b>
					</p>
					<p class="nono">
						<b>會員得依雙方約定之方式隨時終止契約。</b>
					</p>
					<br>
					<h3>第八章 損害賠償及免責條款</h3>
					<h4>
						<span>■</span>【第二十三條 免責條款】
					</h4>
					<p>
						<b>1、</b>本平台無實際交貨、遞送及付款方式，實際的付款、遞送、交貨為買賣雙方間為履行權利及義務所生的行為，姻緣聚繪並無介入其中。
					</p>
					<p>
						<b>2、</b>姻緣聚繪 僅提供平台，不涉入會員與交易相對人間之實際交易或其他協定內容，對雙方衍生之糾紛致生之損害賠償，姻緣聚繪
						概不負責。
					</p>
					<p>
						<b>3、</b>關於以下事由，姻緣聚繪 概不負責：
					</p>
					<ul>
						<li><b>A、</b> 戰爭、事變、天災地變等，國家非常事態，不可抗力的狀況。</li>
						<li><b>B、</b> 會員或使用者故意或過失所造成損害賠償。</li>
						<li><b>C、</b> 因通信服務提供業者方面造成之通信障礙。</li>
						<li><b>D、</b> 為了進行補修工作，不得不停止服務時。</li>
						<li><b>E、</b> 其他內容請見<a href="/abouts-laimer.html"
							target="_blank">免責聲明</a>。</li>
					</ul>
					<h4>
						<span>■</span>【第二十四條 代理及保證否認】
					</h4>
					<p>
						<b>1、</b>姻緣聚繪 非會員之代理人
					</p>
					<p>
						<b>2、</b>姻緣聚繪 僅提供網路禮相關刊登服務，姻緣聚繪
						無法保證於刊登期間內一定尋得需求之客戶，亦不保證應徵客戶之品質、品格或其所填資料之完全真實性，會員仍須進行篩選及過濾。與客戶者發生之任何爭議，應由會員與求職者雙方自行依循正當法律途徑解決。
					</p>
					<p>
						<b>3、</b>姻緣聚繪 <b>對於交易物件之真偽、品質、交付及其他交易條件，不負瑕疵擔保與保證之責。</b>
					</p>
					<p>
						<b>4、</b>姻緣聚繪 所有連結網站皆為獨立營運網站，與各會員之間的互動與交易行為姻緣聚繪概不負責。
					</p>

					<h4>
						<span>■</span>【第二十五條 管轄法院】
					</h4>
					<p class="nono">
						關於會員與姻緣聚繪因姻緣聚繪所提供之服務所生之糾紛，將依照中華民國法律規定，並合意以臺灣臺北地方法院為第一審管轄法院。</p>
					<br>
					<h3>第九章 智慧財產的保護</h3>
					<h4>
						<span>■</span>【第二十六條 您對姻緣聚繪之授權】
					</h4>
					<p>「基於對智慧財產權之尊重與維護，您在此聲明任何您上傳、刊載、傳送、輸入或提供予姻緣聚繪之文字、圖片、檔案、說明等資料(以下稱「資料」)，均為您自行創作或得自他人合法授權，您承諾凡非屬您自行創作或得自他人合法授權之任何資料，您均不會將該資料上載、傳送、輸入或提供予姻緣聚繪；任何資料一經您上載、傳送、輸入或提供予姻緣聚繪時，即表示您同意：</p>
					<p>
						<b>1、</b>由姻緣聚繪搜集、儲存、處理、管理或利用該資料，並由姻緣聚繪之搜尋工具進行索引、抓取、公開刊登及使用於本公司其他網站(包括但不限於8591寶物交易網、香港8591寶物交易網、591房屋交易網、香港591房屋交易網、8891汽車交易網、100室內設計、518人力銀行、Tasker出任務、小雞上工等）及合作廠商數字廣告股份有限公司各網站。
					</p>
					<p>
						<b>2、</b>無償、永久、不可撤銷的授權姻緣聚繪可以基於公益或為宣傳、推廣或經營姻緣聚繪服務之目的，進行搜集、處理、使用、利用、修改、重製、公開播送、公開發表、公開傳輸、公開上映、翻譯、改作、散布、發行該等資料，並得在此範圍內將前述權利轉授權他人包括但不限於本公司其他網站、合作廠商及任何第三方。您承諾不會將前述權利再轉授權與他人並保證
						姻緣聚繪
						及上開網站搜集、處理、使用、利用、修改、重製、公開播送、公開發表、公開傳輸、公開上映、翻譯、改作、散布、發行、轉授權該等資料時，不致有侵害任何他人智慧財產權的情事，否則應對
						姻緣聚繪 及其關係企業負損害賠償責任。
					</p>
					<p>
						<b>3、</b>當他人在未經姻緣聚繪同意之情況下，使用上述您所授權於姻緣聚繪之智慧財產權於其他網站時，您同意本公司得以智慧財產權人之地位行使權利，並得以自己名義為訴訟上之行為(包括民、刑事訴訟)。惟請注意，您仍是智慧財產權人，若您授權的智慧財產權有侵權之虞而與第三人涉訟，您須為此負責，亦即訴訟當事人仍是會員您而非姻緣聚繪。」
					</p>
					<h4>
						<span>■</span>【第二十七條 智慧財產的保護】
					</h4>
					<p class="nono">
						姻緣聚繪所使用之軟體、圖片、程式、網站上所有內容或店家提供予需求客戶之資料，包括但不限於設計圖、施工圖、著作、圖片、檔案、資訊、資料、網站畫面的安排、網頁設計均由姻緣聚繪或其他權利人依法擁有其智慧財產權，包括但不限於商標權、專利權、著作權、營業秘密與專有技術等。除與權利人另有約定外，任何人未經
						姻緣聚繪 及權利人授權或同意，不得擅自使用、修改、重製，公開播送、改作、散佈、公開傳輸、公開發表，進行還原工程解編或反向組譯。<br>
						如有違反，除依著作權法及相關法律規定論處，並應對姻緣聚繪負損害賠償責任 ( 包括但不限於訴訟費用及律師費用等 )
					</p>
					<h4>
						<span>■</span>【第二十八條 著作權侵害處理】
					</h4>
					<p class="nono">
						姻緣聚繪尊重他人著作權，亦要求我們的使用者同樣尊重他人著作權，您瞭解並同意我們將依據「<a
							href="/abouts-copyright.html" target="_blank">姻緣聚繪著作權保護政策</a>」保護著作權並處理著作權侵害之事宜。若您認為姻緣聚繪網站中之任何網頁內容已侵害您的著作權，請您詳閱「<a
							href="/abouts-copyright.html" target="_blank">姻緣聚繪著作權保護政策</a>」後填寫「<a
							href="https://statics.marry.com.tw/doc/abouts/marryCIND_2_20171205.zip"
							title="下載著作權侵害通知書">著作權侵害通知書</a>」，並請依該通知書所載，提供相關資料及聲明並經簽名或蓋章後傳真或寄送予姻緣聚繪。
					</p>
					<br>
					<h3>第十章 其他</h3>
					<h4>
						<span>■</span>【第二十九條 各條款獨立】
					</h4>
					<p class="nono">服務條款的各項規定之間具有獨立的效力，任何條款之全部或一部分無效時，不影響其他約定之效力。</p>
					<h4>
						<span>■</span>【第三十條 服務內容公告及變動】
					</h4>
					<p class="nono">關於本合約及服務內容所需的修改變動由姻緣聚繪 決定後 ，透過本站公告事項來告知詳細內容。</p>
				</div>
			</div>
			<div class="modal-footer " style="background-color: #EDEFFD;">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<!--         <button type="button" class="btn btn-primary">Understood</button> -->
			</div>
		</div>
	</div>
</div>

