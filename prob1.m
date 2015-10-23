findSigma = @(x) sqrt(x/2);
b = @(x) 2*findSigma(x)./sqrt(pi);

% Simulation
timestep = .01; %us


% Baseband Signal
a = 10;
Ts = .1; % us
signal = a * ones(1, Ts/timestep);

delays = [0 .2 .4];
powerResponse = [4/7 2/7 1/7];
sigmas = b(powerResponse);
noiseSigma = .01;


for count = 1:100
    rxSize = max(delays)/timestep + 2*length(signal) + 1;
    rx = zeros(1,rxSize);

    rx = .01 *randn(size(rx));

    for index = 1:length(delays)
        path = signal .* raylrnd(sigmas(index),size(signal));
        startIndex = delays(index)/timestep + 1;
        endIndex = startIndex + length(signal) - 1;
        rx(startIndex:endIndex) = rx(startIndex:endIndex) + path;
    end

    plot(0:timestep:max(delays) + 2*Ts,rx)
    axis([0 max(delays) + 2*Ts 0 25])
    pause(.1)
end
