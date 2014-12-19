class c_205_16;
    integer y_pos = 3;
    integer x_pos = 3;
    rand bit[15:0] l_arb_address_i = 16'h6e0a; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_205_16;
    c_205_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11x0xxzx10xzx0z010z1z1x0zz01x1zxzxzxzxzzxxzxzxzxzxzzzzzxxzzzzzz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
