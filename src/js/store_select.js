let data = [
    {
        "event": "《Lindsayooo》新興插畫家展",
		"model": "手繪限定油畫",
		"price": "$2,000",
		"image": "../img/store/store01.jpg",
		"type": "展覽限定",
		"countdown": "倒數3天"
    },
    {
        "event": "韶光限定",
		"model": "自訂款迷你保溫瓶",
		"price": "$590",
		"image": "../img/store/store02.jpg",
		"type": "韶光限定",
		"countdown": ""
    },
    {
        "event": "日本畫展",
		"model": "畫家限定簽名",
		"price": "$5,600",
		"image": "../img/store/store03.jpg",
		"type": "展覽限定",
		"countdown": "倒數3天"
    },
    {
        "event": "日本畫展",
		"model": "蒙娜麗莎貓貓掛畫",
		"price": "$960",
		"image": "../img/store/store04.jpg",
		"type": "展覽限定",
		"countdown": "倒數3天"
    },
    {
        "event": "日本畫展",
		"model": "貓貓洗頭掛畫",
		"price": "$900",
		"image": "../img/store/store05.jpg",
		"type": "展覽限定",
		"countdown": "倒數3天"
    },
    {
        "event": "韶光限定",
		"model": "格魯特時鐘",
		"price": "$560",
		"image": "../img/store/store06.jpg",
		"type": "韶光限定",
		"countdown": ""
    },
    {
        "event": "韶光限定",
		"model": "惡夢去去捕夢網",
		"price": "$450",
		"image": "../img/store/store07.jpg",
		"type": "韶光限定",
		"countdown": ""
    },
    {
        "event": "日本畫展",
		"model": "手繪限量明信片組",
		"price": "$990",
		"image": "../img/store/store08.jpg",
		"type": "展覽限定",
		"countdown": "倒數3天"
    },
    {
        "event": "《Lindsayooo》新興插畫家展",
		"model": "手繪限量明信片",
		"price": "$560",
		"image": "../img/store/store09.jpg",
		"type": "展覽限定",
		"countdown": "倒數3天"
    },
    {
        "event": "《ヒグチユウコ》台灣限定特展",
		"model": "限量手繪絲巾",
		"price": "$1,600",
		"image": "../img/store/store10.jpg",
		"type": "展覽限定",
		"countdown": "倒數3天"
    },
    {
        "event": "日本畫展",
		"model": "水彩峰手繪小卡組",
		"price": "$560",
		"image": "../img/store/store11.jpg",
		"type": "展覽限定",
		"countdown": "倒數3天"
    },
    {
        "event": "韶光限定",
		"model": "自訂手工餐盤",
		"price": "$700",
		"image": "../img/store/store12.jpg",
		"type": "韶光限定",
		"countdown": ""
    },
    {
        "event": "韶光限定",
		"model": "限定手繡毛巾",
		"price": "$560",
		"image": "../img/store/store13.jpg",
		"type": "韶光限定",
		"countdown": ""
    },
    {
        "event": "韶光限定",
		"model": "文青手帳本",
		"price": "$400",
		"image": "../img/store/store14.jpg",
		"type": "韶光限定",
		"countdown": ""
    },
    {
        "event": "韶光限定",
		"model": "創作者御用顏料",
		"price": "$560",
		"image": "../img/store/store15.jpg",
		"type": "韶光限定",
		"countdown": ""
    },
    {
        "event": "韶光限定",
		"model": "DIY毛線聖誕樹",
		"price": "$560",
		"image": "../img/store/store16.jpg",
		"type": "韶光限定",
		"countdown": ""
    },
    {
        "event": "日本畫展",
		"model": "山形實木杯墊",
		"price": "$560",
		"image": "../img/store/store17.jpg",
		"type": "展覽限定",
		"countdown": "倒數3天"
    }    
];

var products = "",
	events = "";

for (let i = 0; i < data.length; i++) {
	let event = data[i].event,
		model = data[i].model,
		price = data[i].price,
		rawPrice = price.replace("$",""),
		raw_Price = parseInt(rawPrice.replace(",","")),
		image = data[i].image,
		type = data[i].type,
		countdown = data[i].countdown;
	
	//create product cards
	products += `
			<li class="product events" data-event="${event}" data-model="${model}" data-price="${raw_Price}">
				<a href="../html/product_detail_01.html">
					<div class='product-inner text-center shop__pic'>					
						<img src="${image}">
						<div class='shop__type'>${type}</div>
						<div class='countdown'>${countdown}</div>
					</div>

					<div class='shop__text'>
						<small>${event}</small>
						<h6>${model}</h6>
						<h6>${price}</h6>
					</div>
				</a>
			</li>
	`;
	
	//create dropdown of events
	if (events.indexOf("<option value='" + event + "'>" + event + "</option>") == -1) {
		events += "<option value='" + event + "'>" + event + "</option>";
	}
}

$("#products").html(products);
$(".filter-event").append(events);

let filtersObject = {};

//on filter change
$(".filter").on("change",function() {
	let filterName = $(this).data("filter"),
		filterVal = $(this).val();
		// console.log(filterName); ==> 抓到哪個選取器 (event)
		// console.log(filterVal); ==> 抓到的展覽名稱 (日本畫展)
	
	if (filterVal == "") {
		delete filtersObject[filterName];
	} else {
		filtersObject[filterName] = filterVal;
	}

	// console.log(filtersObject); ==> 顯示key: value {event: 日本畫展}
	
	let filters = "";
	
	for (let key in filtersObject) {
	  	if (filtersObject.hasOwnProperty(key)) {
			filters += "[data-"+key+"='"+filtersObject[key]+"']";
	 	}
	}

	// console.log(filters); ==> [data-event='日本畫展']
	
	if (filters == "") {
		$(".events").show(); // 不選取時會show all
	} else { // 否則只會顯示選取的項目
		// $(".events").hide();
		$(".events").hide().filter(filters).show();
	}
});