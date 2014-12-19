class c_341_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_341_12;
    c_341_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zx00x0zxz1z0zxx00z0z1zz0xx0z11zxzzzzxxxzzxxzzzzxxxxzzzxzzxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
