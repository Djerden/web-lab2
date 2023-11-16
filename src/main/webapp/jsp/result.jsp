<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/form.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css">
</head>
<body>
<header>
    <div id="image">
        <a href="https://itmo.ru/"><img src="<%= request.getContextPath()%>/img/small-itmo.png" alt=""></a>
    </div>

    <div id=info>
        <span>
            <a href="#">Горло Евгений</a>
        </span>
        <span>P3218</span>
        <span>
            <a href="#">Вариант №998653</a>
        </span>
    </div>
</header>

<main>
    <div class="wrapper">

        <div class="full-screen">
            <div class="full-screen__body">

                <!--Тело-->
                <div id="image-form"> <!--Общий блок для картинки и формы -->
                    <div class="graph"> <!--Блок для графика-->
                        <div>
                            <svg height="300" width="300" xmlns="http://www.w3.org/2000/svg">
                                <!-- Стрелки и оси -->
                                <line stroke="white" x1="0" x2="300" y1="150" y2="150"></line>
                                <line stroke="white" x1="150" x2="150" y1="0" y2="300"></line>
                                <polygon fill="white" points="150,0 144,15 156,15" stroke="black"></polygon>
                                <polygon fill="white" points="300,150 285,156 285,144" stroke="black"></polygon>

                                <!-- Деления -->
                                <line stroke="white" x1="200" x2="200" y1="155" y2="145"></line>
                                <line stroke="white" x1="250" x2="250" y1="155" y2="145"></line>

                                <line stroke="white" x1="50" x2="50" y1="155" y2="145"></line>
                                <line stroke="white" x1="100" x2="100" y1="155" y2="145"></line>

                                <line stroke="white" x1="145" x2="155" y1="100" y2="100"></line>
                                <line stroke="white" x1="145" x2="155" y1="50" y2="50"></line>

                                <line stroke="white" x1="145" x2="155" y1="200" y2="200"></line>
                                <line stroke="white" x1="145" x2="155" y1="250" y2="250"></line>

                                <!-- Подписи к делениям и осям -->
                                <text fill="white" x="195" y="140">R/2</text>
                                <text fill="white" x="250" y="140">R</text>

                                <text fill="white" x="40" y="140">-R</text>
                                <text fill="white" x="85" y="140">-R/2</text>

                                <text fill="white" x="160" y="55">R</text>
                                <text fill="white" x="160" y="105">R/2</text>

                                <text fill="white" x="160" y="204">-R/2</text>
                                <text fill="white" x="160" y="255">-R</text>

                                <text fill="white" x="285" y="140">X</text>
                                <text fill="white" x="160" y="15">Y</text>

                                <!-- Первая фигура - треугольник -->
                                <polygon fill="darkorange"
                                         fill-opacity="0.2"
                                         stroke="darkorange"
                                         points="150,50 150,150 250,150"></polygon>

                                <!-- Вторая фигура - квадрат -->
                                <polygon fill="darkorange"
                                         fill-opacity="0.2"
                                         stroke="darkorange"
                                         points="250,150 150,150 150,250 250,250"></polygon>

                                <!-- Третья фигура - четверть круга -->
                                <path fill="darkorange"
                                      fill-opacity="0.2"
                                      stroke="darkorange"
                                      d="M 100 150 C 100 200, 150 200, 150 200 L 150 150 Z"></path>

                                <!-- Точка на графике -->
                                <circle r="3.5"
                                        cx=<%=request.getServletContext().getAttribute("xGraph")%>
                                                cy=<%=request.getServletContext().getAttribute("yGraph")%>
                                        id="target-dot"
                                        fill=<%=request.getServletContext().getAttribute("fillGraph")%>>
                                </circle>
                            </svg>
                        </div>
                    </div> <!--Блок для графика-->


                </div> <!--Общий блок для картинки и формы -->

                <div class="back">
                    <a href="<%= request.getContextPath() %>/">Назад</a>
                </div>

                <div class="results"> <!--Блок для результатов-->
                    <table id="result-table">
                        <thead>
                        <tr class="table-header">
                            <th scope="col">X</th>
                            <th scope="col">Y</th>
                            <th scope="col">R</th>
                            <th scope="col">Текущее время</th>
                            <th scope="col">Результат</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!--сюда вставляется результат-->

                            <tr class="<%=request.getServletContext().getAttribute("fillTable")%>">
                                <th><%=request.getServletContext().getAttribute("xLast")%></th>
                                <th><%=request.getServletContext().getAttribute("yLast")%></th>
                                <th><%=request.getServletContext().getAttribute("rLast")%></th>
                                <th><%=request.getServletContext().getAttribute("time")%></th>
                                <th><%=request.getServletContext().getAttribute("resultLast")%></th>
                            </tr>
                        </tbody>
                    </table>
                </div> <!--Блок для результатов-->

            </div>
        </div>
    </div>
</main>
<script type="text/javascript" src="<%= request.getContextPath()%>/js/code.jquery.com_jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/js/script.js"></script>
</body>
</html>

