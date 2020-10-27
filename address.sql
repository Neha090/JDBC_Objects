create or replace TYPE address_obj as Object(
        addressId     int,
        street        int,
        city          varchar2(50),
        constructor function address_obj(street int,city varchar2)
    return self as result,
   member procedure create_address
);

create or replace type body address_obj as
constructor function address_obj(street int,city in varchar2)
    return self as result is
  begin
    self.street:=street;
    self.city:=city;
    return;
  end;
    member procedure create_address is
    begin      
    self.addressId := address_sequence.nextval;
        insert into address values(addressId,self.street,self.city);
        commit;
    end;
end;