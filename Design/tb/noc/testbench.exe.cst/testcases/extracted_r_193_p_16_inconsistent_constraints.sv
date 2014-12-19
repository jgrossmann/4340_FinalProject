class c_193_16;
    integer y_pos = 3;
    integer x_pos = 0;
    rand bit[15:0] l_arb_address_i = 16'h899d; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_193_16;
    c_193_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1z01zz11x1xxz1x101x1010000zz1zzzxzzxxzzzxzxxxxzzxzzxzxzxxxzxzxz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
