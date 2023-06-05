
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

	int x[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	int flag[] = {1,1,2,3,4,5,6,7,8};// 长度为9，第一个元素没用。从1开始，与集合编号对应
	int m_out[] = {-1,-1,-1,-1,-1,-1,-1,-1}; //各集合元素个数，-1代表该集合不存在
	int m1 = 0;
	int m2 = 0;
	int m3 = 0;
	int m4 = 0;
	int m5 = 0;
	int m6 = 0;
	int m7 = 0;
	int m8 = 0;


	int nn = 100; //让序号大于m的直方图bi递增
	int mm = 100; //让序号大于m的直方图bi递增

	int sumM = 0;

	if(flag[1]-1 < delta)
	{sumM = 16;}
	else
	{sumM = -1;}

	for (int m1 = 1;m1<=sumM;m1++)
	{
		if(flag[2]-1 < delta)
	     {sumM = 16-m1;}
	    else
	    {sumM = -1;}
		for (int m2 = 0;n<=16-m;n++)
		{
			for (int m3 = 0; k <= 16-m-n;k++)
			{
				for (int m4 = 0; l <= 16-m-n-k;l++)
				{
					for (int m5 = 1;m<=16;m++)
					{
						for (int m6 = 0;n<=16-m;n++)
						{
							for (int m7 = 0; k <= 16-m-n;k++)
							{
								for (int m8 = 0; l <= 16-m-n-k;l++)
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
																										if(j<= m -1)
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
																										else if(j>=m && j<=m+n-1)
																										{
																											for(int ind = 0;ind<=d-3;ind++)
																											{
																												EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																												ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																											}

																											//一定有中间像素需要shifting，两对bins肯定不连续
																											if(temp[j] >= 4 && temp[j] != d+6)
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
																										else if(j >= m + n && j <= m + n + k -1)
																										{
																											for(int ind = 0;ind<=d-4;ind++)
																											{
																												EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																												ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																											}

																											//一定有中间像素需要shifting，两对bins肯定不连续
																											if(temp[j] >= 4 && temp[j] != d+6)
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
																										else if(j >= m + n + k && j <= m+n+k+l-1)
																										{
																											for(int ind = 0;ind<=d-5;ind++)
																											{
																												EC = EC + his[511*j+256+ind-1]+his[511*j+256-ind-2];
																												ED = ED + (his[511*j+256+ind-1]+his[511*j+256-ind-2])*(ind*ind+ind+0.5);
																											}

																											//一定有中间像素需要shifting，两对bins肯定不连续
																											if(temp[j] >= 4 && temp[j] != d+6)
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
																										else if(j >= m + n + k+l)
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
																										m_out[0] = m;
																										n_out[0] = n;
																										k_out[0] = k;
																										l_out[0] = l;
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



}
