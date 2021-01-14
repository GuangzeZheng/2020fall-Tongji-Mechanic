# 由AutoCAD建立的既定参数车刀模型

姓名：郑光泽

学号：1851960

专业：机械设计制造及其自动化

指导老师：刘晓东

完成日期：2020年10月11日

# 建立流程

**已知：**

1. 车刀前角 $\gamma_0=15^{\circ}$；
2. 后角 $\alpha_0=10^{\circ}$；
3. 刃倾角 $\lambda_s=+5^{\circ}$；
4. 主偏角 $\kappa_r=45^{\circ}$；
5. 副偏角 $\kappa_r'=30^{\circ}$;
6. 副后角 $\alpha_0'=5^{\circ}$。

**分析：**

1. 首先确定基面，通过主偏角和副偏角确定切削平面；
2. 其次结合切削平面，通过刃倾角和基面找到主切削刃，从而也可得到正交平面；
3. 接着在正交平面上，通过前角和后角可得到前面与主后面；
4. 最后利用在副正交平面上画出副后角，得到副后面，并测得所需前刀面和副后刀面夹角。

# 具体步骤

## 确定基面与切削平面、副切削平面

选择刀具上表面为基面，通过在基面上画出主偏角 $\kappa_r$ 和副偏角 $\kappa_r'$ ，可以得到切削平面和副切削平面。

<img src="C:\Users\zgz\AppData\Roaming\Typora\typora-user-images\image-20201012214412621.png" alt="image-20201012214412621" style="zoom: 67%;" />

​                                              图一：在基面上画出主偏角 $\kappa_r$ 和副偏角 $\kappa_r'$

<img src="C:\Users\zgz\AppData\Roaming\Typora\typora-user-images\image-20201012214427287.png" alt="image-20201012214427287" style="zoom: 67%;" />

​                                              图二：模型上切削平面和副切削平面示意图

## 确定主切削刃

在切削平面上，根据基面画出刃倾角，得到主切削刃。

<img src="C:\Users\zgz\AppData\Roaming\Typora\typora-user-images\image-20201012214321674.png" alt="image-20201012214321674" style="zoom: 67%;" />

​                                              图三：切削平面上主切削刃示意图

<img src="C:\Users\zgz\AppData\Roaming\Typora\typora-user-images\image-20201012214308926.png" alt="image-20201012214308926" style="zoom: 67%;" />

​                                              图四：刃倾角在切削平面上投影

## 获得前面与主后面

在正交平面上根据前角 $\gamma_0$ ，可以获得前面与正交平面的交线，则前面所在平面是该交线和主切削刃相交所构成的平面。

同样在正交平面上，根据后角 $\alpha_0$ ，可以获得主后面与正交平面的交线，则主后面所在平面是该交线与主切削刃相交构成的平面。

<img src="C:\Users\zgz\AppData\Roaming\Typora\typora-user-images\image-20201012222619120.png" alt="image-20201012222619120" style="zoom: 67%;" />

​                                              图五：前角和后角在正交平面上的投影

<img src="C:\Users\zgz\AppData\Roaming\Typora\typora-user-images\image-20201012221302817.png" alt="image-20201012221302817" style="zoom: 67%;" />

​                                              图六：模型上的前面与主后面

## 得到副后面

由副切削平面可得到副正交平面，在该平面上画出副后角，可得到副后面。

<img src="C:\Users\zgz\AppData\Roaming\Typora\typora-user-images\image-20201012224215003.png" alt="image-20201012224215003" style="zoom: 67%;" />

​                                              图七：副后角在副正交平面上的投影

<img src="C:\Users\zgz\AppData\Roaming\Typora\typora-user-images\image-20201012224501280.png" alt="image-20201012224501280" style="zoom: 67%;" />

​                                              图八：模型上的副后面

# 所需参数的测量

## 前刀面和副后刀面夹角的测量

经测量，前刀面和副后刀面夹角的大小为 $76.34^{\circ}$。

<img src="C:\Users\zgz\AppData\Roaming\Typora\typora-user-images\image-20201012224954414.png" alt="image-20201012224954414" style="zoom: 67%;" />

​                                              图九：刀具模型中前刀面和副后刀面夹角的显示