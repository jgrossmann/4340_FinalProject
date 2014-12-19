class c_170_16;
    integer y_pos = 2;
    integer x_pos = 0;
    rand bit[15:0] l_arb_address_i = 16'ha1dd; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_170_16;
    c_170_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxzz1x10xzz110z0xzx11010x011zz1xzxzzzzzzxzxzxzxzzxzxxzxzxxxxzxz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
