class c_198_16;
    integer y_pos = 0;
    integer x_pos = 2;
    rand bit[15:0] l_arb_address_i = 16'h5f7d; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_198_16;
    c_198_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0zz11101z0x1x0z0zzx0z011xzxx0xxxzxxxxzzxzxzxxzzzzzxxzxxxxzxzzzx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
