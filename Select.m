function ret=select(individuals,sizepop)
% 本函数对每一代种群中的染色体进行选择，以进行后面的交叉和变异
% individuals input  : 种群信息
% sizepop     input  : 种群规模
% ret         output : 经过选择后的种群

%求适应度值倒数
fitness1=10./individuals.fitness;   %individuals.fitness为个体适应度值
%个体选择概率
sumfitness=sum(fitness1);
sumf=fitness1./sumfitness;

%采用轮盘赌法选择新个体
index=[]; 
for i=1:sizepop   %转sizepop次轮盘
    pick=rand;
    while pick==0    
        pick=rand;        
    end
    for j=1:sizepop    
        pick=pick-sumf(j);        
        if pick<0        
            index=[index j];            
            break;  %寻找落入的区间，此次转轮盘选中了染色体i，注意：在转sizepop次轮盘的过程中，有可能会重复选择某些染色体
        end
    end
end

%新种群
individuals.chrom=individuals.chrom(index,:);
individuals.fitness=individuals.fitness(index);
ret=individuals;
 