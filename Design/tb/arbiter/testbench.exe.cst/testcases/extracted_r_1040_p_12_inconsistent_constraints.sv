class c_1040_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1040_12;
    c_1040_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxxz0zxzzx101x10x1xxz0x1111zz01zxxxxzzxxzxxzxxxzzxzxzzxzzxxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
