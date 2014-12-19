class c_216_16;
    integer y_pos = 1;
    integer x_pos = 2;
    rand bit[15:0] l_arb_address_i = 16'h706d; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_216_16;
    c_216_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz01x110x000xzx000xzz1111x101xzzxzzzzzxxxxzxzxxxxxxzxzzzzzxzxzxz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
