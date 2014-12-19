class c_181_16;
    integer y_pos = 1;
    integer x_pos = 3;
    rand bit[15:0] l_arb_address_i = 16'hd6a8; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_181_16;
    c_181_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1xxxzz1zzx0z1100xz0z010x0z01x10xxzzzxxxzzxzzxzxzzxxxxzzzxxzzxxz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
