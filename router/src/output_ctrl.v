module output_ctrl(clk, reset,
                    data_N, data_S, data_W, data_E, data_PE,
                    polarity, ready_out,
                    forward_N, forward_S, forward_E, forward_W, forward_PE,
                    grant_N, grant_S, grant_W, grant_E, grant_PE,
                    data_out, send_out);
input clk, reset;
input [63:0] data_N, data_S, data_E, data_W, data_PE;
input polarity;
input forward_N, forward_S, forward_E, forward_W, forward_PE;
input ready_out;
output reg grant_N, grant_S, grant_E, grant_W, grant_PE;
output [63:0] data_out;
output send_out;

reg [63:0] even_buffer;
reg [63:0] odd_buffer;
reg even_buffer_full;
reg odd_buffer_full;

reg [1:0]current_state, next_state;
//states for the arbitration logic state machine
parameter Last_N = 2'b00;
parameter Last_S = 2'b01;
parameter Last_E = 2'b10;
parameter Last_W = 2'b11;

reg [2:0] winner; //winner of the priority in arbitration logic
wire contention;

assign contention = (forward_N & forward_S) | (forward_N & forward_E) | 
                    (forward_N & forward_W) | (forward_N & forward_PE) |
                    (forward_S & forward_E) | (forward_S & forward_W) | 
                    (forward_S & forward_PE) | (forward_E & forward_W) | 
                    (forward_E & forward_PE) | (forward_W & forward_PE);

parameter N = 3'd0;
parameter S = 3'd1;
parameter E = 3'd2;
parameter W = 3'd3;
parameter PE = 3'd4;

assign send_out = ready_out && (polarity ? even_buffer_full : odd_buffer_full); //handshaking

assign data_out = polarity ? even_buffer : odd_buffer; //on odd polarity, even buffer transmits externally, and vice versa

//state memory block   
always @(posedge clk) begin
    if (reset)begin
        even_buffer <= 64'd0;
        odd_buffer <= 64'd0;
        even_buffer_full <= 1'b0;
        odd_buffer_full <= 1'b0;
        //for arbitration fsm
        current_state <= Last_N;
    end
    else begin
        current_state <= next_state;

        //conditions to clear the flag signal that indicates whether the odd/even buffer is full or not
        //cleared based on the external transmission, so opposite phase.
        //if neighoring router is ready on even cycle, the odd buffer transmission if occuring, so clear the odd_buffer_full flag, and vice versa.
        if (polarity == 0 && send_out) begin
                odd_buffer_full <= 1'b0;
            end
        if (polarity == 1 && send_out) begin
                even_buffer_full <= 1'b0;
            end

        case (winner) //choose based on the winner of the arbiter
        N : begin
            if (polarity == 0 && !even_buffer_full && grant_N) begin
                even_buffer <= data_N;
                even_buffer_full <= 1'b1;
            end
            if (polarity == 1 && !odd_buffer_full && grant_N) begin
                odd_buffer <= data_N;
                odd_buffer_full <= 1'b1;
            end 
        end
        S : begin
            if (polarity == 0 && !even_buffer_full && grant_S) begin
                even_buffer <= data_S;
                even_buffer_full <= 1'b1;
            end
            if (polarity == 1 && !odd_buffer_full && grant_S) begin
                odd_buffer <= data_S;
                odd_buffer_full <= 1'b1;
            end 
        end
        E : begin
            if (polarity == 0 && !even_buffer_full && grant_E) begin
                even_buffer <= data_E;
                even_buffer_full <= 1'b1;
            end
            if (polarity == 1 && !odd_buffer_full && grant_E) begin
                odd_buffer <= data_E;
                odd_buffer_full <= 1'b1;
            end 
        end
        W : begin
            if (polarity == 0 && !even_buffer_full && grant_W) begin
                even_buffer <= data_W;
                even_buffer_full <= 1'b1;
            end
            if (polarity == 1 && !odd_buffer_full && grant_W) begin
                odd_buffer <= data_W;
                odd_buffer_full <= 1'b1;
            end 
        end
        PE : begin
            if (polarity == 0 && !even_buffer_full && grant_PE) begin
                even_buffer <= data_PE;
                even_buffer_full <= 1'b1;
            end
            if (polarity == 1 && !odd_buffer_full && grant_PE) begin
                odd_buffer <= data_PE;
                odd_buffer_full <= 1'b1;
            end 
        end
        default: ; // do nothing
        endcase
    end
    end 


