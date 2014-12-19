class c_93_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_93_12;
    c_93_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1z0zzzz1xx0xzx11z0z01x0x00zx1zxxxzzzxzzzzxxxxxzxxxxzxzxxxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
