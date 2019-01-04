package com.tje.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tje.model.DetailRestaurantView;
import com.tje.model.FilterView;
import com.tje.model.MapCoordinate;
import com.tje.model.Member;
import com.tje.model.MenuList;
import com.tje.model.RestaurantReadCount;
import com.tje.model.SearchRank;
import com.tje.model.Visit;
import com.tje.service.RestaurantService;
import com.tje.service.SearchRankService;
import com.tje.service.SimpleReviewService;

@Controller
public class RestaurantController {

	private static final int COUNT = 5;
	private static final int ONE_SECTION = 3;

	@Autowired
	private RestaurantService service;
	@Autowired
	private SimpleReviewService reviewService;
	@Autowired
	private SearchRankService searchRankService;

	// 중복되는 페이징처리
	private Map<String, Integer> setPasing(Model model, int page, int allCount) {

		// 한 페이지에 보이는 컬럼수
		int count = COUNT;
		// 한번에 보이는 페이지 수
		int oneSection = ONE_SECTION;

		int totalPage = allCount / count + (allCount % count != 0 ? 1 : 0);
		if (page < 1 || page > totalPage) {
			return null;
		}

		int startPage = (page - 1) / oneSection * oneSection;
		if (startPage % oneSection == 0) {
			startPage += 1;
		}

		int endPage = startPage + oneSection - 1;
		if (endPage > totalPage) {
			endPage = totalPage; // 총페이지 수보다 끝나는 페이지가 더 크면 전체페이지수로 지정
		}

		// map에 넣어주기.
		Map<String, Integer> map = new HashMap<>();
		map.put("startIdx", (page - 1) * count);
		map.put("count", count);

		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return map;

	}

	@RequestMapping("allRestaurantList")
	public String setAllRestaurant(Model model,
			@RequestParam(name = "page", defaultValue = "1", required = false) int page) {

		// 전체 컬럼수
		int allCount = service.allRestaurantCount();
		Map<String, Integer> map = setPasing(model, page, allCount);
		
		//리뷰...카운트 수

		// 리스트
		model.addAttribute("allRestaurantList", service.selectRestaurant(map));
		return "restaurant/allRestaurantList";
	}
	

	//상세페이지 보기
	@RequestMapping("allRestaurantList/{restaurant_id}")
	public String selectOneRestaurant(Model model, @PathVariable int restaurant_id,
			DetailRestaurantView detailRestaurantView,
			@RequestParam(name = "page", defaultValue = "1", required = false) int page,
			HttpSession session) {
		
		
		//상세페이지 볼때 로그 기록 남기기
		Visit visit = new Visit();
		Member loginMember = (Member)session.getAttribute("loginmember");
		if(loginMember != null) {
			String member_id = loginMember.getMember_id();
			visit.setMember_id(member_id);
			visit.setRestaurant_id(restaurant_id);
			visit.setUrl("allRestaurantList/"+restaurant_id);
		}else if(loginMember == null) {
			visit.setMember_id(null);
			visit.setRestaurant_id(restaurant_id);
			visit.setUrl("allRestaurantList/"+restaurant_id);
		}
		// 조회수 증가 시키기
		RestaurantReadCount restaurantReadCount = new RestaurantReadCount();
		restaurantReadCount.setRestaurant_id(restaurant_id);
		service.increaseCount(restaurantReadCount);

		// 음식점 정보
		detailRestaurantView.setRestaurant_id(restaurant_id);
		model.addAttribute("selectOneRestaurant", service.selectOneRestaurant(detailRestaurantView, visit));

		// 해당 음식점의 메뉴 리스트들 정보
		MenuList menuList = new MenuList();
		menuList.setRestaurant_id(restaurant_id);
		model.addAttribute("menuList", service.selectMenu(menuList));

		// 음식점 상제 지도 정보
		MapCoordinate mapCoordinate = new MapCoordinate();
		mapCoordinate.setRestaurant_id(restaurant_id);
		model.addAttribute("mapCoordinate", service.selectOneMap(mapCoordinate));

		// 리뷰 전체 카운트
		int allCount = reviewService.allCount(restaurant_id);
		if (allCount == 0) {
			model.addAttribute("page", 0);
			return "restaurant/restaurantInfo";
		}
		Map<String, Integer> map = setPasing(model, page, allCount);
		map.put("restaurant_id", restaurant_id);

		model.addAttribute("allReviewCount", allCount);
		model.addAttribute("SimpleReviewList", reviewService.selectList(map));
		//처음엔 2개만 보여주기
		//model.addAttribute("SimpleReviewList", reviewService.get_list(0));
		
		return "restaurant/restaurantInfo";
	}

	// 한식 리스트
	@RequestMapping("allHansikList")
	public String selectHansik(Model model,
			@RequestParam(name = "page", defaultValue = "1", required = false) int page) {
		int allCount = service.allHansikCount();
		if (allCount == 0) {
			model.addAttribute("page", 0);
			return "restaurant/hansikList";
		}
		Map<String, Integer> map = setPasing(model, page, allCount);

		model.addAttribute("hansikList", service.selectHansik(map));
		return "restaurant/hansikList";
	}

