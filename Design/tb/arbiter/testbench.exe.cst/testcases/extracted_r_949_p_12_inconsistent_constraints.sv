class c_949_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_949_12;
    c_949_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0010x10z01x11zz01x100z1xxx00x0x1zzxzxzzxxzzxzzzxzxxzxxzxzzxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
