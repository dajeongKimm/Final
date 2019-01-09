package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tje.dao.*;
import com.tje.model.*;


import java.util.*;

@Service
public class VisitService {

	@Autowired
	private VisitDAO dao;

	public void setDao(VisitDAO dao) {
		this.dao = dao;
	}

	public List<VisitView> visitSelect(VisitView visistView){
		return this.dao.visitSelect(visistView);
	}
}
