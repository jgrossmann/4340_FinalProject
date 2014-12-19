class c_922_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_922_12;
    c_922_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x000zx1z010101xxx010100xz0x1xxxzxxxxzzzzxxxzzxzxxxxzzzxzxxzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
