class c_1006_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1006_12;
    c_1006_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11xzz011x0x10zxx1z1xz001zz0zxxx1xxzxzxxxxxxzxxxxzxxxxxxxzxxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
