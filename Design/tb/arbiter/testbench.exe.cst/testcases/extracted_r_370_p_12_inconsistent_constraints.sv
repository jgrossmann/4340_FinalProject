class c_370_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_370_12;
    c_370_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1xxzx1zzx0z110z01xxx0xz0xz00x11zxzxzxzxxxxxzxxzxxzzzzxxzxxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
