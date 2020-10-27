create or replace TYPE employees_obj as Object(
        dept dept_obj,
        person person_obj,
        address address_obj,
       member procedure create_employee,
       member procedure read_employees,
        constructor function employees_obj
    return self as result 
);

create or replace type body employees_obj as
   constructor function employees_obj 
    return self as result is
  begin
    return;
  end;
    member procedure create_employee is
    
    begin   
        dept.create_dept;
        person.create_person;
        address.create_address;
        insert into employees values(emp_sequence.nextval,dept.deptId,person.personId,address.addressId);
        commit;
    end;
    
    member procedure read_employees is
    emp number;
    begin
        select empID into emp from employees where deptID=101;
        dbms_output.put_line(emp);
    end;
end;