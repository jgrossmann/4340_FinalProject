class c_155_16;
    integer y_pos = 2;
    integer x_pos = 3;
    rand bit[15:0] l_arb_address_i = 16'h5c25; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_155_16;
    c_155_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1100z00zz0xzz1z1xxz111xzx11zzzxzxzzxzxxzxxxzxxzzzzxzzxzzxxxzxx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
