class c_474_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_474_12;
    c_474_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z101x0xz0z0z1z0zxz010x101x1xx0x0zxzzxzxxxzzzzzxzzxxzzzzxxzxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
