package com.test.hessian;

import com.caucho.hessian.client.HessianProxyFactory;
import com.test.cn.hessian.BaseHessian;

public class HessianClient {
    public static void main(String[] args) {
        try {
            String url = "http://localhost:8080/com.test.cn/hessian";
            HessianProxyFactory factory = new HessianProxyFactory();
            factory.setOverloadEnabled(true);
            BaseHessian basic = (BaseHessian) factory.create(BaseHessian.class, url);
            System.out.println(basic.sayHello());
        }catch (Exception e){
            e.printStackTrace();
        }
    }
  }