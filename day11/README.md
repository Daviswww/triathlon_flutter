# Day11 StatelessWidget & StatfulWidget
<style type="text/css">
    img {
        width: 250px;
        margin:auto;
        display:block;
    }
</style>
StatelessWidget 的意思是沒有狀態的 widget，也就是說不能改變內容，可以利用Stateful Widget的createState將可變的狀態存放在裡面，以app點擊畫面當作範例，可以搭配setState來標記要更新的UI，當下次build的時候就會重新刷新。
![](https://i.imgur.com/Hksssbd.png)