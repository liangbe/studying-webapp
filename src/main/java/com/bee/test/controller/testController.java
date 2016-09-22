package com.bee.test.controller;

import com.bee.test.entity.TypeSupp;
import com.mchange.v2.c3p0.DriverManagerDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


import com.bee.test.service.TypeSuppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LIANGBE on 8/11/2016.
 */
@Controller
public class testController  {

    @Autowired
    TypeSuppService typeSuppService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request) {

        return "index";
    }

    @RequestMapping(value = "/myController", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<?> showPerson(){

        List<TypeSupp> tsList=new ArrayList<TypeSupp>();

            tsList=typeSuppService.findAllDe();

        return new ResponseEntity<Object>(tsList, HttpStatus.OK);
    }


//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doPost(req, resp);
//
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////        System.err.println("---");
//        //解决乱码
//        //qusi
//        Person person=new Person();
//
//        req.setCharacterEncoding("UTF-8");
//        String name=req.getParameter("name");
//        person.setName(req.getParameter("name"));
//        person.setAge(Integer.parseInt(req.getParameter("age")));
//        person.setSex(req.getParameter("sex"));
//        req.setAttribute("person",person);
////        req.setAttribute("name",name);
//        System.out.println(name);
//        req.getRequestDispatcher("index.jsp").forward(req, resp);
//    }



}
