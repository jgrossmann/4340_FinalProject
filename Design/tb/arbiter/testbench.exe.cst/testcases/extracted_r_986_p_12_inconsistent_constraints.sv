class c_986_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_986_12;
    c_986_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x0z0zz1z1z10z0xz0x101x11z1100xxxxxzzzzxzxxxzxxzxxzxzxxxzxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
