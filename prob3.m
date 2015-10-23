% Signal

signal = [ 0 1 1 1 0 0 1 0 1 0]';

% bpsk
bMod = comm.PSKModulator(2, 'BitInput', true);
bMod.PhaseOffset = 0;
bmodSignal = step(bMod, signal);

% figure(1)
scatterplot((bmodSignal))

shifted1bmodSignal = [0;bmodSignal];
shifted2bmodSignal = [0;shifted1bmodSignal];

boutput = .25 * [bmodSignal; 0; 0];
boutput = boutput + .25 * [shifted1bmodSignal; 0];
boutput = boutput + .25 * [shifted2bmodSignal];

% figure(2)
scatterplot((boutput))

% qpsk
qMod = comm.PSKModulator(4, 'BitInput', true);
qMod.PhaseOffset = 0;
qmodSignal = step(qMod, signal);

% figure(4)
scatterplot((qmodSignal))


shifted1qmodSignal = [0;qmodSignal];
shifted2qmodSignal = [0;shifted1qmodSignal];

qoutput = .25 * [qmodSignal; 0; 0];
qoutput = qoutput + .25 * [shifted1qmodSignal; 0];
qoutput = qoutput + .25 * [shifted2qmodSignal];

% figure(6)
scatterplot((qoutput))
