package com.tje.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tje.model.DetailRestaurantView;
import com.tje.service.RestaurantService;

@RestController
public class RestaurantRestController {

	@Autowired
	private RestaurantService service;

	// 음식점 전체 리스트 불러오기
	// 뒤코드 한글 깨짐 방지
	@RequestMapping(value = "m/show/restaurant", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showRestaurant() {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		// list.. 타입임..
		String data = gson.toJson(service.selectStore());

		return data;
	}

	@RequestMapping(value = "m/show/restaurant/info", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showRestaurantInfo(int restaurant_id) {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();

		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("dataStore", service.selectOneStore(restaurant_id));
		dataMap.put("dataMenu", service.selectStoreMenu(restaurant_id));
		dataMap.put("dataReview", service.selectIntroReview(restaurant_id));
		dataMap.put("dataReviewCount", service.selectReviewCount(restaurant_id));
		// 조회수 증가
		service.increaseStore(restaurant_id);

		String data = gson.toJson(dataMap);

		return data;
	}

	@RequestMapping(value = "m/show/search", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showSearchKeword(String keyword) {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		String data = gson.toJson(service.searchStore(keyword));

		return data;
	}

	@RequestMapping(value = "m/show/restaurant/Hansik", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showRestaurantHansik() {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		// list.. 타입임..
		String data = gson.toJson(service.selectHansikStore());

		return data;
	}

	@RequestMapping(value = "m/show/restaurant/Jungsik", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showRestaurantJungsik() {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		// list.. 타입임..
		String data = gson.toJson(service.selectJungsikStore());

		return data;
	}

	@RequestMapping(value = "m/show/restaurant/Ilsik", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showRestaurantIlsik() {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		// list.. 타입임..
		String data = gson.toJson(service.selectIlsikStore());

		return data;
	}

	@RequestMapping(value = "m/show/restaurant/Pizza", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showRestaurantPizza() {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		// list.. 타입임..
		String data = gson.toJson(service.selectPizzaStore());

		return data;
	}

	@RequestMapping(value = "m/show/restaurant/Yangsik", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showRestaurantYangsik() {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		// list.. 타입임..
		String data = gson.toJson(service.selectYangsikStore());

		return data;
	}

	@RequestMapping(value = "m/show/restaurant/Bunsik", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showRestaurantBunsik() {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		// list.. 타입임..
		String data = gson.toJson(service.selectBunsikStore());

		return data;
	}

	@RequestMapping(value = "m/show/restaurant/Coffee", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showRestaurantCoffee() {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		// list.. 타입임..
		String data = gson.toJson(service.selectCafeStore());

		return data;
	}
}
