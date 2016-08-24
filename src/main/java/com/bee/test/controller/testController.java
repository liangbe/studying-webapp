package com.bee.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by LIANGBE on 8/11/2016.
 */
@Controller
public class testController  {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request) {

        return "index";
    }

    @RequestMapping(value = "/myController", method = RequestMethod.GET)
    public ModelAndView  showPerson(@RequestParam String name){
//        Person p =new Person();
//        if(name.equals("liangbe")){
//            p.setAge(25);
//            p.setName(name);
//            p.setSex("female");
//        }else{
//            p.setAge(0);
//            p.setName("system not found !");
//            p.setSex(null);
//        }
        return new ModelAndView("index");
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
