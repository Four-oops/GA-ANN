function ret=select(individuals,sizepop)
% ��������ÿһ����Ⱥ�е�Ⱦɫ�����ѡ���Խ��к���Ľ���ͱ���
% individuals input  : ��Ⱥ��Ϣ
% sizepop     input  : ��Ⱥ��ģ
% ret         output : ����ѡ������Ⱥ

%����Ӧ��ֵ����
fitness1=10./individuals.fitness;   %individuals.fitnessΪ������Ӧ��ֵ
%����ѡ�����
sumfitness=sum(fitness1);
sumf=fitness1./sumfitness;

%�������̶ķ�ѡ���¸���
index=[]; 
for i=1:sizepop   %תsizepop������
    pick=rand;
    while pick==0    
        pick=rand;        
    end
    for j=1:sizepop    
        pick=pick-sumf(j);        
        if pick<0        
            index=[index j];            
            break;  %Ѱ����������䣬�˴�ת����ѡ����Ⱦɫ��i��ע�⣺��תsizepop�����̵Ĺ����У��п��ܻ��ظ�ѡ��ĳЩȾɫ��
        end
    end
end

%����Ⱥ
individuals.chrom=individuals.chrom(index,:);
individuals.fitness=individuals.fitness(index);
ret=individuals;
 