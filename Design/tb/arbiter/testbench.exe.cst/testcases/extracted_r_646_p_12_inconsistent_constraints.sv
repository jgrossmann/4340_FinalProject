class c_646_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_646_12;
    c_646_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0z1x0zz1x1z1100z0z0011zxz0x001zxxxzxzzzzzzzzzzxxxzzzzzxxxzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
