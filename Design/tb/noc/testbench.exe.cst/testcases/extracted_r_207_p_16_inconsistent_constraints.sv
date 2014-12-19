class c_207_16;
    integer y_pos = 0;
    integer x_pos = 0;
    rand bit[15:0] l_arb_address_i = 16'hae01; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[7:4]) != x_pos);
    }
endclass

program p_207_16;
    c_207_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "111xz111xx1x10z11100x0100xz0z1x1zzxxxxxzxxxzzxzzzzzzzxzzxzxzxxzz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