	// 치킨/피자 리스트
	@RequestMapping("allChikenAndPizzaList")
	public String selectChikenAndPizza(Model model,
			@RequestParam(name = "page", defaultValue = "1", required = false) int page) {

		int allCount = service.allChikenAndPizzaCount();
		if (allCount == 0) {
			model.addAttribute("page", 0);
			return "restaurant/chikenAndPizzaList";
		}
		Map<String, Integer> map = setPasing(model, page, allCount);

		model.addAttribute("chikenAndPizzaList", service.selectChikenAndPizza(map));
		return "restaurant/chikenAndPizzaList";
	}

	// 양식 리스트
	@RequestMapping("allYangsikList")
	public String selectYangsik(Model model,
			@RequestParam(name = "page", defaultValue = "1", required = false) int page) {

		int allCount = service.allYangsikCount();
		if (allCount == 0) {
			model.addAttribute("page", 0);
			return "restaurant/yangsikList";
		}
		Map<String, Integer> map = setPasing(model, page, allCount);

		model.addAttribute("yangsikList", service.selectYangsik(map));
		return "restaurant/yangsikList";
	}

	// 일식 리스트
	@RequestMapping("allIlsikList")
	public String selectIlsik(Model model,
			@RequestParam(name = "page", defaultValue = "1", required = false) int page) {

		int allCount = service.allIlsikCount();
		if (allCount == 0) {
			model.addAttribute("page", 0);
			return "restaurant/ilsikList";
		}
		Map<String, Integer> map = setPasing(model, page, allCount);

		model.addAttribute("ilsikList", service.selectIlsik(map));
		return "restaurant/ilsikList";
	}

	// 중식리스트
	@RequestMapping("allJungsikList")
	public String selectJungsik(Model model,
			@RequestParam(name = "page", defaultValue = "1", required = false) int page) {

		int allCount = service.allJungsikCount();
		if (allCount == 0) {
			model.addAttribute("page", 0);
			return "restaurant/jungsikList";
		}
		Map<String, Integer> map = setPasing(model, page, allCount);

		model.addAttribute("jungsikList", service.selectJungsik(map));
		return "restaurant/jungsikList";
	}

	// 분식 리스트
	@RequestMapping("allBunsikList")
	public String selectBunsik(Model model,
			@RequestParam(name = "page", defaultValue = "1", required = false) int page) {

		int allCount = service.allBunsikCount();
		if (allCount == 0) {
			model.addAttribute("page", 0);
			return "restaurant/bunsikList";
		}
		Map<String, Integer> map = setPasing(model, page, allCount);

		model.addAttribute("bunsikList", service.selectBunsik(map));
		return "restaurant/bunsikList";
	}

	// 디저트 리스트
	@RequestMapping("allCafeList")
	public String selectCafe(Model model, @RequestParam(name = "page", defaultValue = "1", required = false) int page) {

		int allCount = service.allCafeCount();
		if (allCount == 0) {
			model.addAttribute("page", 0);
			return "restaurant/cafeList";
		}
		Map<String, Integer> map = setPasing(model, page, allCount);

		model.addAttribute("cafeList", service.selectCafe(map));
		return "restaurant/cafeList";
	}
	
	
	
	//검색필터 적용하기 - form
	@RequestMapping("/filter")
	public String filterForm() {
		return "restaurant/filterForm";
	}
	
	//검색필터 적용하기 - result
	@RequestMapping("/filter/result")
	public String filterResult(Model model, FilterView filterView) {
		
		//메뉴타입 가져오기
		filterView.getMenu_type();
		filterView.getMenu_price();
		
		filterView.isService_kidszon();
		filterView.isService_pet();
		filterView.isService_wipi();
		filterView.isService_reservation();
		filterView.isService_takeout();
		filterView.isService_parking();
		filterView.isService_toilet();
		filterView.isService_delivery();
		
		filterView.isDiscount_coupon();
		filterView.isDiscount_mobile();
		filterView.isDiscount_savemoney();
		
		model.addAttribute("filterResult", service.selectFilter(filterView));
		
		return "restaurant/filterResult";
	}
	
	//검색창
	@RequestMapping("/search")
	public String search(Model model,  
							@RequestParam(name="keyword") String keyword,
							SearchRank searchRank) {
		
		searchRank.setKeyword(keyword);
		//기존에 검색된것과 일치하는지를 검사
		SearchRank checkKeyword = (SearchRank)searchRankService.checkKeyword(searchRank);
		if(checkKeyword == null || !searchRank.getKeyword().equals(checkKeyword.getKeyword())) { //기존에 있는것과 다르면 insert
			model.addAttribute("search", service.selectSearch(keyword, searchRank));
		}else { //기존에 있는것과 같으면 update
			searchRankService.updateCount(checkKeyword);
			model.addAttribute("search", service.selectSearch2(keyword));
		}
		
		//model.addAttribute("search", service.selectSearch(keyword, searchRank));
		
		return "restaurant/search";
	}
}