//next state logic block and output logic block
always @(*) begin 
    //initialization
    winner = 3'd7;
    next_state = current_state;
    grant_N = 0;
    grant_S = 0;
    grant_E = 0;
    grant_W = 0;
    grant_PE = 0;

    if (contention) begin
        case(current_state)
        Last_N : begin
            if (forward_S)
                winner = S;
            else if (forward_E) 
                winner =   E;
            else if (forward_W)
                winner = W;
            else if (forward_PE)
                winner = PE;
            else if (forward_N)
                winner = N;
            else 
                winner = 3'd7;
        end
        Last_S : begin
            if (forward_E)
                winner = E;
            else if (forward_W)
                winner = W;
            else if (forward_N)
                winner = N;
            else if (forward_PE)
                winner = PE;
            else if (forward_S)
                winner = S;
            else 
                winner = 3'd7;
        end
        Last_E : begin
            if (forward_W)
                winner = W;
            else if (forward_N)
                winner = N;
            else if (forward_S)
                winner = S;
            else if (forward_PE)
                winner = PE;
            else if (forward_E)
                winner = E;
            else 
                winner = 3'd7;
        end
        Last_W : begin
            if (forward_N)
                winner = N;
            else if (forward_S)
                winner = S;
            else if (forward_E)
                winner = E;  
            else if (forward_PE)
                winner = PE;
            else if (forward_W)
                winner = W; 
            else 
                winner = 3'd7;
        end 
        default : begin
            winner = 3'd7;//no requests
        end
    endcase

    case (winner)
    N: next_state = Last_N;
    S: next_state = Last_S;
    E: next_state = Last_E;
    W: next_state = Last_W;
    default: next_state = current_state;
    endcase
    end

    else begin
        next_state = current_state; // state unchanged
        if (forward_N)     
            winner = N;
        else if (forward_S) 
            winner = S;
        else if (forward_E) 
            winner = E;
        else if (forward_W) 
            winner = W;
        else if (forward_PE) 
            winner = PE;
        else 
            winner = 3'd7; // no requests
    end


//output logic 

/*
notice polarity seems flipped here, but external router transmission happens
on opposite phase from the internal transaction between input/output_ctrl
even cycle: 
    internally - even polarity
    externally - odd polarity
odd cycle:
    internally - odd polarity
    externally - even polarity
*/  
    if (polarity ? !odd_buffer_full : !even_buffer_full) begin
        case (winner) 
        N : begin
            grant_N = 1;
            grant_S = 0;
            grant_E = 0;
            grant_W = 0;
            grant_PE = 0;
            
        end
        S : begin
            grant_N = 0;
            grant_S = 1;
            grant_E = 0;
            grant_W = 0;
            grant_PE = 0;
        end
        E : begin
            grant_N = 0;
            grant_S = 0;
            grant_E = 1;
            grant_W = 0;
            grant_PE = 0;
        end
        W : begin
            grant_N = 0;
            grant_S = 0;
            grant_E = 0;
            grant_W = 1;
            grant_PE = 0;
        end
        PE : begin
            grant_N = 0;
            grant_S = 0;
            grant_E = 0;
            grant_W = 0;
            grant_PE = 1;
        end
        default : begin
            grant_N = 0;
            grant_S = 0;
            grant_E = 0;
            grant_W = 0;
            grant_PE = 0;
        end
        endcase
    end
    else begin 
        grant_N = 0;
        grant_S = 0;
        grant_E = 0;
        grant_W = 0;            
        grant_PE = 0;
    end
end
endmodule