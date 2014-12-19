class c_171_16;
    integer y_pos = 3;
    integer x_pos = 0;
    rand bit[15:0] l_arb_address_i = 16'h899d; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_171_16;
    c_171_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x0xxxzzzzxx001xz101100z1zx110x0xxzxzxzxzxzxzzxxzzxzzxzxxzzzzxxz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
