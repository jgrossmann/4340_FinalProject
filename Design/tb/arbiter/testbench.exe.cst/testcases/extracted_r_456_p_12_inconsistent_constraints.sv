class c_456_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_456_12;
    c_456_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z10x10z10z000xz00zzzz0x01x0zx1z0xxxzxzxzxxzxzxxzxzzzxxxxzxxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
