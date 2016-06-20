clear;

rent = 12000;
tools = 5000;
prototype = 90000;
server = 15000;
extra = 5000;

oneoff = rent + tools + prototype + server + extra;

% -------------------------------------------------

devicesO = 10;
devicesE = 0;
transactionspm = 31;
transactioncost = 0.1;
salarypm = 7500;

% -------------------------------------------------

numcompanies = 10;
numdevicesO = 10;
pricedeviceS = 50;
pricedeviceM = 30;
transactionprice = 0.15;

% --------------------------------------------------

ongoing = (transactioncost*devicesE*transactionspm) + (pricedeviceM*devicesO*numcompanies) + salarypm;
revenue = (numcompanies*pricedeviceS*numdevicesO) + (transactionspm*transactionprice*devicesE);
for i = 1:23
    ongoing = [ongoing; (transactioncost*devicesE*transactionspm) + (pricedeviceM*devicesO*numcompanies) + salarypm];
    revenue = [revenue; (numcompanies*pricedeviceS*numdevicesO) + (transactionspm*transactionprice*devicesE)];
    devicesE = devicesE + numcompanies*devicesO;
    numcompanies = numcompanies*(1+i/70);
end

profit = cumsum(revenue-ongoing)-oneoff;
% plot(ongoing)
% figure
% plot(revenue)
% figure
plot(profit)
grid on
xlabel('Month')
ylabel('Profit (£)')
legend('Estimated profit')
% hold on
% scatter(0,oneoff)