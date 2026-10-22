% train_and_classify.m - neural network training, noise test and classification (excerpt)
% Feed-forward neural network (newff, 25 hidden neurons) trained on 240-value
% binary feature vectors to classify 4 classes of paddy leaves.

Sample = 20;              % number of training samples
Sample_Attribute = 240;   % features per sample

p = mfilename('fullpath');
[pathStr, excelFile, ext] = fileparts(p);
imageClass  = strcat(pathStr, '\csvFile\', 'mask_Monochrome_Combined.csv');
imageTarget = strcat(pathStr, '\csvFile\', 'mask_Monochrome_Target.csv');

% import training data and targets
alphabet = csvread(imageClass);
targets  = csvread(imageTarget);

%% create neural network using feedforward
net = newff(alphabet, targets, 25);
net1 = net;
net1.divideFcn = '';

%% train the network
[net1, tr] = train(net1, alphabet, targets);

%% robustness test: add noise and measure the error rate
noise_range = 0:.05:.5;
max_test = 100;
network1 = [];
for noiselevel = noise_range
    errors1 = 0;
    for i = 1:max_test
        x = alphabet + randn(Sample_Attribute, Sample) * noiselevel;
        y = sim(net1, x);
        yy = compet(y);
        errors1 = errors1 + sum(sum(abs(yy - targets))) / 2;
    end
    network1 = [network1 errors1 / Sample / max_test];
end

%% classes
Type1 = 'Type1: Blast Disease';
Type2 = 'Type2: Narrow Brown Spot Disease';
Type3 = 'Type3: Brown Spot Disease';
Type4 = 'Type4: Normal';

%% classify a new leaf (column1 = its 240-value feature vector)
noisyJ = double(column1);
y = sim(net1, noisyJ);
y = compet(y);
answer = find(compet(y) == 1);
if answer == 1
    result = Type1;
elseif answer == 2
    result = Type2;
elseif answer == 3
    result = Type3;
else
    result = Type4;
end
