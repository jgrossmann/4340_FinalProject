class c_215_16;
    integer y_pos = 0;
    integer x_pos = 2;
    rand bit[15:0] l_arb_address_i = 16'hd941; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[7:4]) <= 4'h3);
    }
endclass

program p_215_16;
    c_215_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1101z000zx01zxzx00zzx011z1100001xzzxxxxzxxxxzzxxxzzxxzxxxxxzzzzx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
