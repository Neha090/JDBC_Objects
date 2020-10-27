create or replace TYPE dept_obj as Object(
        deptId     int,
        name       varchar2(50),
        constructor function dept_obj(name varchar2)
    return self as result,
   member procedure create_dept
);

create or replace type body dept_obj as
constructor function dept_obj (name in varchar2)
    return self as result is
  begin
    self.name:= name;
    return;
  end;
    member procedure create_dept is
    begin  
    self.deptId := dept_sequence.nextval;
        insert into dept values(deptId,self.name);
      
    end;
end;