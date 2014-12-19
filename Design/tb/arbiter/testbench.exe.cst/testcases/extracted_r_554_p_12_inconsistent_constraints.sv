class c_554_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_554_12;
    c_554_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x01x0z011xzz0xz100z1z1x01z10xxxzzxzxxxxxxxxzzzzxxzxzxzzzxzzxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
