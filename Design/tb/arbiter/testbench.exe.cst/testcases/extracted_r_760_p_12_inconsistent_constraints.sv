class c_760_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_760_12;
    c_760_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0x11xzxxxz01xxxx01zzz01z1001z1zzxxzxxxxxzxzxxxzzzzzzzzxzzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
