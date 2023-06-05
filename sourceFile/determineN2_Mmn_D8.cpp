
#include <iostream>
#include "mex.h"
#include <math.h>



void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[]){	

	double *his,*cumHis;
	double Capacity,d;


	his=mxGetPr(prhs[0]); 
	cumHis=mxGetPr(prhs[1]); 
	Capacity = mxGetScalar(prhs[2]);
	d = mxGetScalar(prhs[3]);


	int mBB = (int)mxGetM(prhs[0]); // 行数mBB为511
	int nBB = (int)mxGetN(prhs[0]); // 列数nBB为16

	double *bestCode,*bestEC,*bestED,*m_out;

	plhs[0]=mxCreateDoubleMatrix(1,nBB,mxREAL); 
	plhs[1]=mxCreateDoubleMatrix(1,1,mxREAL); 
	plhs[2]=mxCreateDoubleMatrix(1,1,mxREAL); 
	plhs[3]=mxCreateDoubleMatrix(1,8,mxREAL); 

	bestCode=mxGetPr(plhs[0]); 
	bestEC = mxGetPr(plhs[1]);
	bestED = mxGetPr(plhs[2]);
	m_out = mxGetPr(plhs[3]);

	double EC,ED,eff=9999;
	int m[] = {-1,-1,-1,-1,-1,-1,-1,-1,-1}; //长度为9，第一个元素没用，后8个对应8个集合的元素个数，-1代表不存在该集合
	int flag[] = {1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};// 长度为17，第一个元素没用，方便后面标记，从1开始，与直方图编号对应
	double disEx = d*d-d+0.5,disSf=d*d;
	int ak = -d+1,bk = d-2;

	for(int j=0;j<=7;j++)
	{
		m_out[j] = m[j+1]; //有1的偏移量，见定义
	}

	for (m[1] = 1;m[1]<=16;m[1]++)
	{
		for (m[2] = 0;m[2]<=16-m[1];m[2]++)
		{
			for (m[3] = 0; m[3] <= 16-m[1]-m[2];m[3]++)
			{
				for (m[4] = 0; m[4] <= 16-m[1]-m[2]-m[3];m[4]++)
				{
					for (m[5] = 0; m[5] <= 16-m[1]-m[2]-m[3]-m[4];m[5]++)
					{
						for (m[6] = 0; m[6] <= 16-m[1]-m[2]-m[3]-m[4]-m[5];m[6]++)
						{
							for (m[7] = 0; m[7] <= 16-m[1]-m[2]-m[3]-m[4]-m[5]-m[6];m[7]++)
							{
								for(int i1=d-1;i1<=d+6;i1++)
								{
									for(int i2=i1;i2<=d+6;i2++)
									{
										for(int i3=i2;i3<=d+6;i3++)
										{
											for(int i4=i3;i4<=d+6;i4++)
											{
												for(int i5=i4;i5<=d+6;i5++)
												{
													for(int i6=i5;i6<=d+6;i6++)
													{
														for(int i7=i6;i7<=d+6;i7++)
														{
															for(int i8=i7;i8<=d+6;i8++)
															{
																for(int i9=i8;i9<=d+6;i9++)
																{
																	for(int i10=i9;i10<=d+6;i10++)
																	{													
																		for(int i11=i10;i11<=d+6;i11++)
																		{
																			for(int i12=i11;i12<=d+6;i12++)
																			{
																				for(int i13=i12;i13<=d+6;i13++)
																				{
																					for(int i14=i13;i14<=d+6;i14++)
																					{
																						for(int i15=i14;i15<=d+6;i15++)
																						{
																							for(int i16=i15;i16<=d+6;i16++)
																							{

																								EC = 0;
																								ED = 0;
																								int temp[] = {i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16}; 

																								for(int j =0;j<=15;j++)
																								{
																									if(j<= m[1] -1)
																									{
																										for(int ind = 0;ind<=d-2;ind++)
																										{
																											EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																											ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																										}

																										if(temp[j] >= d && temp[j] != d+6)
																										{
																											int a = -temp[j]-1,b=temp[j];
																											EC = EC + his[511*j+256+b-1]+his[511*j+256+a-1];
																											ED = ED + (his[511*j+256+b-1]+his[511*j+256+a-1])*disEx + (cumHis[511*j+256+ak-2]-cumHis[511*j+256+a-1]+cumHis[511*j+256+b-2] -cumHis[511*j+256+bk-1])*(d-1)*(d-1)+(cumHis[511*j+256+a-2]+cumHis[511*j+510] -cumHis[511*j+256+b-1])*disSf;
																										}
																										else if(temp[j] == d -1 && temp[j] != d+6)
																										{
																											int a = -temp[j]-1,b=temp[j];
																											EC = EC + his[511*j+256+b-1]+his[511*j+256+a-1];
																											ED = ED + (his[511*j+256+b-1]+his[511*j+256+a-1])*disEx + (cumHis[511*j+256+a-2]+cumHis[511*j+510] -cumHis[511*j+256+b-1])*disSf;
																										}
																										if(temp[j] == d+6)
																										{
																											ED = ED + (cumHis[511*j+256+ak-2]+cumHis[511*j+510]-cumHis[511*j+256+bk-1])*(d-1)*(d-1);
																										}
																									}
																									else if(j>=m[1] && j<=m[1]+m[2]-1)
																									{
																										for(int ind = 0;ind<=d-3;ind++)
																										{
																											EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																											ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																										}

																										//一定有中间像素需要shifting，两对bins肯定不连续
																										if(temp[j] >= bk-1 && temp[j] != d+6)
																										{
																											int a = -temp[j]-1,b=temp[j];
																											EC = EC + his[511*j+256+b-1]+his[511*j+256+a-1];
																											ED = ED + (his[511*j+256+b-1]+his[511*j+256+a-1])*42.5 + (cumHis[511*j+256+ak-2]-cumHis[511*j+256+a-1]+cumHis[511*j+256+b-2] -cumHis[511*j+256+bk-1])*36+(cumHis[511*j+256+a-2]+cumHis[511*j+510] -cumHis[511*j+256+b-1])*49;
																										}

																										if(temp[j] == d+6)
																										{
																											ED = ED + (cumHis[511*j+256+ak-2]+cumHis[511*j+510]-cumHis[511*j+256+bk-1])*36;
																										}
																									}
																									else if(j >= m[1] + m[2] && j <= m[1] + m[2] + m[3] -1)
																									{
																										for(int ind = 0;ind<=d-4;ind++)
																										{
																											EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																											ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																										}

																										//一定有中间像素需要shifting，两对bins肯定不连续
																										if(temp[j] >= bk-1 && temp[j] != d+6)
																										{
																											int a = -temp[j]-1,b=temp[j];
																											EC = EC + his[511*j+256+b-1]+his[511*j+256+a-1];
																											ED = ED + (his[511*j+256+b-1]+his[511*j+256+a-1])*30.5 + (cumHis[511*j+256+ak-2]-cumHis[511*j+256+a-1]+cumHis[511*j+256+b-2] -cumHis[511*j+256+bk-1])*25+(cumHis[511*j+256+a-2]+cumHis[511*j+510] -cumHis[511*j+256+b-1])*36;
																										}

																										if(temp[j] == d+6)
																										{
																											ED = ED + (cumHis[511*j+256+ak-2]+cumHis[511*j+510]-cumHis[511*j+256+bk-1])*25;
																										}
																									}
																									else if(j >= m[1]+m[2]+m[3] && j <= m[1]+m[2]+m[3]+m[4]-1)
																									{
																										for(int ind = 0;ind<=d-5;ind++)
																										{
																											EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																											ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																										}

																										//一定有中间像素需要shifting，两对bins肯定不连续
																										if(temp[j] >= bk-1 && temp[j] != d+6)
																										{
																											int a = -temp[j]-1,b=temp[j];
																											EC = EC + his[511*j+256+b-1]+his[511*j+256+a-1];
																											ED = ED + (his[511*j+256+b-1]+his[511*j+256+a-1])*20.5 + (cumHis[511*j+256+ak-2]-cumHis[511*j+256+a-1]+cumHis[511*j+256+b-2] -cumHis[511*j+256+bk-1])*16+(cumHis[511*j+256+a-2]+cumHis[511*j+510] -cumHis[511*j+256+b-1])*25;
																										}

																										if(temp[j] == d+6)
																										{
																											ED = ED + (cumHis[511*j+256+ak-2]+cumHis[511*j+510]-cumHis[511*j+256+bk-1])*16;
																										}
																									}
																									else if(j >= m[1]+m[2]+m[3]+m[4] && j <= m[1]+m[2]+m[3]+m[4]+m[5]-1)
																									{
																										for(int ind = 0;ind<=d-6;ind++)
																										{
																											EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																											ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																										}

																										//一定有中间像素需要shifting，两对bins肯定不连续
																										if(temp[j] >= bk-1 && temp[j] != d+6)
																										{
																											int a = -temp[j]-1,b=temp[j];
																											EC = EC + his[511*j+256+b-1]+his[511*j+256+a-1];
																											ED = ED + (his[511*j+256+b-1]+his[511*j+256+a-1])*12.5 + (cumHis[511*j+256+ak-2]-cumHis[511*j+256+a-1]+cumHis[511*j+256+b-2] -cumHis[511*j+256+bk-1])*9+(cumHis[511*j+256+a-2]+cumHis[511*j+510] -cumHis[511*j+256+b-1])*16;
																										}

																										if(temp[j] == d+6)
																										{
																											ED = ED + (cumHis[511*j+256+ak-2]+cumHis[511*j+510]-cumHis[511*j+256+bk-1])*9;
																										}
																									}
																									else if(j >= m[1]+m[2]+m[3]+m[4]+m[5] && j <= m[1]+m[2]+m[3]+m[4]+m[5]+m[6]-1)
																									{
																										for(int ind = 0;ind<=d-7;ind++)
																										{
																											EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																											ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																										}

																										//一定有中间像素需要shifting，两对bins肯定不连续
																										if(temp[j] >= bk-1 && temp[j] != d+6)
																										{
																											int a = -temp[j]-1,b=temp[j];
																											EC = EC + his[511*j+256+b-1]+his[511*j+256+a-1];
																											ED = ED + (his[511*j+256+b-1]+his[511*j+256+a-1])*6.5 + (cumHis[511*j+256+ak-2]-cumHis[511*j+256+a-1]+cumHis[511*j+256+b-2] -cumHis[511*j+256+bk-1])*4+(cumHis[511*j+256+a-2]+cumHis[511*j+510] -cumHis[511*j+256+b-1])*9;
																										}

																										if(temp[j] == d+6)
																										{
																											ED = ED + (cumHis[511*j+256+ak-2]+cumHis[511*j+510]-cumHis[511*j+256+bk-1])*4;
																										}
																									}
																									else if(j >= m[1]+m[2]+m[3]+m[4]+m[5]+m[6] && j <= m[1]+m[2]+m[3]+m[4]+m[5]+m[6]+m[7]-1)
																									{
																										for(int ind = 0;ind<=d-8;ind++)
																										{
																											EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																											ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																										}

																										//一定有中间像素需要shifting，两对bins肯定不连续
																										if(temp[j] >= bk-1 && temp[j] != d+6)
																										{
																											int a = -temp[j]-1,b=temp[j];
																											EC = EC + his[511*j+256+b-1]+his[511*j+256+a-1];
																											ED = ED + (his[511*j+256+b-1]+his[511*j+256+a-1])*2.5 + (cumHis[511*j+256+ak-2]-cumHis[511*j+256+a-1]+cumHis[511*j+256+b-2] -cumHis[511*j+256+bk-1])*1+(cumHis[511*j+256+a-2]+cumHis[511*j+510] -cumHis[511*j+256+b-1])*4;
																										}

																										if(temp[j] == d+6)
																										{
																											ED = ED + (cumHis[511*j+256+ak-2]+cumHis[511*j+510]-cumHis[511*j+256+bk-1])*1;
																										}
																									}
																									else if(j >= m[1]+m[2]+m[3]+m[4]+m[5]+m[6]+m[7])
																									{
																										if(temp[j] != d+6)
																										{
																											int a = -temp[j]-1,b=temp[j];
																											EC = EC + his[511*j+256+b-1]+his[511*j+256+a-1];
																											ED = ED + (his[511*j+256+b-1]+his[511*j+256+a-1])*0.5 + (cumHis[511*j+256+a-2]+cumHis[511*j+510] -cumHis[511*j+256+b-1]);
																										}

																									}
																								}

																								if(EC >= (double)Capacity && ED/EC < eff)
																								{
																									bestEC[0] = EC;
																									bestED[0] = ED;
																									eff = ED/EC;

																									for(int j=0;j<=7;j++)
																									{
																										m_out[j] = m[j+1]; //有1的偏移量，见定义
																									}

																									for(int j=0;j<=15;j++)
																									{
																										if(temp[j] == d+6)
																										{temp[j] = 99;}
																										bestCode[j] = temp[j];
																									}
																								}

																							}//for i16
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}	
									}	
								}
							}
						}
					}
				}
			}
		}
	}




}
