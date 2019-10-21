package com.test.cn.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.Pattern;

public class Emp {
    private Short empno;
   @Pattern(regexp="^[\\w]{4,10}$",message="姓名必须由下划线,数字,字母组成！")
    private String ename;

    private String job;

    private Short mgr;

    private Date hiredate;

    private BigDecimal sal;

    private BigDecimal comm;

    private Short deptno;
   //查询员工信息时查询出部门
    private Dept dept;

    
    public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Short getEmpno() {
        return empno;
    }

    public void setEmpno(Short empno) {
        this.empno = empno;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public Short getMgr() {
        return mgr;
    }

    public void setMgr(Short mgr) {
        this.mgr = mgr;
    }

    public Date getHiredate() {
        return hiredate;
    }

    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }

    public BigDecimal getSal() {
        return sal;
    }

    public void setSal(BigDecimal sal) {
        this.sal = sal;
    }

    public BigDecimal getComm() {
        return comm;
    }

    public void setComm(BigDecimal comm) {
        this.comm = comm;
    }

    public Short getDeptno() {
        return deptno;
    }

    public void setDeptno(Short deptno) {
        this.deptno = deptno;
    }
}