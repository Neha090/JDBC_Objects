
create or replace TYPE person_obj as Object(
        name       varchar2(50),
        personId int,
     constructor function person_obj(name varchar2)
    return self as result,    
    member procedure create_person
);

create or replace type body person_obj as
    constructor function person_obj (name in varchar2)
    return self as result is
  begin
    self.name:= name;
    return;
  end;
    member procedure create_person is
    begin
      self.personId := person_sequence.nextval;
      insert into person values( self.personId,self.name);
       commit;
    end;
end;