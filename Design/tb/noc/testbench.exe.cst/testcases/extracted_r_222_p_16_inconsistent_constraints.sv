class c_222_16;
    integer y_pos = 3;
    integer x_pos = 3;
    rand bit[15:0] l_arb_address_i = 16'h6e0a; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_222_16;
    c_222_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11zz100x1110zx11zzz10z10xzzz1x01zxxxxxzzxxxxxzzxzzxzzzxxzzzzxzxx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
